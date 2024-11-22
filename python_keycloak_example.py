# pylint: disable=broad-exception-caught, too-many-locals, import-self
"""CRUD Operation to handle keycloak users"""
from base64 import b64decode
import inspect
# import base64
import json
import os
import ast

from cryptography.hazmat.primitives import serialization
from fastapi.security import APIKeyHeader
from fastapi import Depends, HTTPException
import jwt
from jwt.exceptions import DecodeError, InvalidTokenError  # , ExpiredSignatureError

from keycloak import KeycloakAdmin, KeycloakOpenID
from app.audit_log import define_logger
from app.config import config
from app.models.keycloak import BaseKeyCloak
from app.general import error_response_model, generate_id  # , local_time_to_gmt_epoch
from app.crud.smtp import send_email
from app.constant import error_messages

# oauth2_scheme = OAuth2PasswordBearer(
#     tokenUrl=f"{config['keycloak_url']}/realms/{config['keycloak_realm']}/protocol/openid-connect/token")

oauth2_scheme = APIKeyHeader(name='Authorization')


def keycloak_openid_instance():
    """Initialize KeycloakOpenID instance"""
    keycloak_openid = KeycloakOpenID(
        server_url=config['keycloak_url'],
        client_id=config['keycloak_client_open_id'],
        realm_name=config['keycloak_realm'],
        client_secret_key=config['keycloak_client_secret'])
    return keycloak_openid


def keycloak_instance():
    """Initialize KeycloakAdmin instance"""
    keycloak_admin = KeycloakAdmin(
        server_url=config['keycloak_url'],
        client_id=config['keycloak_client_id'],
        client_secret_key=config['keycloak_client_secret'],
        realm_name=config['keycloak_realm'],
        verify=True)
    return keycloak_admin


global_keycloak_openid = keycloak_openid_instance()


def keycloak_create_user(data_in: BaseKeyCloak):
    """Creating a user in keycloak"""
    try:
        password = config['default_password']
        password = data_in.password if data_in.password else password

        all_attributes = {}
        if data_in.role:
            all_attributes["role"] = str(data_in.role)
        if data_in.user_id:
            all_attributes["userid"] = data_in.user_id
        if data_in.firm_id:
            all_attributes["firm_id"] = data_in.firm_id

        user_data = {
            'username':
            data_in.mobile,
            'email':
            data_in.email,
            'firstName':
            data_in.first_name,
            'lastName':
            data_in.last_name,
            'enabled':
            True,
            'attributes':
            all_attributes,
            'credentials': [{
                'type': 'password',
                'value': password,
                'temporary': False
            }],
            'emailVerified':
            True,
        }

        keycloak_admin = keycloak_instance()
        created_user = keycloak_admin.create_user(user_data)
        return [created_user]
    except Exception as exception:
        response_text = exception.args[0]
        response_json = json.loads(response_text)
        error_message = response_json.get('errorMessage')
        error_message = error_message if error_message else response_json.get(
            'error_description')
        return [None, error_message]


def get_keycloak_user(keycloak_user_id):
    """Get a user by keycloak user id"""
    try:
        keycloak_admin = keycloak_instance()
        user = keycloak_admin.get_user(keycloak_user_id)
        return user
    except Exception as exception:
        response_text = exception.args[0].decode('utf-8')
        response_json = json.loads(response_text)
        error_message = response_json["error"]
        return error_message


def get_keycloak_users():
    """Get all users in the realm"""
    keycloak_admin = keycloak_instance()
    users = keycloak_admin.get_users()
    return users


def delete_all_keycloak_users():
    """Delete all the users in the keycloak"""
    keycloak_admin = keycloak_instance()
    all_users = get_keycloak_users()
    for user in all_users:
        keycloak_admin.delete_user(user['id'])
    return True


def delete_keycloak_user(keycloak_user_id):
    """Delete a user using keycloak user id"""
    try:
        keycloak_admin = keycloak_instance()
        keycloak_admin.delete_user(keycloak_user_id)
        return True
    except Exception as exception:
        response_text = exception.args[0].decode('utf-8')
        response_json = json.loads(response_text)
        error_message = response_json["error"]
        return error_message


def update_keycloak_user(userid: str, new_attributes: dict):
    """Update a user's attributes"""
    try:
        keycloak_admin = keycloak_instance()
        user = keycloak_admin.get_user(userid)
        if 'role' in new_attributes:
            user['attributes']['role'] = new_attributes['role']
        if 'email' in new_attributes:
            user['email'] = new_attributes['email']
        if 'mobile' in new_attributes:
            user['username'] = new_attributes['mobile']
        if 'first_name' in new_attributes:
            user['firstName'] = new_attributes['first_name']
        if 'last_name' in new_attributes:
            user['lastName'] = new_attributes['last_name']
        keycloak_admin.update_user(userid, user)
        return True
    except Exception as exception:
        response_text = exception.args[0].decode('utf-8')
        response_json = json.loads(response_text)
        error_message = response_json["errorMessage"]
        return error_message


async def update_keycloak_user_password(userid: str, password: str):
    """Update a user's password"""
    try:
        keycloak_admin = keycloak_instance()
        if password:
            keycloak_admin.set_user_password(user_id=userid,
                                             password=password,
                                             temporary=False)
        else:
            new_temp_password = await generate_id(8)
            keycloak_admin.set_user_password(user_id=userid,
                                             password=new_temp_password,
                                             temporary=True)
            user = keycloak_admin.get_user(userid)
            recipient_email = user['email']
            body = "This is your new temporary password to login: " + \
                str(new_temp_password)+'\n'+'\n'+'Regards,'+'\n'+'Nom Nom Team'
            success = send_email(recipient_email, body)
            if not success:
                raise HTTPException(status_code=403,
                                    detail="Mail was not sent")
        return True
    except Exception as exception:
        response_text = exception.args[0].decode('utf-8')
        response_json = json.loads(response_text)
        error_message = response_json["error"]
        return error_message


def update_keycloak_user_status(userid: str, is_enabled: bool):
    """Update a user's attributes"""
    try:
        keycloak_admin = keycloak_instance()
        user = keycloak_admin.get_user(userid)
        user['enabled'] = is_enabled
        keycloak_admin.update_user(userid, user)
        return True
    except Exception as exception:
        response_text = exception.args[0].decode('utf-8')
        response_json = json.loads(response_text)
        error_message = response_json["error"]
        return error_message


def get_user_by_token(token: str = Depends(oauth2_scheme)):
    """Get user details using token"""
    loggerName = inspect.stack()[0]
    pid = os.getpid()
    try:
        global_keycloak_openid = keycloak_openid_instance()
        key_der_base64 = global_keycloak_openid.public_key()

        key_der = b64decode(key_der_base64.encode())
        public_key = serialization.load_der_public_key(key_der)

        # Decode JWT token
        user_base_detail = jwt.decode(token,
                                      public_key,
                                      algorithms=["RS256"],
                                      audience='account')

        # Example of using the decoded token
        print("Decoded user details:", user_base_detail)

        keycloak_admin = keycloak_instance()

        # Check if the token is active
        if user_base_detail['sub']:
            user = keycloak_admin.get_user(user_base_detail['sub'])
            # Add user details as needed
            enabled = user.get("enabled")
            if not enabled:
                error_response = error_response_model(code=401,
                                                      error_code=6007)
                define_logger(level=30,
                              loggName=loggerName,
                              pid=pid,
                              message=error_messages[6007])
                raise HTTPException(status_code=401, detail=error_response)

            role = user.get('attributes', {}).get('role', [])
            if "'" in role[0] or '"' in role[0]:
                role = ast.literal_eval(role[0]) if role[0] else [""]

            user_details = {
                'userid': user['attributes']['userid'][0],
                'email': user.get('email'),
                'username': user['username'],
                'firstname': user['firstName'],
                'lastname': user['lastName'],
                'name': user['firstName'] + ' ' + user['lastName'],
                'role': role,
            }

            return user_details
        error_response = error_response_model(code=401, error_code=4003)
        define_logger(level=30,
                      loggName=loggerName,
                      pid=pid,
                      message=error_messages[4003])
        raise HTTPException(status_code=401, detail=error_response)

    except (DecodeError, InvalidTokenError) as exception:
        # Handle the specific exception(s) raised by jwt.decode()
        error_response = error_response_model(code=401, error_code=4003)
        define_logger(level=30,
                      loggName=loggerName,
                      pid=pid,
                      message=error_messages[4003])
        raise HTTPException(status_code=401,
                            detail=error_response) from exception

    except HTTPException as exception:
        raise HTTPException(status_code=401,
                            detail=exception.detail) from exception

    except Exception as exception:
        # Handle any exceptions that occur during the process
        raise HTTPException(status_code=401,
                            detail=str(exception)) from exception


def create_token(username: str, password: str):
    """Creates token for given username and password"""
    try:
        keycloak_openid = keycloak_openid_instance()
        user_token = keycloak_openid.token(username=username,
                                           password=password,
                                           grant_type='password')
        return user_token, ""
    except Exception as exception:
        if isinstance(exception.args[0], str):
            error_message = exception.args[0]
        else:
            response_text = exception.args[0].decode('utf-8')
            response_json = json.loads(response_text)
            error_message = response_json["error"]
            if response_json.get("error_description"):
                error_message = response_json["error_description"]
        return "", error_message


def recreate_token(refresh_token: str):
    """Creates token for given refresh token"""
    try:
        keycloak_openid = keycloak_openid_instance()
        user_token = keycloak_openid.refresh_token(refresh_token=refresh_token)
        return user_token
    except Exception as exception:
        if isinstance(exception.args[0], str):
            error_message = exception.args[0]
        else:
            response_text = exception.args[0].decode('utf-8')
            response_json = json.loads(response_text)
            error_message = response_json["error"]
            if response_json.get("error_description"):
                error_message = response_json["error_description"]
        return error_message


def log_out(token: str):
    """Function to make the keyclaok token invalid"""
    try:
        keycloak_openid = keycloak_openid_instance()
        user_token = keycloak_openid.logout(refresh_token=token)
        return user_token
    except Exception as exception:
        if isinstance(exception.args[0], str):
            error_message = exception.args[0]
        else:
            response_text = exception.args[0].decode('utf-8')
            response_json = json.loads(response_text)
            error_message = response_json["error"]
            if response_json.get("error_description"):
                error_message = response_json["error_description"]
        return error_message
