--
-- PostgreSQL database dump
--

-- Dumped from database version 11.20
-- Dumped by pg_dump version 11.20

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO bn_keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO bn_keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO bn_keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO bn_keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO bn_keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO bn_keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO bn_keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO bn_keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO bn_keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO bn_keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO bn_keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO bn_keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO bn_keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO bn_keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO bn_keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO bn_keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO bn_keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO bn_keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO bn_keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO bn_keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO bn_keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO bn_keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO bn_keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO bn_keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO bn_keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO bn_keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO bn_keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO bn_keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO bn_keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO bn_keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO bn_keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO bn_keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO bn_keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO bn_keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO bn_keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO bn_keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO bn_keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO bn_keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO bn_keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO bn_keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO bn_keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO bn_keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO bn_keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO bn_keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO bn_keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO bn_keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO bn_keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO bn_keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO bn_keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO bn_keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO bn_keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO bn_keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO bn_keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO bn_keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO bn_keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO bn_keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO bn_keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO bn_keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO bn_keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO bn_keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO bn_keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO bn_keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO bn_keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO bn_keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO bn_keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO bn_keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO bn_keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO bn_keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO bn_keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO bn_keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO bn_keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO bn_keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO bn_keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO bn_keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO bn_keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO bn_keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO bn_keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO bn_keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO bn_keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO bn_keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO bn_keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO bn_keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO bn_keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO bn_keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO bn_keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO bn_keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO bn_keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO bn_keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO bn_keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO bn_keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO bn_keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO bn_keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
9078c39e-7ec8-4ed2-8b27-18e76dd42148	\N	auth-cookie	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	639d6d0e-9681-48e3-a6d2-4c2ce101a587	2	10	f	\N	\N
6ced9145-2900-499b-80ea-1139e21f24fd	\N	auth-spnego	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	639d6d0e-9681-48e3-a6d2-4c2ce101a587	3	20	f	\N	\N
2b645a09-07db-435e-9532-1839fee050c4	\N	identity-provider-redirector	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	639d6d0e-9681-48e3-a6d2-4c2ce101a587	2	25	f	\N	\N
9c5e1f57-6f9e-421a-acb5-aa16d7f8ffcf	\N	\N	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	639d6d0e-9681-48e3-a6d2-4c2ce101a587	2	30	t	45bd9427-c254-4876-9107-d626631be31a	\N
109e744a-01da-4ed5-a21d-43ff32d47bd3	\N	auth-username-password-form	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	45bd9427-c254-4876-9107-d626631be31a	0	10	f	\N	\N
d1cbe5fa-5d11-413e-95d5-07133a7f9adf	\N	\N	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	45bd9427-c254-4876-9107-d626631be31a	1	20	t	1f368b6f-6df3-4f9e-979d-49b02dff5d5b	\N
219f86c4-5f18-4f40-86f0-99c67cfed451	\N	conditional-user-configured	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	1f368b6f-6df3-4f9e-979d-49b02dff5d5b	0	10	f	\N	\N
72bf7329-6efc-464c-aa7e-839fcd81f5b7	\N	auth-otp-form	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	1f368b6f-6df3-4f9e-979d-49b02dff5d5b	0	20	f	\N	\N
f50d20a9-d8b1-4d05-b697-fb0e98b2fbfb	\N	direct-grant-validate-username	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	88c7fb6c-4ebc-43db-81dd-bf2c7ca7c63e	0	10	f	\N	\N
60ec73c5-6a8c-42b9-b6db-d629ddd03512	\N	direct-grant-validate-password	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	88c7fb6c-4ebc-43db-81dd-bf2c7ca7c63e	0	20	f	\N	\N
c7e83696-d742-4c03-93b2-60ca744d66d6	\N	\N	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	88c7fb6c-4ebc-43db-81dd-bf2c7ca7c63e	1	30	t	865899df-3c24-4fe1-8d42-52900af5b2d8	\N
e84ce146-99d3-480b-b348-dc4726edbda6	\N	conditional-user-configured	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	865899df-3c24-4fe1-8d42-52900af5b2d8	0	10	f	\N	\N
66a6bf6e-0095-4126-b241-e61c0c42fb60	\N	direct-grant-validate-otp	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	865899df-3c24-4fe1-8d42-52900af5b2d8	0	20	f	\N	\N
62aaf0b4-7d64-479f-9db4-a6b5b837fb1f	\N	registration-page-form	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	ab0e149e-0743-476b-b2fd-641f3d86c9fe	0	10	t	793d7070-bcf2-4a53-9f46-51a0211188c6	\N
8555f4cf-5723-46cc-8006-042f8a994603	\N	registration-user-creation	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	793d7070-bcf2-4a53-9f46-51a0211188c6	0	20	f	\N	\N
155aa145-a867-4a4b-a1fa-53212ff1d676	\N	registration-profile-action	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	793d7070-bcf2-4a53-9f46-51a0211188c6	0	40	f	\N	\N
630705f4-4cb1-4dc2-8e6e-89d0132f93b7	\N	registration-password-action	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	793d7070-bcf2-4a53-9f46-51a0211188c6	0	50	f	\N	\N
ce1ddffd-9218-426d-a575-4711b29b5cc3	\N	registration-recaptcha-action	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	793d7070-bcf2-4a53-9f46-51a0211188c6	3	60	f	\N	\N
5b82c70d-ea3d-442b-a3a4-fb916ad17983	\N	reset-credentials-choose-user	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	2aa3e096-bf45-40ed-89ad-0f097d998005	0	10	f	\N	\N
a12c5b4e-0540-4f67-84c8-7296e8874902	\N	reset-credential-email	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	2aa3e096-bf45-40ed-89ad-0f097d998005	0	20	f	\N	\N
34937bf0-858c-4c5f-9f6c-9ee3691b883b	\N	reset-password	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	2aa3e096-bf45-40ed-89ad-0f097d998005	0	30	f	\N	\N
6fb0a8ee-f3a0-4b0e-b087-f67cb01669c9	\N	\N	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	2aa3e096-bf45-40ed-89ad-0f097d998005	1	40	t	ceeb39d8-a0ac-46e5-8145-04747790d336	\N
22a96090-b668-4bc5-af32-4b18ba4a2171	\N	conditional-user-configured	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	ceeb39d8-a0ac-46e5-8145-04747790d336	0	10	f	\N	\N
cb2f6bc1-c48d-4919-907d-3d2859cb77d0	\N	reset-otp	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	ceeb39d8-a0ac-46e5-8145-04747790d336	0	20	f	\N	\N
3c84e107-fadb-4943-b9c9-f62a92247066	\N	client-secret	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	e5fae8de-9aba-4fbf-8d2e-6f94ceb399e3	2	10	f	\N	\N
8ed810a5-6e7b-4c1c-85fc-4737e9063f49	\N	client-jwt	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	e5fae8de-9aba-4fbf-8d2e-6f94ceb399e3	2	20	f	\N	\N
c4a6ddc0-da9b-4b68-a172-7a728c6292ac	\N	client-secret-jwt	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	e5fae8de-9aba-4fbf-8d2e-6f94ceb399e3	2	30	f	\N	\N
6b97f008-241c-40af-962a-98d2aa4b2d21	\N	client-x509	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	e5fae8de-9aba-4fbf-8d2e-6f94ceb399e3	2	40	f	\N	\N
951c99f6-dccf-4718-96bb-1cd6cd2a4473	\N	idp-review-profile	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	7ec1ca8e-0fad-4d78-9aaa-5bd8e56088fe	0	10	f	\N	f833d445-9680-4203-b54d-fd382d7c95d7
c768476a-f76a-46d8-bb13-3dc3bce9a654	\N	\N	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	7ec1ca8e-0fad-4d78-9aaa-5bd8e56088fe	0	20	t	2219b590-fd97-46eb-a46e-dbac9ddaf64c	\N
e7d64934-48af-41fc-9297-bfe3cb68c432	\N	idp-create-user-if-unique	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	2219b590-fd97-46eb-a46e-dbac9ddaf64c	2	10	f	\N	0117998f-56e9-41cf-a22c-8c74f81af760
162206b3-3080-4715-957b-4193e34c66c3	\N	\N	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	2219b590-fd97-46eb-a46e-dbac9ddaf64c	2	20	t	4483c851-30bc-4494-bf28-831554d710e8	\N
84ac8f71-09db-487e-982e-91dc478e16fd	\N	idp-confirm-link	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	4483c851-30bc-4494-bf28-831554d710e8	0	10	f	\N	\N
92dc958b-b8eb-4870-a42e-07f7edbd4502	\N	\N	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	4483c851-30bc-4494-bf28-831554d710e8	0	20	t	67eb5687-5b39-4822-a5f3-d46878e46d8e	\N
2f06ad62-4499-44fb-9b6b-b84a82ceda7c	\N	idp-email-verification	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	67eb5687-5b39-4822-a5f3-d46878e46d8e	2	10	f	\N	\N
eace03e8-a8dd-4ba7-aa79-dcb27ebd5b29	\N	\N	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	67eb5687-5b39-4822-a5f3-d46878e46d8e	2	20	t	c519b78f-0f39-4ef4-8b8b-c14a849b336d	\N
9ab64742-120d-4852-8600-419747d2511d	\N	idp-username-password-form	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	c519b78f-0f39-4ef4-8b8b-c14a849b336d	0	10	f	\N	\N
e8e097fb-2feb-49bb-bbd4-28b9ff25278d	\N	\N	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	c519b78f-0f39-4ef4-8b8b-c14a849b336d	1	20	t	1de1bd07-262d-466b-b3e9-08396bb0971c	\N
a70c7193-a7c7-4648-b71d-a9eedb882a27	\N	conditional-user-configured	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	1de1bd07-262d-466b-b3e9-08396bb0971c	0	10	f	\N	\N
aaeeefad-de93-4155-9d90-7a42e806bd51	\N	auth-otp-form	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	1de1bd07-262d-466b-b3e9-08396bb0971c	0	20	f	\N	\N
b34f7266-3680-4ec5-94e4-736fdf31bf5b	\N	http-basic-authenticator	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	df00be39-aed1-4215-beaf-81d504c2e4ba	0	10	f	\N	\N
e710c8e8-fdfc-40ec-9fcc-9a9c2f594fcf	\N	docker-http-basic-authenticator	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	48998b54-fd9d-44f3-987c-13c85ff1d1c0	0	10	f	\N	\N
ee453ce2-c7e1-4891-b058-6741f3f6e6bb	\N	no-cookie-redirect	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	cbb4e04a-18c5-4f1c-b910-43fd9332d1fe	0	10	f	\N	\N
00896592-4b47-4d32-bfc6-0fff100c4c66	\N	\N	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	cbb4e04a-18c5-4f1c-b910-43fd9332d1fe	0	20	t	cb8f31f5-5af3-4816-9321-e69cdabd1785	\N
1d45f5a0-9f26-413b-a403-3a98a1a45dc0	\N	basic-auth	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	cb8f31f5-5af3-4816-9321-e69cdabd1785	0	10	f	\N	\N
5f35d4db-0a2c-442a-81a5-fda8ded8dcc6	\N	basic-auth-otp	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	cb8f31f5-5af3-4816-9321-e69cdabd1785	3	20	f	\N	\N
f20f45cc-ea12-4383-a78d-ee7abd67e3a4	\N	auth-spnego	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	cb8f31f5-5af3-4816-9321-e69cdabd1785	3	30	f	\N	\N
4000a55f-5771-4e84-afbf-80720ff13bb6	\N	idp-email-verification	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	38f65c0a-742a-413b-9d1c-4919a0b48803	2	10	f	\N	\N
224bcee0-2fb5-4250-8d69-9b26aa89ad35	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	38f65c0a-742a-413b-9d1c-4919a0b48803	2	20	t	b64aef80-4ea5-42e6-b9bd-62bf67e06430	\N
1e08cb20-ac73-40b1-90fe-d35eff2f4ea4	\N	basic-auth	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5c347cce-c9db-4c26-9966-4b233b8da251	0	10	f	\N	\N
5348cb1f-4928-4776-815d-8b5556d8b587	\N	basic-auth-otp	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5c347cce-c9db-4c26-9966-4b233b8da251	3	20	f	\N	\N
4cdbbd91-4e66-428b-9375-61b8806b3c91	\N	auth-spnego	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5c347cce-c9db-4c26-9966-4b233b8da251	3	30	f	\N	\N
e955f41a-98a1-48e1-942d-77923797f7cd	\N	conditional-user-configured	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	6909d71d-eb26-42d0-9adc-482027107a2a	0	10	f	\N	\N
d80584cc-3f2f-4741-bf38-2d4d658d2e14	\N	auth-otp-form	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	6909d71d-eb26-42d0-9adc-482027107a2a	0	20	f	\N	\N
6d40be5d-805f-48d6-98f1-c64403e1bb03	\N	conditional-user-configured	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5b2dfef0-b265-4ad6-b048-f942c4cbfe1e	0	10	f	\N	\N
9c04415a-4e8e-405d-a0da-6e07d97226bf	\N	direct-grant-validate-otp	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5b2dfef0-b265-4ad6-b048-f942c4cbfe1e	0	20	f	\N	\N
7d209998-7389-4b46-8960-945cc1991a10	\N	conditional-user-configured	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	98bc47c0-e1c8-4426-913e-226e1f9d1240	0	10	f	\N	\N
f87d0e29-1822-4692-a27c-d9751cf468dc	\N	auth-otp-form	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	98bc47c0-e1c8-4426-913e-226e1f9d1240	0	20	f	\N	\N
f0288143-3eac-4a9a-a613-cc4f0daf7cc1	\N	idp-confirm-link	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	cb08f4c9-824c-4923-add1-ecfdba2aa9f0	0	10	f	\N	\N
fbc6ac0b-2b30-4b68-9a76-4d001aac0f20	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	cb08f4c9-824c-4923-add1-ecfdba2aa9f0	0	20	t	38f65c0a-742a-413b-9d1c-4919a0b48803	\N
45c9301c-2c90-4e41-9008-18fbd444c054	\N	conditional-user-configured	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	10d6be50-b4de-4258-a46b-59c23ec7a9aa	0	10	f	\N	\N
837580f9-c1a2-44e7-9c63-07c40502d562	\N	reset-otp	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	10d6be50-b4de-4258-a46b-59c23ec7a9aa	0	20	f	\N	\N
46f550a7-122a-41b8-b62b-108dd00a7939	\N	idp-create-user-if-unique	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	64ebbfad-fef5-429b-8b94-be5ad2bd98e3	2	10	f	\N	030a45f1-592b-40f8-9532-2f4ac8b3302f
66597e07-5581-4aca-9caa-1100d170b1ee	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	64ebbfad-fef5-429b-8b94-be5ad2bd98e3	2	20	t	cb08f4c9-824c-4923-add1-ecfdba2aa9f0	\N
3cf4f288-c34e-4c86-9b75-873980140b5d	\N	idp-username-password-form	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b64aef80-4ea5-42e6-b9bd-62bf67e06430	0	10	f	\N	\N
76788f4e-c29a-46e5-a9be-5851fd063773	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b64aef80-4ea5-42e6-b9bd-62bf67e06430	1	20	t	98bc47c0-e1c8-4426-913e-226e1f9d1240	\N
15403dc6-f163-4108-927b-dbbb31b4fd31	\N	auth-cookie	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	2daf7423-29eb-4353-89b9-f65429a7060b	2	10	f	\N	\N
5bfb4ad7-a239-46ea-9219-4856b957ed34	\N	auth-spnego	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	2daf7423-29eb-4353-89b9-f65429a7060b	3	20	f	\N	\N
fe086821-74f6-4149-a467-7b4572019b16	\N	identity-provider-redirector	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	2daf7423-29eb-4353-89b9-f65429a7060b	2	25	f	\N	\N
57cc55b5-77a5-4fba-b324-01f941fa03e1	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	2daf7423-29eb-4353-89b9-f65429a7060b	2	30	t	a2257ce2-b544-4ff6-be1c-3ff540756ed6	\N
930bdefe-e81a-487a-a634-0237a392cb26	\N	client-secret	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	baf075fc-f8ab-4a57-8d55-f1d676379be6	2	10	f	\N	\N
31e39c07-15fa-4af4-9413-e020864beab1	\N	client-jwt	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	baf075fc-f8ab-4a57-8d55-f1d676379be6	2	20	f	\N	\N
8e3e8ce4-dc49-453b-9ccd-d031e42895fe	\N	client-secret-jwt	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	baf075fc-f8ab-4a57-8d55-f1d676379be6	2	30	f	\N	\N
7fa52758-ddb2-4c80-8690-752191b8aa73	\N	client-x509	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	baf075fc-f8ab-4a57-8d55-f1d676379be6	2	40	f	\N	\N
1ab34ef2-ebaa-45e9-8d00-138fea73c591	\N	direct-grant-validate-username	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b76a2197-902a-4f31-b305-d2657f6aa68e	0	10	f	\N	\N
f1612342-87bf-4887-9fdb-8aa301786f0f	\N	direct-grant-validate-password	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b76a2197-902a-4f31-b305-d2657f6aa68e	0	20	f	\N	\N
e6b18062-b9a1-446d-8129-8def212b975a	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b76a2197-902a-4f31-b305-d2657f6aa68e	1	30	t	5b2dfef0-b265-4ad6-b048-f942c4cbfe1e	\N
f457d58b-0a8c-497b-9347-63ea4e784e3f	\N	docker-http-basic-authenticator	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b82128c1-e0ef-4b79-8be4-982b6912c0f0	0	10	f	\N	\N
84597ec1-2a9b-44b9-9312-962f1597cef0	\N	idp-review-profile	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	71a290dd-33c6-4cec-bb2f-9b5dc30b4fa7	0	10	f	\N	0c873b8b-08b2-4c7c-8fe2-5051c0e2eeba
6db7d76d-4a29-4f89-9651-09a7e4c0b128	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	71a290dd-33c6-4cec-bb2f-9b5dc30b4fa7	0	20	t	64ebbfad-fef5-429b-8b94-be5ad2bd98e3	\N
b7280fad-2b6f-4abf-b953-ae600493059f	\N	auth-username-password-form	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	a2257ce2-b544-4ff6-be1c-3ff540756ed6	0	10	f	\N	\N
5c7ee0ae-d574-4baf-91b3-cae5b4b3a751	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	a2257ce2-b544-4ff6-be1c-3ff540756ed6	1	20	t	6909d71d-eb26-42d0-9adc-482027107a2a	\N
762f3b5f-b271-4a52-a8cb-1eb58760fd38	\N	no-cookie-redirect	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	e1cad793-071b-4597-a01b-c2a8ef846053	0	10	f	\N	\N
5a1c6044-9d95-4393-85ad-3cf253529077	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	e1cad793-071b-4597-a01b-c2a8ef846053	0	20	t	5c347cce-c9db-4c26-9966-4b233b8da251	\N
99e52902-2414-4035-ad82-f6872aa8c412	\N	registration-page-form	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fd042e85-027d-45fc-aa6e-fe2addb972ad	0	10	t	109483e8-246d-44bd-a45c-d8b0007f9b8e	\N
64f0b867-65b0-4d0c-b882-1d873da9f183	\N	registration-user-creation	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	109483e8-246d-44bd-a45c-d8b0007f9b8e	0	20	f	\N	\N
8c8a42b2-1bde-4da9-899a-0518382ff91c	\N	registration-profile-action	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	109483e8-246d-44bd-a45c-d8b0007f9b8e	0	40	f	\N	\N
1165f2f4-9be8-4a19-9d42-cc21178dba13	\N	registration-password-action	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	109483e8-246d-44bd-a45c-d8b0007f9b8e	0	50	f	\N	\N
88c149ef-6dd0-4669-8e97-045ef9487808	\N	registration-recaptcha-action	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	109483e8-246d-44bd-a45c-d8b0007f9b8e	3	60	f	\N	\N
84cdc4b0-bdfb-44dd-9eb5-4daa06ee94e4	\N	reset-credentials-choose-user	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b46f6de2-41f4-4ac2-931c-1f197e9ac992	0	10	f	\N	\N
c043e26e-8154-4c78-8f7b-57e89aec7cef	\N	reset-credential-email	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b46f6de2-41f4-4ac2-931c-1f197e9ac992	0	20	f	\N	\N
1f4ed5a8-c287-40f7-8c2f-383e99d9629c	\N	reset-password	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b46f6de2-41f4-4ac2-931c-1f197e9ac992	0	30	f	\N	\N
01d2868d-c117-466a-8bee-dce0382ae269	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b46f6de2-41f4-4ac2-931c-1f197e9ac992	1	40	t	10d6be50-b4de-4258-a46b-59c23ec7a9aa	\N
f7d5f58a-a251-491b-949a-7750669b3934	\N	http-basic-authenticator	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	24b93bd7-b76a-433a-a76b-bbcf47c9a82b	0	10	f	\N	\N
3e40bf5c-0e88-4351-a57c-e7674577beb4	\N	idp-email-verification	aefd2657-49a5-49c5-8baf-3f385b695e4c	d09d7b54-c03c-481e-b5dd-a2791fefcf8e	2	10	f	\N	\N
4693f5e3-fded-4878-885b-8be78b5e0a63	\N	\N	aefd2657-49a5-49c5-8baf-3f385b695e4c	d09d7b54-c03c-481e-b5dd-a2791fefcf8e	2	20	t	aea749b8-8dfb-442a-9989-6dac6b12b394	\N
59339bb1-64c1-43c6-b852-053be380b1a6	\N	basic-auth	aefd2657-49a5-49c5-8baf-3f385b695e4c	abf011cb-9ee0-44a6-b439-1973ecf0a46d	0	10	f	\N	\N
5503d28a-95ce-414c-b835-9ce15db24b67	\N	basic-auth-otp	aefd2657-49a5-49c5-8baf-3f385b695e4c	abf011cb-9ee0-44a6-b439-1973ecf0a46d	3	20	f	\N	\N
c36b7cc9-551e-453e-bd7f-4fe792f74faf	\N	auth-spnego	aefd2657-49a5-49c5-8baf-3f385b695e4c	abf011cb-9ee0-44a6-b439-1973ecf0a46d	3	30	f	\N	\N
ca13d2e8-bc7c-4fd5-be91-058b2e79aaae	\N	conditional-user-configured	aefd2657-49a5-49c5-8baf-3f385b695e4c	5fa3c94b-c792-4246-9712-9d46e825debf	0	10	f	\N	\N
8769582f-17d7-4682-b6d1-17e5aaf12547	\N	auth-otp-form	aefd2657-49a5-49c5-8baf-3f385b695e4c	5fa3c94b-c792-4246-9712-9d46e825debf	0	20	f	\N	\N
32100258-8f37-4144-addb-f93c6d0399f7	\N	conditional-user-configured	aefd2657-49a5-49c5-8baf-3f385b695e4c	21d95095-5afc-45e1-8159-01ee33b2fa12	0	10	f	\N	\N
8b103521-847a-4f21-981e-98e6a022612a	\N	direct-grant-validate-otp	aefd2657-49a5-49c5-8baf-3f385b695e4c	21d95095-5afc-45e1-8159-01ee33b2fa12	0	20	f	\N	\N
1f3e60a9-522c-42b7-be39-8bb1fc16b865	\N	conditional-user-configured	aefd2657-49a5-49c5-8baf-3f385b695e4c	b7587b7d-39d7-45cf-8fc2-cc79f9632c6f	0	10	f	\N	\N
6ddc9277-2f8d-4460-b20d-58ae0495eba4	\N	auth-otp-form	aefd2657-49a5-49c5-8baf-3f385b695e4c	b7587b7d-39d7-45cf-8fc2-cc79f9632c6f	0	20	f	\N	\N
0fcb281e-9369-475f-84f8-194e29d049f1	\N	idp-confirm-link	aefd2657-49a5-49c5-8baf-3f385b695e4c	7d3e69e6-9a0e-417f-87fb-12ee06b3ef2f	0	10	f	\N	\N
0fae282c-cd7e-4440-aa69-3a81585c7db9	\N	\N	aefd2657-49a5-49c5-8baf-3f385b695e4c	7d3e69e6-9a0e-417f-87fb-12ee06b3ef2f	0	20	t	d09d7b54-c03c-481e-b5dd-a2791fefcf8e	\N
632dad1d-8bd1-441c-82b2-9fb038681da0	\N	conditional-user-configured	aefd2657-49a5-49c5-8baf-3f385b695e4c	edccb62a-2cde-41c9-9888-f481bf71edb3	0	10	f	\N	\N
3b32e70b-de60-4b79-9ff4-2c9189140aa6	\N	reset-otp	aefd2657-49a5-49c5-8baf-3f385b695e4c	edccb62a-2cde-41c9-9888-f481bf71edb3	0	20	f	\N	\N
c65eb0a1-7225-4037-acde-a1affebf86f2	\N	idp-create-user-if-unique	aefd2657-49a5-49c5-8baf-3f385b695e4c	82674003-9b41-499b-8931-c3df6c54b434	2	10	f	\N	7971f2fd-fa2a-41b0-8654-4aebada608b7
2ce433f8-745e-41a8-8ab7-ddeedf2df33f	\N	\N	aefd2657-49a5-49c5-8baf-3f385b695e4c	82674003-9b41-499b-8931-c3df6c54b434	2	20	t	7d3e69e6-9a0e-417f-87fb-12ee06b3ef2f	\N
87b76739-1f8a-4399-9a1e-761a57ed75ad	\N	idp-username-password-form	aefd2657-49a5-49c5-8baf-3f385b695e4c	aea749b8-8dfb-442a-9989-6dac6b12b394	0	10	f	\N	\N
c37723b7-0016-4ab7-85c4-4d01b8980265	\N	\N	aefd2657-49a5-49c5-8baf-3f385b695e4c	aea749b8-8dfb-442a-9989-6dac6b12b394	1	20	t	b7587b7d-39d7-45cf-8fc2-cc79f9632c6f	\N
033ff35a-154c-4bd5-ad32-10b0333e2753	\N	auth-cookie	aefd2657-49a5-49c5-8baf-3f385b695e4c	1f98c0e6-cd50-4a17-8fb6-6c080090c037	2	10	f	\N	\N
eb1521e7-7cc1-41fa-bafa-f7ead46c3ec2	\N	auth-spnego	aefd2657-49a5-49c5-8baf-3f385b695e4c	1f98c0e6-cd50-4a17-8fb6-6c080090c037	3	20	f	\N	\N
44218812-39c0-4b27-a36a-4b44c9011e56	\N	identity-provider-redirector	aefd2657-49a5-49c5-8baf-3f385b695e4c	1f98c0e6-cd50-4a17-8fb6-6c080090c037	2	25	f	\N	\N
bd5d9a53-aa55-4a27-9796-ed3ff2ecfea3	\N	\N	aefd2657-49a5-49c5-8baf-3f385b695e4c	1f98c0e6-cd50-4a17-8fb6-6c080090c037	2	30	t	17c6b385-3280-4749-a0dc-abc8f12dfa05	\N
ecf1cdff-2794-453b-95e7-e208d486f617	\N	client-secret	aefd2657-49a5-49c5-8baf-3f385b695e4c	7cb781e3-b4f1-497c-b1e3-e542ea6cf803	2	10	f	\N	\N
c4f7f542-2677-4e5f-8465-4b0225188c3a	\N	client-jwt	aefd2657-49a5-49c5-8baf-3f385b695e4c	7cb781e3-b4f1-497c-b1e3-e542ea6cf803	2	20	f	\N	\N
81ed9f31-8fef-4e30-b5b2-b17a1d8a870d	\N	client-secret-jwt	aefd2657-49a5-49c5-8baf-3f385b695e4c	7cb781e3-b4f1-497c-b1e3-e542ea6cf803	2	30	f	\N	\N
46d0aec7-77b9-48b6-87c2-5ea116b0d34e	\N	client-x509	aefd2657-49a5-49c5-8baf-3f385b695e4c	7cb781e3-b4f1-497c-b1e3-e542ea6cf803	2	40	f	\N	\N
88abdd64-254c-4898-a6b0-68f0a21e21ef	\N	direct-grant-validate-username	aefd2657-49a5-49c5-8baf-3f385b695e4c	e35d8661-9c7c-4d86-a30b-764c37d4eccd	0	10	f	\N	\N
d0121969-df24-49be-805b-78ebd0bce170	\N	direct-grant-validate-password	aefd2657-49a5-49c5-8baf-3f385b695e4c	e35d8661-9c7c-4d86-a30b-764c37d4eccd	0	20	f	\N	\N
02c1d0bb-3d82-46be-89ca-3b444b21e80e	\N	\N	aefd2657-49a5-49c5-8baf-3f385b695e4c	e35d8661-9c7c-4d86-a30b-764c37d4eccd	1	30	t	21d95095-5afc-45e1-8159-01ee33b2fa12	\N
a1906d3e-7f4a-4c90-8cce-fa38ee6033ce	\N	docker-http-basic-authenticator	aefd2657-49a5-49c5-8baf-3f385b695e4c	d97771a4-093e-4754-8f0d-be521fb7d035	0	10	f	\N	\N
459874b6-6c62-4843-9919-03edf8a7a935	\N	idp-review-profile	aefd2657-49a5-49c5-8baf-3f385b695e4c	d3fd1127-6871-44af-96e1-c8520e020df2	0	10	f	\N	278b1e18-d226-4ec6-8b00-9dfbdd782264
4e3b0832-25ed-44a8-be7d-96210ded4dae	\N	\N	aefd2657-49a5-49c5-8baf-3f385b695e4c	d3fd1127-6871-44af-96e1-c8520e020df2	0	20	t	82674003-9b41-499b-8931-c3df6c54b434	\N
a70cd821-a947-4714-874f-796996bdb817	\N	auth-username-password-form	aefd2657-49a5-49c5-8baf-3f385b695e4c	17c6b385-3280-4749-a0dc-abc8f12dfa05	0	10	f	\N	\N
68676f75-fa8c-4848-b800-718e4ab22048	\N	\N	aefd2657-49a5-49c5-8baf-3f385b695e4c	17c6b385-3280-4749-a0dc-abc8f12dfa05	1	20	t	5fa3c94b-c792-4246-9712-9d46e825debf	\N
69bd661b-81d6-4cce-9dbf-20e798dce3ed	\N	no-cookie-redirect	aefd2657-49a5-49c5-8baf-3f385b695e4c	6f899858-6fe6-4951-a96b-78271c7f9ea3	0	10	f	\N	\N
4f2a4ab7-7275-45fb-9b9f-b8509362e96b	\N	\N	aefd2657-49a5-49c5-8baf-3f385b695e4c	6f899858-6fe6-4951-a96b-78271c7f9ea3	0	20	t	abf011cb-9ee0-44a6-b439-1973ecf0a46d	\N
cef8a28d-a218-49f0-982f-d5131790bcce	\N	registration-page-form	aefd2657-49a5-49c5-8baf-3f385b695e4c	5dfb0432-1739-49d7-8fa5-c80c8d24c309	0	10	t	7f2c4502-bd9e-4bb0-bdc0-5f4a726a65c2	\N
07e0c998-12ea-42e9-8d0b-1df6291af64e	\N	registration-user-creation	aefd2657-49a5-49c5-8baf-3f385b695e4c	7f2c4502-bd9e-4bb0-bdc0-5f4a726a65c2	0	20	f	\N	\N
df59e0ee-b166-4cd8-bc63-766ec4f21f24	\N	registration-profile-action	aefd2657-49a5-49c5-8baf-3f385b695e4c	7f2c4502-bd9e-4bb0-bdc0-5f4a726a65c2	0	40	f	\N	\N
a684112c-1b35-42c1-a35d-8d5ea2405a18	\N	registration-password-action	aefd2657-49a5-49c5-8baf-3f385b695e4c	7f2c4502-bd9e-4bb0-bdc0-5f4a726a65c2	0	50	f	\N	\N
c8f5ff9e-b270-4690-926e-30baf1cefb21	\N	registration-recaptcha-action	aefd2657-49a5-49c5-8baf-3f385b695e4c	7f2c4502-bd9e-4bb0-bdc0-5f4a726a65c2	3	60	f	\N	\N
c626403c-06da-49da-a081-2b30c8b1ae8c	\N	reset-credentials-choose-user	aefd2657-49a5-49c5-8baf-3f385b695e4c	de63e330-6987-4ddd-b409-817f88f765f4	0	10	f	\N	\N
ecd1cd37-00d8-4c07-85a6-cc98b8320f42	\N	reset-credential-email	aefd2657-49a5-49c5-8baf-3f385b695e4c	de63e330-6987-4ddd-b409-817f88f765f4	0	20	f	\N	\N
c2f82123-4d3e-4aff-aa8c-8431057a3026	\N	reset-password	aefd2657-49a5-49c5-8baf-3f385b695e4c	de63e330-6987-4ddd-b409-817f88f765f4	0	30	f	\N	\N
5d7dfc7d-8c1f-4513-a522-8ecdba8890c7	\N	\N	aefd2657-49a5-49c5-8baf-3f385b695e4c	de63e330-6987-4ddd-b409-817f88f765f4	1	40	t	edccb62a-2cde-41c9-9888-f481bf71edb3	\N
35e6edd3-8644-44dc-b4f5-c169c2f149e7	\N	http-basic-authenticator	aefd2657-49a5-49c5-8baf-3f385b695e4c	2c61e23b-51b3-4cd5-89ff-584d98b0abbf	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
639d6d0e-9681-48e3-a6d2-4c2ce101a587	browser	browser based authentication	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	t	t
45bd9427-c254-4876-9107-d626631be31a	forms	Username, password, otp and other auth forms.	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	f	t
1f368b6f-6df3-4f9e-979d-49b02dff5d5b	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	f	t
88c7fb6c-4ebc-43db-81dd-bf2c7ca7c63e	direct grant	OpenID Connect Resource Owner Grant	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	t	t
865899df-3c24-4fe1-8d42-52900af5b2d8	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	f	t
ab0e149e-0743-476b-b2fd-641f3d86c9fe	registration	registration flow	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	t	t
793d7070-bcf2-4a53-9f46-51a0211188c6	registration form	registration form	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	form-flow	f	t
2aa3e096-bf45-40ed-89ad-0f097d998005	reset credentials	Reset credentials for a user if they forgot their password or something	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	t	t
ceeb39d8-a0ac-46e5-8145-04747790d336	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	f	t
e5fae8de-9aba-4fbf-8d2e-6f94ceb399e3	clients	Base authentication for clients	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	client-flow	t	t
7ec1ca8e-0fad-4d78-9aaa-5bd8e56088fe	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	t	t
2219b590-fd97-46eb-a46e-dbac9ddaf64c	User creation or linking	Flow for the existing/non-existing user alternatives	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	f	t
4483c851-30bc-4494-bf28-831554d710e8	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	f	t
67eb5687-5b39-4822-a5f3-d46878e46d8e	Account verification options	Method with which to verity the existing account	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	f	t
c519b78f-0f39-4ef4-8b8b-c14a849b336d	Verify Existing Account by Re-authentication	Reauthentication of existing account	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	f	t
1de1bd07-262d-466b-b3e9-08396bb0971c	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	f	t
df00be39-aed1-4215-beaf-81d504c2e4ba	saml ecp	SAML ECP Profile Authentication Flow	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	t	t
48998b54-fd9d-44f3-987c-13c85ff1d1c0	docker auth	Used by Docker clients to authenticate against the IDP	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	t	t
cbb4e04a-18c5-4f1c-b910-43fd9332d1fe	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	t	t
cb8f31f5-5af3-4816-9321-e69cdabd1785	Authentication Options	Authentication options.	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	basic-flow	f	t
38f65c0a-742a-413b-9d1c-4919a0b48803	Account verification options	Method with which to verity the existing account	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
5c347cce-c9db-4c26-9966-4b233b8da251	Authentication Options	Authentication options.	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
6909d71d-eb26-42d0-9adc-482027107a2a	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
5b2dfef0-b265-4ad6-b048-f942c4cbfe1e	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
98bc47c0-e1c8-4426-913e-226e1f9d1240	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
cb08f4c9-824c-4923-add1-ecfdba2aa9f0	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
10d6be50-b4de-4258-a46b-59c23ec7a9aa	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
64ebbfad-fef5-429b-8b94-be5ad2bd98e3	User creation or linking	Flow for the existing/non-existing user alternatives	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
b64aef80-4ea5-42e6-b9bd-62bf67e06430	Verify Existing Account by Re-authentication	Reauthentication of existing account	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
2daf7423-29eb-4353-89b9-f65429a7060b	browser	browser based authentication	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	t	t
baf075fc-f8ab-4a57-8d55-f1d676379be6	clients	Base authentication for clients	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	client-flow	t	t
b76a2197-902a-4f31-b305-d2657f6aa68e	direct grant	OpenID Connect Resource Owner Grant	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	t	t
b82128c1-e0ef-4b79-8be4-982b6912c0f0	docker auth	Used by Docker clients to authenticate against the IDP	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	t	t
71a290dd-33c6-4cec-bb2f-9b5dc30b4fa7	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	t	t
a2257ce2-b544-4ff6-be1c-3ff540756ed6	forms	Username, password, otp and other auth forms.	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
e1cad793-071b-4597-a01b-c2a8ef846053	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	t	t
fd042e85-027d-45fc-aa6e-fe2addb972ad	registration	registration flow	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	t	t
109483e8-246d-44bd-a45c-d8b0007f9b8e	registration form	registration form	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	form-flow	f	t
b46f6de2-41f4-4ac2-931c-1f197e9ac992	reset credentials	Reset credentials for a user if they forgot their password or something	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	t	t
24b93bd7-b76a-433a-a76b-bbcf47c9a82b	saml ecp	SAML ECP Profile Authentication Flow	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	t	t
d09d7b54-c03c-481e-b5dd-a2791fefcf8e	Account verification options	Method with which to verity the existing account	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	f	t
abf011cb-9ee0-44a6-b439-1973ecf0a46d	Authentication Options	Authentication options.	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	f	t
5fa3c94b-c792-4246-9712-9d46e825debf	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	f	t
21d95095-5afc-45e1-8159-01ee33b2fa12	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	f	t
b7587b7d-39d7-45cf-8fc2-cc79f9632c6f	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	f	t
7d3e69e6-9a0e-417f-87fb-12ee06b3ef2f	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	f	t
edccb62a-2cde-41c9-9888-f481bf71edb3	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	f	t
82674003-9b41-499b-8931-c3df6c54b434	User creation or linking	Flow for the existing/non-existing user alternatives	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	f	t
aea749b8-8dfb-442a-9989-6dac6b12b394	Verify Existing Account by Re-authentication	Reauthentication of existing account	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	f	t
1f98c0e6-cd50-4a17-8fb6-6c080090c037	browser	browser based authentication	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	t	t
7cb781e3-b4f1-497c-b1e3-e542ea6cf803	clients	Base authentication for clients	aefd2657-49a5-49c5-8baf-3f385b695e4c	client-flow	t	t
e35d8661-9c7c-4d86-a30b-764c37d4eccd	direct grant	OpenID Connect Resource Owner Grant	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	t	t
d97771a4-093e-4754-8f0d-be521fb7d035	docker auth	Used by Docker clients to authenticate against the IDP	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	t	t
d3fd1127-6871-44af-96e1-c8520e020df2	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	t	t
17c6b385-3280-4749-a0dc-abc8f12dfa05	forms	Username, password, otp and other auth forms.	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	f	t
6f899858-6fe6-4951-a96b-78271c7f9ea3	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	t	t
5dfb0432-1739-49d7-8fa5-c80c8d24c309	registration	registration flow	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	t	t
7f2c4502-bd9e-4bb0-bdc0-5f4a726a65c2	registration form	registration form	aefd2657-49a5-49c5-8baf-3f385b695e4c	form-flow	f	t
de63e330-6987-4ddd-b409-817f88f765f4	reset credentials	Reset credentials for a user if they forgot their password or something	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	t	t
2c61e23b-51b3-4cd5-89ff-584d98b0abbf	saml ecp	SAML ECP Profile Authentication Flow	aefd2657-49a5-49c5-8baf-3f385b695e4c	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
f833d445-9680-4203-b54d-fd382d7c95d7	review profile config	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe
0117998f-56e9-41cf-a22c-8c74f81af760	create unique user config	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe
030a45f1-592b-40f8-9532-2f4ac8b3302f	create unique user config	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1
0c873b8b-08b2-4c7c-8fe2-5051c0e2eeba	review profile config	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1
7971f2fd-fa2a-41b0-8654-4aebada608b7	create unique user config	aefd2657-49a5-49c5-8baf-3f385b695e4c
278b1e18-d226-4ec6-8b00-9dfbdd782264	review profile config	aefd2657-49a5-49c5-8baf-3f385b695e4c
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
0117998f-56e9-41cf-a22c-8c74f81af760	false	require.password.update.after.registration
f833d445-9680-4203-b54d-fd382d7c95d7	missing	update.profile.on.first.login
030a45f1-592b-40f8-9532-2f4ac8b3302f	false	require.password.update.after.registration
0c873b8b-08b2-4c7c-8fe2-5051c0e2eeba	missing	update.profile.on.first.login
278b1e18-d226-4ec6-8b00-9dfbdd782264	missing	update.profile.on.first.login
7971f2fd-fa2a-41b0-8654-4aebada608b7	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
f9238327-e5d6-450e-a80e-55114996557e	t	f	master-realm	0	f	\N	\N	t	\N	f	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
d87078a0-bab2-4e8e-a96c-84c69b9a8051	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
b05bd7c0-e999-4234-b313-c5a40ec524b3	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
fc566840-928b-47ab-8c69-9602c2d9d5a8	t	f	broker	0	f	\N	\N	t	\N	f	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
8f81c007-8bed-4f25-9009-2bbcb098c5f3	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
f9f07ffa-ffbe-4e08-8c8c-8b55ad27e1b6	t	f	admin-cli	0	t	\N	\N	f	\N	f	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
22e245e6-fcc1-4130-98c8-5c6784d62b12	t	f	ecgvue-realm	0	f	\N	\N	t	\N	f	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	\N	0	f	f	ecgvue Realm	f	client-secret	\N	\N	\N	t	f	f	f
896090fe-19fb-4c95-906e-e8ad3063bb35	t	t	backend	0	f	Yf1PMfOlMOMO8rv17OsA2qNue1Ie0Mm8		f		f	aefd2657-49a5-49c5-8baf-3f385b695e4c	openid-connect	-1	t	f	Backend client 	t	client-secret			\N	f	f	f	f
ce842fe5-3812-4965-bd2a-223b37637c1d	t	f	account	0	t	\N	/realms/ecgvue/account/	f	\N	f	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
e03a9c44-332a-48cd-8777-d544fd7d3feb	t	t	frontend	0	t	\N		f		f	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	openid-connect	-1	f	f	Front End	f	client-secret		Front end For Angular access	\N	t	f	t	f
335fc954-d318-439c-a800-ec6890e7befc	t	f	account-console	0	t	\N	/realms/ecgvue/account/	f	\N	f	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	t	f	admin-cli	0	t	\N	\N	f	\N	f	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	f	ecgvue_test-realm	0	f	\N	\N	t	\N	f	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	\N	0	f	f	ecgvue_test Realm	f	client-secret	\N	\N	\N	t	f	f	f
6f2a4af0-383a-4299-80f8-660c62766a88	t	f	account	0	t	\N	/realms/ecgvue_test/account/	f	\N	f	aefd2657-49a5-49c5-8baf-3f385b695e4c	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
0d4e2343-70bb-483a-ac8a-8c0ee9375046	t	f	broker	0	f	\N	\N	t	\N	f	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
4a4ae264-0e11-45ac-b63c-0cbc3615b0cd	t	f	account-console	0	t	\N	/realms/ecgvue_test/account/	f	\N	f	aefd2657-49a5-49c5-8baf-3f385b695e4c	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
fb57efd3-823f-4b3c-88ff-51e766fafefd	t	f	realm-management	0	f	\N	\N	t	\N	f	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
098636cc-5794-485f-ba91-8128deafe934	t	f	security-admin-console	0	t	\N	/admin/ecgvue/console/	f	\N	f	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
de7de383-2fba-4f9c-be01-b060a2c3c62f	t	f	admin-cli	0	t	\N	\N	f	\N	f	aefd2657-49a5-49c5-8baf-3f385b695e4c	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	t	t	backend	0	f	k82gANnuTV2HVDVwYU9kM5CCTZyev0iG		f		f	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	openid-connect	-1	t	f	Backend	t	client-secret		Backend Description	\N	f	f	f	f
8aa37b02-7d8b-473d-9974-63ff0c861839	t	f	broker	0	f	\N	\N	t	\N	f	aefd2657-49a5-49c5-8baf-3f385b695e4c	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	t	t	frontend	0	t	\N		f		f	aefd2657-49a5-49c5-8baf-3f385b695e4c	openid-connect	-1	t	f	Front End 	f	client-secret		Front end to get access token of a user	\N	t	f	t	f
a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	f	realm-management	0	f	\N	\N	t	\N	f	aefd2657-49a5-49c5-8baf-3f385b695e4c	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
5a232f16-784b-45d3-8184-f5293fbea17e	t	f	security-admin-console	0	t	\N	/admin/ecgvue_test/console/	f	\N	f	aefd2657-49a5-49c5-8baf-3f385b695e4c	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
d87078a0-bab2-4e8e-a96c-84c69b9a8051	post.logout.redirect.uris	+
b05bd7c0-e999-4234-b313-c5a40ec524b3	post.logout.redirect.uris	+
b05bd7c0-e999-4234-b313-c5a40ec524b3	pkce.code.challenge.method	S256
8f81c007-8bed-4f25-9009-2bbcb098c5f3	post.logout.redirect.uris	+
8f81c007-8bed-4f25-9009-2bbcb098c5f3	pkce.code.challenge.method	S256
ce842fe5-3812-4965-bd2a-223b37637c1d	post.logout.redirect.uris	+
335fc954-d318-439c-a800-ec6890e7befc	post.logout.redirect.uris	+
335fc954-d318-439c-a800-ec6890e7befc	pkce.code.challenge.method	S256
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	post.logout.redirect.uris	+
0d4e2343-70bb-483a-ac8a-8c0ee9375046	post.logout.redirect.uris	+
fb57efd3-823f-4b3c-88ff-51e766fafefd	post.logout.redirect.uris	+
098636cc-5794-485f-ba91-8128deafe934	post.logout.redirect.uris	+
098636cc-5794-485f-ba91-8128deafe934	pkce.code.challenge.method	S256
896090fe-19fb-4c95-906e-e8ad3063bb35	client.secret.creation.time	1692158345
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	login_theme	ecgvue-theme
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	backchannel.logout.revoke.offline.tokens	false
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	backchannel.logout.session.required	true
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	client.secret.creation.time	1691995862
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	display.on.consent.screen	false
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	oauth2.device.authorization.grant.enabled	false
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	oidc.ciba.grant.enabled	false
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	post.logout.redirect.uris	+
e03a9c44-332a-48cd-8777-d544fd7d3feb	backchannel.logout.revoke.offline.tokens	false
e03a9c44-332a-48cd-8777-d544fd7d3feb	backchannel.logout.session.required	true
e03a9c44-332a-48cd-8777-d544fd7d3feb	display.on.consent.screen	false
e03a9c44-332a-48cd-8777-d544fd7d3feb	login_theme	keycloak
e03a9c44-332a-48cd-8777-d544fd7d3feb	oauth2.device.authorization.grant.enabled	false
e03a9c44-332a-48cd-8777-d544fd7d3feb	oidc.ciba.grant.enabled	false
e03a9c44-332a-48cd-8777-d544fd7d3feb	post.logout.redirect.uris	+
6f2a4af0-383a-4299-80f8-660c62766a88	post.logout.redirect.uris	+
4a4ae264-0e11-45ac-b63c-0cbc3615b0cd	post.logout.redirect.uris	+
4a4ae264-0e11-45ac-b63c-0cbc3615b0cd	pkce.code.challenge.method	S256
de7de383-2fba-4f9c-be01-b060a2c3c62f	post.logout.redirect.uris	+
896090fe-19fb-4c95-906e-e8ad3063bb35	post.logout.redirect.uris	+
896090fe-19fb-4c95-906e-e8ad3063bb35	oauth2.device.authorization.grant.enabled	false
896090fe-19fb-4c95-906e-e8ad3063bb35	backchannel.logout.revoke.offline.tokens	false
896090fe-19fb-4c95-906e-e8ad3063bb35	use.refresh.tokens	true
896090fe-19fb-4c95-906e-e8ad3063bb35	oidc.ciba.grant.enabled	false
896090fe-19fb-4c95-906e-e8ad3063bb35	backchannel.logout.session.required	true
896090fe-19fb-4c95-906e-e8ad3063bb35	client_credentials.use_refresh_token	false
896090fe-19fb-4c95-906e-e8ad3063bb35	acr.loa.map	{}
896090fe-19fb-4c95-906e-e8ad3063bb35	require.pushed.authorization.requests	false
896090fe-19fb-4c95-906e-e8ad3063bb35	tls.client.certificate.bound.access.tokens	false
896090fe-19fb-4c95-906e-e8ad3063bb35	display.on.consent.screen	false
896090fe-19fb-4c95-906e-e8ad3063bb35	token.response.type.bearer.lower-case	false
8aa37b02-7d8b-473d-9974-63ff0c861839	post.logout.redirect.uris	+
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	client.secret.creation.time	1686571467
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	login_theme	ecgvue-theme
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	post.logout.redirect.uris	+
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	oauth2.device.authorization.grant.enabled	false
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	backchannel.logout.revoke.offline.tokens	false
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	use.refresh.tokens	true
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	oidc.ciba.grant.enabled	false
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	backchannel.logout.session.required	true
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	client_credentials.use_refresh_token	false
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	acr.loa.map	{}
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	require.pushed.authorization.requests	false
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	tls.client.certificate.bound.access.tokens	false
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	display.on.consent.screen	false
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	token.response.type.bearer.lower-case	false
a4ba32ea-5b38-431c-98db-866a0a08c0ab	post.logout.redirect.uris	+
5a232f16-784b-45d3-8184-f5293fbea17e	post.logout.redirect.uris	+
5a232f16-784b-45d3-8184-f5293fbea17e	pkce.code.challenge.method	S256
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
bfda63e1-1922-4c3d-a141-5b1395cfb980	offline_access	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	OpenID Connect built-in scope: offline_access	openid-connect
1ecefd7a-2a0e-4579-81c4-5bc3a640f368	role_list	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	SAML role list	saml
c2c33b18-fe39-40de-b60e-9d9f19b0b0b8	profile	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	OpenID Connect built-in scope: profile	openid-connect
8a81d9c7-7986-4697-afe3-9d48c0d1bd16	email	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	OpenID Connect built-in scope: email	openid-connect
83399c51-a0b9-4694-bd12-12ddf2a6de8f	address	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	OpenID Connect built-in scope: address	openid-connect
7dfd8353-53e6-4152-9ce6-63a9327e2297	phone	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	OpenID Connect built-in scope: phone	openid-connect
009e1b2c-8ad3-4e27-9e38-c2cec9a86ba5	roles	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	OpenID Connect scope for add user roles to the access token	openid-connect
c6d0de5a-674f-4e90-a7b3-6052971e8c18	web-origins	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	OpenID Connect scope for add allowed web origins to the access token	openid-connect
83628b9f-695c-4609-a797-23b2b0fd1416	microprofile-jwt	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	Microprofile - JWT built-in scope	openid-connect
0c5859a4-d620-49bb-96e5-44afdebd31f4	acr	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
111caa50-b290-43a8-b04a-cce3c73dbefa	email	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	OpenID Connect built-in scope: email	openid-connect
1c24bfe0-68ec-457a-8fb9-8f6fccde0ba5	role_list	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	SAML role list	saml
0a18b98d-38e5-44d2-9332-1065b0c342dc	acr	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	offline_access	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	OpenID Connect built-in scope: offline_access	openid-connect
474bd65f-db29-470c-a9c3-3ad8f8615a6f	web-origins	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	OpenID Connect scope for add allowed web origins to the access token	openid-connect
d33b511f-1df4-4f3a-b4fd-8e7e0403f908	phone	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	OpenID Connect built-in scope: phone	openid-connect
43869505-7a24-424e-9ada-0cef970169a5	profile	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	OpenID Connect built-in scope: profile	openid-connect
29945782-f537-4661-beb2-eb77c9d23669	microprofile-jwt	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	Microprofile - JWT built-in scope	openid-connect
d5d707c6-4d4f-4bc9-8a5b-4e089040061d	roles	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	OpenID Connect scope for add user roles to the access token	openid-connect
a86d5100-8b35-49e9-94c3-3952256a2ffc	address	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	OpenID Connect built-in scope: address	openid-connect
c94fcaf7-3d58-4d78-ac28-5d057c755461	phone	aefd2657-49a5-49c5-8baf-3f385b695e4c	OpenID Connect built-in scope: phone	openid-connect
9f3a037d-e705-4b11-92fd-39cb4cead1ca	email	aefd2657-49a5-49c5-8baf-3f385b695e4c	OpenID Connect built-in scope: email	openid-connect
2c79b6f4-e825-4bd6-ad09-a690bbce720f	acr	aefd2657-49a5-49c5-8baf-3f385b695e4c	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
da4bcdff-e364-496d-836f-3d96bf50a358	microprofile-jwt	aefd2657-49a5-49c5-8baf-3f385b695e4c	Microprofile - JWT built-in scope	openid-connect
0caa4f9b-eb3c-4b3e-b8cd-8648d8ac38fe	address	aefd2657-49a5-49c5-8baf-3f385b695e4c	OpenID Connect built-in scope: address	openid-connect
8c191ac3-be5b-46ba-8d12-de837c0633be	web-origins	aefd2657-49a5-49c5-8baf-3f385b695e4c	OpenID Connect scope for add allowed web origins to the access token	openid-connect
24f77fc1-6495-4de2-9be1-d514f0dd13e0	role_list	aefd2657-49a5-49c5-8baf-3f385b695e4c	SAML role list	saml
8a58d093-cf7a-4ece-9bd1-b8fa6769102f	profile	aefd2657-49a5-49c5-8baf-3f385b695e4c	OpenID Connect built-in scope: profile	openid-connect
6ed55704-cc61-4fc7-bc90-e120af91f49c	offline_access	aefd2657-49a5-49c5-8baf-3f385b695e4c	OpenID Connect built-in scope: offline_access	openid-connect
0e9a644a-e2f6-4604-8067-c2c063711b39	roles	aefd2657-49a5-49c5-8baf-3f385b695e4c	OpenID Connect scope for add user roles to the access token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
bfda63e1-1922-4c3d-a141-5b1395cfb980	true	display.on.consent.screen
bfda63e1-1922-4c3d-a141-5b1395cfb980	${offlineAccessScopeConsentText}	consent.screen.text
1ecefd7a-2a0e-4579-81c4-5bc3a640f368	true	display.on.consent.screen
1ecefd7a-2a0e-4579-81c4-5bc3a640f368	${samlRoleListScopeConsentText}	consent.screen.text
c2c33b18-fe39-40de-b60e-9d9f19b0b0b8	true	display.on.consent.screen
c2c33b18-fe39-40de-b60e-9d9f19b0b0b8	${profileScopeConsentText}	consent.screen.text
c2c33b18-fe39-40de-b60e-9d9f19b0b0b8	true	include.in.token.scope
8a81d9c7-7986-4697-afe3-9d48c0d1bd16	true	display.on.consent.screen
8a81d9c7-7986-4697-afe3-9d48c0d1bd16	${emailScopeConsentText}	consent.screen.text
8a81d9c7-7986-4697-afe3-9d48c0d1bd16	true	include.in.token.scope
83399c51-a0b9-4694-bd12-12ddf2a6de8f	true	display.on.consent.screen
83399c51-a0b9-4694-bd12-12ddf2a6de8f	${addressScopeConsentText}	consent.screen.text
83399c51-a0b9-4694-bd12-12ddf2a6de8f	true	include.in.token.scope
7dfd8353-53e6-4152-9ce6-63a9327e2297	true	display.on.consent.screen
7dfd8353-53e6-4152-9ce6-63a9327e2297	${phoneScopeConsentText}	consent.screen.text
7dfd8353-53e6-4152-9ce6-63a9327e2297	true	include.in.token.scope
009e1b2c-8ad3-4e27-9e38-c2cec9a86ba5	true	display.on.consent.screen
009e1b2c-8ad3-4e27-9e38-c2cec9a86ba5	${rolesScopeConsentText}	consent.screen.text
009e1b2c-8ad3-4e27-9e38-c2cec9a86ba5	false	include.in.token.scope
c6d0de5a-674f-4e90-a7b3-6052971e8c18	false	display.on.consent.screen
c6d0de5a-674f-4e90-a7b3-6052971e8c18		consent.screen.text
c6d0de5a-674f-4e90-a7b3-6052971e8c18	false	include.in.token.scope
83628b9f-695c-4609-a797-23b2b0fd1416	false	display.on.consent.screen
83628b9f-695c-4609-a797-23b2b0fd1416	true	include.in.token.scope
0c5859a4-d620-49bb-96e5-44afdebd31f4	false	display.on.consent.screen
0c5859a4-d620-49bb-96e5-44afdebd31f4	false	include.in.token.scope
111caa50-b290-43a8-b04a-cce3c73dbefa	true	include.in.token.scope
111caa50-b290-43a8-b04a-cce3c73dbefa	true	display.on.consent.screen
111caa50-b290-43a8-b04a-cce3c73dbefa	${emailScopeConsentText}	consent.screen.text
1c24bfe0-68ec-457a-8fb9-8f6fccde0ba5	${samlRoleListScopeConsentText}	consent.screen.text
1c24bfe0-68ec-457a-8fb9-8f6fccde0ba5	true	display.on.consent.screen
0a18b98d-38e5-44d2-9332-1065b0c342dc	false	include.in.token.scope
0a18b98d-38e5-44d2-9332-1065b0c342dc	false	display.on.consent.screen
d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	${offlineAccessScopeConsentText}	consent.screen.text
d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	true	display.on.consent.screen
474bd65f-db29-470c-a9c3-3ad8f8615a6f	false	include.in.token.scope
474bd65f-db29-470c-a9c3-3ad8f8615a6f	false	display.on.consent.screen
474bd65f-db29-470c-a9c3-3ad8f8615a6f		consent.screen.text
d33b511f-1df4-4f3a-b4fd-8e7e0403f908	true	include.in.token.scope
d33b511f-1df4-4f3a-b4fd-8e7e0403f908	true	display.on.consent.screen
d33b511f-1df4-4f3a-b4fd-8e7e0403f908	${phoneScopeConsentText}	consent.screen.text
43869505-7a24-424e-9ada-0cef970169a5	true	include.in.token.scope
43869505-7a24-424e-9ada-0cef970169a5	true	display.on.consent.screen
43869505-7a24-424e-9ada-0cef970169a5	${profileScopeConsentText}	consent.screen.text
29945782-f537-4661-beb2-eb77c9d23669	true	include.in.token.scope
29945782-f537-4661-beb2-eb77c9d23669	false	display.on.consent.screen
d5d707c6-4d4f-4bc9-8a5b-4e089040061d	false	include.in.token.scope
d5d707c6-4d4f-4bc9-8a5b-4e089040061d	true	display.on.consent.screen
d5d707c6-4d4f-4bc9-8a5b-4e089040061d	${rolesScopeConsentText}	consent.screen.text
a86d5100-8b35-49e9-94c3-3952256a2ffc	true	include.in.token.scope
a86d5100-8b35-49e9-94c3-3952256a2ffc	true	display.on.consent.screen
a86d5100-8b35-49e9-94c3-3952256a2ffc	${addressScopeConsentText}	consent.screen.text
c94fcaf7-3d58-4d78-ac28-5d057c755461	true	include.in.token.scope
c94fcaf7-3d58-4d78-ac28-5d057c755461	true	display.on.consent.screen
c94fcaf7-3d58-4d78-ac28-5d057c755461	${phoneScopeConsentText}	consent.screen.text
9f3a037d-e705-4b11-92fd-39cb4cead1ca	true	include.in.token.scope
9f3a037d-e705-4b11-92fd-39cb4cead1ca	true	display.on.consent.screen
9f3a037d-e705-4b11-92fd-39cb4cead1ca	${emailScopeConsentText}	consent.screen.text
2c79b6f4-e825-4bd6-ad09-a690bbce720f	false	include.in.token.scope
2c79b6f4-e825-4bd6-ad09-a690bbce720f	false	display.on.consent.screen
da4bcdff-e364-496d-836f-3d96bf50a358	true	include.in.token.scope
da4bcdff-e364-496d-836f-3d96bf50a358	false	display.on.consent.screen
0caa4f9b-eb3c-4b3e-b8cd-8648d8ac38fe	true	include.in.token.scope
0caa4f9b-eb3c-4b3e-b8cd-8648d8ac38fe	true	display.on.consent.screen
0caa4f9b-eb3c-4b3e-b8cd-8648d8ac38fe	${addressScopeConsentText}	consent.screen.text
8c191ac3-be5b-46ba-8d12-de837c0633be	false	include.in.token.scope
8c191ac3-be5b-46ba-8d12-de837c0633be	false	display.on.consent.screen
8c191ac3-be5b-46ba-8d12-de837c0633be		consent.screen.text
24f77fc1-6495-4de2-9be1-d514f0dd13e0	${samlRoleListScopeConsentText}	consent.screen.text
24f77fc1-6495-4de2-9be1-d514f0dd13e0	true	display.on.consent.screen
8a58d093-cf7a-4ece-9bd1-b8fa6769102f	true	include.in.token.scope
8a58d093-cf7a-4ece-9bd1-b8fa6769102f	true	display.on.consent.screen
8a58d093-cf7a-4ece-9bd1-b8fa6769102f	${profileScopeConsentText}	consent.screen.text
6ed55704-cc61-4fc7-bc90-e120af91f49c	${offlineAccessScopeConsentText}	consent.screen.text
6ed55704-cc61-4fc7-bc90-e120af91f49c	true	display.on.consent.screen
0e9a644a-e2f6-4604-8067-c2c063711b39	false	include.in.token.scope
0e9a644a-e2f6-4604-8067-c2c063711b39	true	display.on.consent.screen
0e9a644a-e2f6-4604-8067-c2c063711b39	${rolesScopeConsentText}	consent.screen.text
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
d87078a0-bab2-4e8e-a96c-84c69b9a8051	c6d0de5a-674f-4e90-a7b3-6052971e8c18	t
d87078a0-bab2-4e8e-a96c-84c69b9a8051	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8	t
d87078a0-bab2-4e8e-a96c-84c69b9a8051	009e1b2c-8ad3-4e27-9e38-c2cec9a86ba5	t
d87078a0-bab2-4e8e-a96c-84c69b9a8051	8a81d9c7-7986-4697-afe3-9d48c0d1bd16	t
d87078a0-bab2-4e8e-a96c-84c69b9a8051	0c5859a4-d620-49bb-96e5-44afdebd31f4	t
d87078a0-bab2-4e8e-a96c-84c69b9a8051	83628b9f-695c-4609-a797-23b2b0fd1416	f
d87078a0-bab2-4e8e-a96c-84c69b9a8051	83399c51-a0b9-4694-bd12-12ddf2a6de8f	f
d87078a0-bab2-4e8e-a96c-84c69b9a8051	bfda63e1-1922-4c3d-a141-5b1395cfb980	f
d87078a0-bab2-4e8e-a96c-84c69b9a8051	7dfd8353-53e6-4152-9ce6-63a9327e2297	f
b05bd7c0-e999-4234-b313-c5a40ec524b3	c6d0de5a-674f-4e90-a7b3-6052971e8c18	t
b05bd7c0-e999-4234-b313-c5a40ec524b3	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8	t
b05bd7c0-e999-4234-b313-c5a40ec524b3	009e1b2c-8ad3-4e27-9e38-c2cec9a86ba5	t
b05bd7c0-e999-4234-b313-c5a40ec524b3	8a81d9c7-7986-4697-afe3-9d48c0d1bd16	t
b05bd7c0-e999-4234-b313-c5a40ec524b3	0c5859a4-d620-49bb-96e5-44afdebd31f4	t
b05bd7c0-e999-4234-b313-c5a40ec524b3	83628b9f-695c-4609-a797-23b2b0fd1416	f
b05bd7c0-e999-4234-b313-c5a40ec524b3	83399c51-a0b9-4694-bd12-12ddf2a6de8f	f
b05bd7c0-e999-4234-b313-c5a40ec524b3	bfda63e1-1922-4c3d-a141-5b1395cfb980	f
b05bd7c0-e999-4234-b313-c5a40ec524b3	7dfd8353-53e6-4152-9ce6-63a9327e2297	f
f9f07ffa-ffbe-4e08-8c8c-8b55ad27e1b6	c6d0de5a-674f-4e90-a7b3-6052971e8c18	t
f9f07ffa-ffbe-4e08-8c8c-8b55ad27e1b6	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8	t
f9f07ffa-ffbe-4e08-8c8c-8b55ad27e1b6	009e1b2c-8ad3-4e27-9e38-c2cec9a86ba5	t
f9f07ffa-ffbe-4e08-8c8c-8b55ad27e1b6	8a81d9c7-7986-4697-afe3-9d48c0d1bd16	t
f9f07ffa-ffbe-4e08-8c8c-8b55ad27e1b6	0c5859a4-d620-49bb-96e5-44afdebd31f4	t
f9f07ffa-ffbe-4e08-8c8c-8b55ad27e1b6	83628b9f-695c-4609-a797-23b2b0fd1416	f
f9f07ffa-ffbe-4e08-8c8c-8b55ad27e1b6	83399c51-a0b9-4694-bd12-12ddf2a6de8f	f
f9f07ffa-ffbe-4e08-8c8c-8b55ad27e1b6	bfda63e1-1922-4c3d-a141-5b1395cfb980	f
f9f07ffa-ffbe-4e08-8c8c-8b55ad27e1b6	7dfd8353-53e6-4152-9ce6-63a9327e2297	f
fc566840-928b-47ab-8c69-9602c2d9d5a8	c6d0de5a-674f-4e90-a7b3-6052971e8c18	t
fc566840-928b-47ab-8c69-9602c2d9d5a8	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8	t
fc566840-928b-47ab-8c69-9602c2d9d5a8	009e1b2c-8ad3-4e27-9e38-c2cec9a86ba5	t
fc566840-928b-47ab-8c69-9602c2d9d5a8	8a81d9c7-7986-4697-afe3-9d48c0d1bd16	t
fc566840-928b-47ab-8c69-9602c2d9d5a8	0c5859a4-d620-49bb-96e5-44afdebd31f4	t
fc566840-928b-47ab-8c69-9602c2d9d5a8	83628b9f-695c-4609-a797-23b2b0fd1416	f
fc566840-928b-47ab-8c69-9602c2d9d5a8	83399c51-a0b9-4694-bd12-12ddf2a6de8f	f
fc566840-928b-47ab-8c69-9602c2d9d5a8	bfda63e1-1922-4c3d-a141-5b1395cfb980	f
fc566840-928b-47ab-8c69-9602c2d9d5a8	7dfd8353-53e6-4152-9ce6-63a9327e2297	f
f9238327-e5d6-450e-a80e-55114996557e	c6d0de5a-674f-4e90-a7b3-6052971e8c18	t
f9238327-e5d6-450e-a80e-55114996557e	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8	t
f9238327-e5d6-450e-a80e-55114996557e	009e1b2c-8ad3-4e27-9e38-c2cec9a86ba5	t
f9238327-e5d6-450e-a80e-55114996557e	8a81d9c7-7986-4697-afe3-9d48c0d1bd16	t
f9238327-e5d6-450e-a80e-55114996557e	0c5859a4-d620-49bb-96e5-44afdebd31f4	t
f9238327-e5d6-450e-a80e-55114996557e	83628b9f-695c-4609-a797-23b2b0fd1416	f
f9238327-e5d6-450e-a80e-55114996557e	83399c51-a0b9-4694-bd12-12ddf2a6de8f	f
f9238327-e5d6-450e-a80e-55114996557e	bfda63e1-1922-4c3d-a141-5b1395cfb980	f
f9238327-e5d6-450e-a80e-55114996557e	7dfd8353-53e6-4152-9ce6-63a9327e2297	f
8f81c007-8bed-4f25-9009-2bbcb098c5f3	c6d0de5a-674f-4e90-a7b3-6052971e8c18	t
8f81c007-8bed-4f25-9009-2bbcb098c5f3	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8	t
8f81c007-8bed-4f25-9009-2bbcb098c5f3	009e1b2c-8ad3-4e27-9e38-c2cec9a86ba5	t
8f81c007-8bed-4f25-9009-2bbcb098c5f3	8a81d9c7-7986-4697-afe3-9d48c0d1bd16	t
8f81c007-8bed-4f25-9009-2bbcb098c5f3	0c5859a4-d620-49bb-96e5-44afdebd31f4	t
8f81c007-8bed-4f25-9009-2bbcb098c5f3	83628b9f-695c-4609-a797-23b2b0fd1416	f
8f81c007-8bed-4f25-9009-2bbcb098c5f3	83399c51-a0b9-4694-bd12-12ddf2a6de8f	f
8f81c007-8bed-4f25-9009-2bbcb098c5f3	bfda63e1-1922-4c3d-a141-5b1395cfb980	f
8f81c007-8bed-4f25-9009-2bbcb098c5f3	7dfd8353-53e6-4152-9ce6-63a9327e2297	f
ce842fe5-3812-4965-bd2a-223b37637c1d	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
ce842fe5-3812-4965-bd2a-223b37637c1d	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
ce842fe5-3812-4965-bd2a-223b37637c1d	43869505-7a24-424e-9ada-0cef970169a5	t
ce842fe5-3812-4965-bd2a-223b37637c1d	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
ce842fe5-3812-4965-bd2a-223b37637c1d	111caa50-b290-43a8-b04a-cce3c73dbefa	t
ce842fe5-3812-4965-bd2a-223b37637c1d	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
ce842fe5-3812-4965-bd2a-223b37637c1d	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
ce842fe5-3812-4965-bd2a-223b37637c1d	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
ce842fe5-3812-4965-bd2a-223b37637c1d	29945782-f537-4661-beb2-eb77c9d23669	f
6f2a4af0-383a-4299-80f8-660c62766a88	8c191ac3-be5b-46ba-8d12-de837c0633be	t
6f2a4af0-383a-4299-80f8-660c62766a88	2c79b6f4-e825-4bd6-ad09-a690bbce720f	t
6f2a4af0-383a-4299-80f8-660c62766a88	8a58d093-cf7a-4ece-9bd1-b8fa6769102f	t
6f2a4af0-383a-4299-80f8-660c62766a88	0e9a644a-e2f6-4604-8067-c2c063711b39	t
6f2a4af0-383a-4299-80f8-660c62766a88	9f3a037d-e705-4b11-92fd-39cb4cead1ca	t
6f2a4af0-383a-4299-80f8-660c62766a88	0caa4f9b-eb3c-4b3e-b8cd-8648d8ac38fe	f
6f2a4af0-383a-4299-80f8-660c62766a88	c94fcaf7-3d58-4d78-ac28-5d057c755461	f
6f2a4af0-383a-4299-80f8-660c62766a88	6ed55704-cc61-4fc7-bc90-e120af91f49c	f
6f2a4af0-383a-4299-80f8-660c62766a88	da4bcdff-e364-496d-836f-3d96bf50a358	f
335fc954-d318-439c-a800-ec6890e7befc	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
335fc954-d318-439c-a800-ec6890e7befc	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
335fc954-d318-439c-a800-ec6890e7befc	43869505-7a24-424e-9ada-0cef970169a5	t
335fc954-d318-439c-a800-ec6890e7befc	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
335fc954-d318-439c-a800-ec6890e7befc	111caa50-b290-43a8-b04a-cce3c73dbefa	t
335fc954-d318-439c-a800-ec6890e7befc	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
335fc954-d318-439c-a800-ec6890e7befc	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
335fc954-d318-439c-a800-ec6890e7befc	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
335fc954-d318-439c-a800-ec6890e7befc	29945782-f537-4661-beb2-eb77c9d23669	f
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	43869505-7a24-424e-9ada-0cef970169a5	t
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	111caa50-b290-43a8-b04a-cce3c73dbefa	t
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	29945782-f537-4661-beb2-eb77c9d23669	f
4a4ae264-0e11-45ac-b63c-0cbc3615b0cd	8c191ac3-be5b-46ba-8d12-de837c0633be	t
4a4ae264-0e11-45ac-b63c-0cbc3615b0cd	2c79b6f4-e825-4bd6-ad09-a690bbce720f	t
4a4ae264-0e11-45ac-b63c-0cbc3615b0cd	8a58d093-cf7a-4ece-9bd1-b8fa6769102f	t
4a4ae264-0e11-45ac-b63c-0cbc3615b0cd	0e9a644a-e2f6-4604-8067-c2c063711b39	t
4a4ae264-0e11-45ac-b63c-0cbc3615b0cd	9f3a037d-e705-4b11-92fd-39cb4cead1ca	t
4a4ae264-0e11-45ac-b63c-0cbc3615b0cd	0caa4f9b-eb3c-4b3e-b8cd-8648d8ac38fe	f
4a4ae264-0e11-45ac-b63c-0cbc3615b0cd	c94fcaf7-3d58-4d78-ac28-5d057c755461	f
4a4ae264-0e11-45ac-b63c-0cbc3615b0cd	6ed55704-cc61-4fc7-bc90-e120af91f49c	f
4a4ae264-0e11-45ac-b63c-0cbc3615b0cd	da4bcdff-e364-496d-836f-3d96bf50a358	f
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	43869505-7a24-424e-9ada-0cef970169a5	t
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	111caa50-b290-43a8-b04a-cce3c73dbefa	t
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	29945782-f537-4661-beb2-eb77c9d23669	f
0d4e2343-70bb-483a-ac8a-8c0ee9375046	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
0d4e2343-70bb-483a-ac8a-8c0ee9375046	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
0d4e2343-70bb-483a-ac8a-8c0ee9375046	43869505-7a24-424e-9ada-0cef970169a5	t
0d4e2343-70bb-483a-ac8a-8c0ee9375046	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
0d4e2343-70bb-483a-ac8a-8c0ee9375046	111caa50-b290-43a8-b04a-cce3c73dbefa	t
0d4e2343-70bb-483a-ac8a-8c0ee9375046	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
0d4e2343-70bb-483a-ac8a-8c0ee9375046	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
0d4e2343-70bb-483a-ac8a-8c0ee9375046	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
0d4e2343-70bb-483a-ac8a-8c0ee9375046	29945782-f537-4661-beb2-eb77c9d23669	f
de7de383-2fba-4f9c-be01-b060a2c3c62f	8c191ac3-be5b-46ba-8d12-de837c0633be	t
de7de383-2fba-4f9c-be01-b060a2c3c62f	2c79b6f4-e825-4bd6-ad09-a690bbce720f	t
de7de383-2fba-4f9c-be01-b060a2c3c62f	8a58d093-cf7a-4ece-9bd1-b8fa6769102f	t
de7de383-2fba-4f9c-be01-b060a2c3c62f	0e9a644a-e2f6-4604-8067-c2c063711b39	t
de7de383-2fba-4f9c-be01-b060a2c3c62f	9f3a037d-e705-4b11-92fd-39cb4cead1ca	t
de7de383-2fba-4f9c-be01-b060a2c3c62f	0caa4f9b-eb3c-4b3e-b8cd-8648d8ac38fe	f
de7de383-2fba-4f9c-be01-b060a2c3c62f	c94fcaf7-3d58-4d78-ac28-5d057c755461	f
de7de383-2fba-4f9c-be01-b060a2c3c62f	6ed55704-cc61-4fc7-bc90-e120af91f49c	f
de7de383-2fba-4f9c-be01-b060a2c3c62f	da4bcdff-e364-496d-836f-3d96bf50a358	f
e03a9c44-332a-48cd-8777-d544fd7d3feb	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
e03a9c44-332a-48cd-8777-d544fd7d3feb	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
e03a9c44-332a-48cd-8777-d544fd7d3feb	43869505-7a24-424e-9ada-0cef970169a5	t
e03a9c44-332a-48cd-8777-d544fd7d3feb	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
e03a9c44-332a-48cd-8777-d544fd7d3feb	111caa50-b290-43a8-b04a-cce3c73dbefa	t
e03a9c44-332a-48cd-8777-d544fd7d3feb	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
e03a9c44-332a-48cd-8777-d544fd7d3feb	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
e03a9c44-332a-48cd-8777-d544fd7d3feb	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
e03a9c44-332a-48cd-8777-d544fd7d3feb	29945782-f537-4661-beb2-eb77c9d23669	f
fb57efd3-823f-4b3c-88ff-51e766fafefd	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
fb57efd3-823f-4b3c-88ff-51e766fafefd	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
fb57efd3-823f-4b3c-88ff-51e766fafefd	43869505-7a24-424e-9ada-0cef970169a5	t
fb57efd3-823f-4b3c-88ff-51e766fafefd	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
fb57efd3-823f-4b3c-88ff-51e766fafefd	111caa50-b290-43a8-b04a-cce3c73dbefa	t
fb57efd3-823f-4b3c-88ff-51e766fafefd	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
fb57efd3-823f-4b3c-88ff-51e766fafefd	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
fb57efd3-823f-4b3c-88ff-51e766fafefd	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
fb57efd3-823f-4b3c-88ff-51e766fafefd	29945782-f537-4661-beb2-eb77c9d23669	f
896090fe-19fb-4c95-906e-e8ad3063bb35	8c191ac3-be5b-46ba-8d12-de837c0633be	t
896090fe-19fb-4c95-906e-e8ad3063bb35	2c79b6f4-e825-4bd6-ad09-a690bbce720f	t
896090fe-19fb-4c95-906e-e8ad3063bb35	8a58d093-cf7a-4ece-9bd1-b8fa6769102f	t
896090fe-19fb-4c95-906e-e8ad3063bb35	0e9a644a-e2f6-4604-8067-c2c063711b39	t
896090fe-19fb-4c95-906e-e8ad3063bb35	9f3a037d-e705-4b11-92fd-39cb4cead1ca	t
896090fe-19fb-4c95-906e-e8ad3063bb35	0caa4f9b-eb3c-4b3e-b8cd-8648d8ac38fe	f
896090fe-19fb-4c95-906e-e8ad3063bb35	c94fcaf7-3d58-4d78-ac28-5d057c755461	f
896090fe-19fb-4c95-906e-e8ad3063bb35	6ed55704-cc61-4fc7-bc90-e120af91f49c	f
896090fe-19fb-4c95-906e-e8ad3063bb35	da4bcdff-e364-496d-836f-3d96bf50a358	f
098636cc-5794-485f-ba91-8128deafe934	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
098636cc-5794-485f-ba91-8128deafe934	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
098636cc-5794-485f-ba91-8128deafe934	43869505-7a24-424e-9ada-0cef970169a5	t
098636cc-5794-485f-ba91-8128deafe934	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
098636cc-5794-485f-ba91-8128deafe934	111caa50-b290-43a8-b04a-cce3c73dbefa	t
098636cc-5794-485f-ba91-8128deafe934	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
098636cc-5794-485f-ba91-8128deafe934	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
098636cc-5794-485f-ba91-8128deafe934	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
098636cc-5794-485f-ba91-8128deafe934	29945782-f537-4661-beb2-eb77c9d23669	f
8aa37b02-7d8b-473d-9974-63ff0c861839	8c191ac3-be5b-46ba-8d12-de837c0633be	t
8aa37b02-7d8b-473d-9974-63ff0c861839	2c79b6f4-e825-4bd6-ad09-a690bbce720f	t
8aa37b02-7d8b-473d-9974-63ff0c861839	8a58d093-cf7a-4ece-9bd1-b8fa6769102f	t
8aa37b02-7d8b-473d-9974-63ff0c861839	0e9a644a-e2f6-4604-8067-c2c063711b39	t
8aa37b02-7d8b-473d-9974-63ff0c861839	9f3a037d-e705-4b11-92fd-39cb4cead1ca	t
8aa37b02-7d8b-473d-9974-63ff0c861839	0caa4f9b-eb3c-4b3e-b8cd-8648d8ac38fe	f
8aa37b02-7d8b-473d-9974-63ff0c861839	c94fcaf7-3d58-4d78-ac28-5d057c755461	f
8aa37b02-7d8b-473d-9974-63ff0c861839	6ed55704-cc61-4fc7-bc90-e120af91f49c	f
8aa37b02-7d8b-473d-9974-63ff0c861839	da4bcdff-e364-496d-836f-3d96bf50a358	f
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	8c191ac3-be5b-46ba-8d12-de837c0633be	t
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	2c79b6f4-e825-4bd6-ad09-a690bbce720f	t
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	8a58d093-cf7a-4ece-9bd1-b8fa6769102f	t
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	0e9a644a-e2f6-4604-8067-c2c063711b39	t
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	9f3a037d-e705-4b11-92fd-39cb4cead1ca	t
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	0caa4f9b-eb3c-4b3e-b8cd-8648d8ac38fe	f
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	c94fcaf7-3d58-4d78-ac28-5d057c755461	f
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	6ed55704-cc61-4fc7-bc90-e120af91f49c	f
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	da4bcdff-e364-496d-836f-3d96bf50a358	f
a4ba32ea-5b38-431c-98db-866a0a08c0ab	8c191ac3-be5b-46ba-8d12-de837c0633be	t
a4ba32ea-5b38-431c-98db-866a0a08c0ab	2c79b6f4-e825-4bd6-ad09-a690bbce720f	t
a4ba32ea-5b38-431c-98db-866a0a08c0ab	8a58d093-cf7a-4ece-9bd1-b8fa6769102f	t
a4ba32ea-5b38-431c-98db-866a0a08c0ab	0e9a644a-e2f6-4604-8067-c2c063711b39	t
a4ba32ea-5b38-431c-98db-866a0a08c0ab	9f3a037d-e705-4b11-92fd-39cb4cead1ca	t
a4ba32ea-5b38-431c-98db-866a0a08c0ab	0caa4f9b-eb3c-4b3e-b8cd-8648d8ac38fe	f
a4ba32ea-5b38-431c-98db-866a0a08c0ab	c94fcaf7-3d58-4d78-ac28-5d057c755461	f
a4ba32ea-5b38-431c-98db-866a0a08c0ab	6ed55704-cc61-4fc7-bc90-e120af91f49c	f
a4ba32ea-5b38-431c-98db-866a0a08c0ab	da4bcdff-e364-496d-836f-3d96bf50a358	f
5a232f16-784b-45d3-8184-f5293fbea17e	8c191ac3-be5b-46ba-8d12-de837c0633be	t
5a232f16-784b-45d3-8184-f5293fbea17e	2c79b6f4-e825-4bd6-ad09-a690bbce720f	t
5a232f16-784b-45d3-8184-f5293fbea17e	8a58d093-cf7a-4ece-9bd1-b8fa6769102f	t
5a232f16-784b-45d3-8184-f5293fbea17e	0e9a644a-e2f6-4604-8067-c2c063711b39	t
5a232f16-784b-45d3-8184-f5293fbea17e	9f3a037d-e705-4b11-92fd-39cb4cead1ca	t
5a232f16-784b-45d3-8184-f5293fbea17e	0caa4f9b-eb3c-4b3e-b8cd-8648d8ac38fe	f
5a232f16-784b-45d3-8184-f5293fbea17e	c94fcaf7-3d58-4d78-ac28-5d057c755461	f
5a232f16-784b-45d3-8184-f5293fbea17e	6ed55704-cc61-4fc7-bc90-e120af91f49c	f
5a232f16-784b-45d3-8184-f5293fbea17e	da4bcdff-e364-496d-836f-3d96bf50a358	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
bfda63e1-1922-4c3d-a141-5b1395cfb980	75f6c072-832d-43ef-83e6-b59f09febe70
d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	745167cf-3a7e-4302-9027-f7ec388b2fa2
6ed55704-cc61-4fc7-bc90-e120af91f49c	74c1337c-f6dd-47b8-bb7c-c5894aadf46e
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
f8549d49-57d1-415f-81ba-62a8ddee657f	Trusted Hosts	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	anonymous
a77a0c1e-4080-44be-8092-34b6251ee455	Consent Required	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	anonymous
794cbc85-ab6c-47ee-bca3-9ea093bdd22a	Full Scope Disabled	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	anonymous
bee0c392-b12c-4730-8bad-5c42c7285388	Max Clients Limit	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	anonymous
cdfe2424-0581-4112-a470-0bb526bc1d09	Allowed Protocol Mapper Types	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	anonymous
b6151faf-8fa5-445f-a28d-08e140dc23f4	Allowed Client Scopes	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	anonymous
8827a33b-ffe5-4576-8006-131810cb122e	Allowed Protocol Mapper Types	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	authenticated
ebef1b3a-5af7-46c5-9aa8-8055d5b447b0	Allowed Client Scopes	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	authenticated
36521e22-b16f-47bc-a8f2-6c6c09537575	rsa-generated	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	rsa-generated	org.keycloak.keys.KeyProvider	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	\N
f19253ea-cf0f-4e8b-a24b-b9fb5ec2bdfc	rsa-enc-generated	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	rsa-enc-generated	org.keycloak.keys.KeyProvider	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	\N
dbb7e3d0-c740-454d-9ba0-d8158dd2ea18	hmac-generated	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	hmac-generated	org.keycloak.keys.KeyProvider	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	\N
66f78c85-9804-46ed-9d27-90f513442b00	aes-generated	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	aes-generated	org.keycloak.keys.KeyProvider	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	\N
7b3aa2e9-8112-4125-b57f-a8e6396be8d1	Full Scope Disabled	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	anonymous
a290fbe9-b211-471d-a6d4-de173fc740b9	Max Clients Limit	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	anonymous
487c1b4f-1a6d-40fe-9be7-a849a717e631	Allowed Protocol Mapper Types	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	anonymous
819bce71-0a61-4072-9753-e60632c9feac	Allowed Client Scopes	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	anonymous
faa64ebd-a4cd-41b9-9c29-b6653cddfa30	Allowed Protocol Mapper Types	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	authenticated
9d1f5d48-3b6f-4ffd-9651-9f327d8d0c12	Trusted Hosts	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	anonymous
841ff175-dd04-4e65-854b-f5f0afca42eb	Consent Required	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	anonymous
2e7b1c1f-7823-4343-9030-937eaac1dfd1	Allowed Client Scopes	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	authenticated
1194761a-e76e-4090-b291-9208c2c5ce75	rsa-generated	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	rsa-generated	org.keycloak.keys.KeyProvider	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N
da220a1c-3078-4d86-bf16-71923c3858e5	rsa-enc-generated	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	rsa-enc-generated	org.keycloak.keys.KeyProvider	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N
39397f40-c828-4059-95a5-bc9a6de49528	aes-generated	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	aes-generated	org.keycloak.keys.KeyProvider	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N
c489b84a-9833-4c39-a20f-765dc8aaecf7	hmac-generated	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	hmac-generated	org.keycloak.keys.KeyProvider	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N
ba0a1b22-5828-41cc-836f-54c525e7b060	Consent Required	aefd2657-49a5-49c5-8baf-3f385b695e4c	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	aefd2657-49a5-49c5-8baf-3f385b695e4c	anonymous
4e9f63c7-3b44-4914-8732-4ca89ae8147d	Allowed Client Scopes	aefd2657-49a5-49c5-8baf-3f385b695e4c	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	aefd2657-49a5-49c5-8baf-3f385b695e4c	authenticated
51d60c7c-cc83-4a4f-8c93-3f8a7aa44f04	Max Clients Limit	aefd2657-49a5-49c5-8baf-3f385b695e4c	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	aefd2657-49a5-49c5-8baf-3f385b695e4c	anonymous
4c9f8a0a-9573-441f-88c8-d6fd88f93331	Allowed Protocol Mapper Types	aefd2657-49a5-49c5-8baf-3f385b695e4c	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	aefd2657-49a5-49c5-8baf-3f385b695e4c	authenticated
a9cd3bb3-4890-4b67-ae1b-9e90073574d7	Allowed Protocol Mapper Types	aefd2657-49a5-49c5-8baf-3f385b695e4c	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	aefd2657-49a5-49c5-8baf-3f385b695e4c	anonymous
d7220410-a717-4f07-abea-4794b044d945	Full Scope Disabled	aefd2657-49a5-49c5-8baf-3f385b695e4c	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	aefd2657-49a5-49c5-8baf-3f385b695e4c	anonymous
e739ae78-4acb-4137-9f34-7bf97fe6a780	Allowed Client Scopes	aefd2657-49a5-49c5-8baf-3f385b695e4c	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	aefd2657-49a5-49c5-8baf-3f385b695e4c	anonymous
24acbbc8-a62a-4e4c-8d99-caa8fe83f577	Trusted Hosts	aefd2657-49a5-49c5-8baf-3f385b695e4c	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	aefd2657-49a5-49c5-8baf-3f385b695e4c	anonymous
678cd7b3-88fe-40e7-b2f1-4702c3b69dc5	rsa-enc-generated	aefd2657-49a5-49c5-8baf-3f385b695e4c	rsa-enc-generated	org.keycloak.keys.KeyProvider	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N
ad73c9db-1c4a-44aa-852e-7db31d22d76f	rsa-generated	aefd2657-49a5-49c5-8baf-3f385b695e4c	rsa-generated	org.keycloak.keys.KeyProvider	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N
371b3561-bd44-4963-bbab-785e2ab58eda	hmac-generated	aefd2657-49a5-49c5-8baf-3f385b695e4c	hmac-generated	org.keycloak.keys.KeyProvider	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N
9f014c14-50a6-490d-86e8-537bba2492da	aes-generated	aefd2657-49a5-49c5-8baf-3f385b695e4c	aes-generated	org.keycloak.keys.KeyProvider	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N
f76266ee-564c-4302-92f3-d42d2eca88ce	\N	aefd2657-49a5-49c5-8baf-3f385b695e4c	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
78740997-b975-4db0-8cd6-3ede52732ac5	bee0c392-b12c-4730-8bad-5c42c7285388	max-clients	200
e8354645-8340-4714-a191-94b9110e9594	f8549d49-57d1-415f-81ba-62a8ddee657f	client-uris-must-match	true
2f411f3d-ffa1-4739-b2ef-a103f597d629	f8549d49-57d1-415f-81ba-62a8ddee657f	host-sending-registration-request-must-match	true
e66257e7-b548-4e31-9c21-8f6cdf452456	cdfe2424-0581-4112-a470-0bb526bc1d09	allowed-protocol-mapper-types	oidc-address-mapper
ef253b7f-6a7e-495f-a935-fdd64163d23c	cdfe2424-0581-4112-a470-0bb526bc1d09	allowed-protocol-mapper-types	saml-user-attribute-mapper
00dfeee7-8a97-4cea-83b0-bd87a0a87686	cdfe2424-0581-4112-a470-0bb526bc1d09	allowed-protocol-mapper-types	saml-user-property-mapper
1dca82d3-c457-4df2-a1a0-a2b052e9e44f	cdfe2424-0581-4112-a470-0bb526bc1d09	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
328a6f49-0d90-40a1-910c-9d17c6e87fd2	cdfe2424-0581-4112-a470-0bb526bc1d09	allowed-protocol-mapper-types	saml-role-list-mapper
13980d49-70dc-4c5d-b708-82a3c3b76a24	cdfe2424-0581-4112-a470-0bb526bc1d09	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
4d4a5785-3f7c-4006-9688-26f301796613	cdfe2424-0581-4112-a470-0bb526bc1d09	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
6f68ccf7-a6f0-470a-9da1-43e85d499a4c	cdfe2424-0581-4112-a470-0bb526bc1d09	allowed-protocol-mapper-types	oidc-full-name-mapper
ed192f4c-04c1-4958-b213-5ece21ec3416	b6151faf-8fa5-445f-a28d-08e140dc23f4	allow-default-scopes	true
235112d1-dab2-4104-9471-0f4959a038a4	8827a33b-ffe5-4576-8006-131810cb122e	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
fbeaf934-1679-40a6-b76e-dcfb23b09919	8827a33b-ffe5-4576-8006-131810cb122e	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
58e1ce70-2127-4ebe-8117-1dcbf32b1d46	8827a33b-ffe5-4576-8006-131810cb122e	allowed-protocol-mapper-types	saml-user-property-mapper
34d31b04-ebac-40b8-bf2b-a3064131e8cd	8827a33b-ffe5-4576-8006-131810cb122e	allowed-protocol-mapper-types	saml-user-attribute-mapper
100a9412-89e7-4b78-802f-8af465e8d28a	8827a33b-ffe5-4576-8006-131810cb122e	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
dc7276a2-bd45-4014-839e-de1bddd1f99c	8827a33b-ffe5-4576-8006-131810cb122e	allowed-protocol-mapper-types	oidc-full-name-mapper
84134d54-6758-4d68-be2b-be628ddb1bc9	8827a33b-ffe5-4576-8006-131810cb122e	allowed-protocol-mapper-types	oidc-address-mapper
dfebdbe9-c703-4089-a5a7-12d4478ddaee	8827a33b-ffe5-4576-8006-131810cb122e	allowed-protocol-mapper-types	saml-role-list-mapper
ea9b3f1e-7dad-4976-b4bd-381f2cd072b2	ebef1b3a-5af7-46c5-9aa8-8055d5b447b0	allow-default-scopes	true
ba4704a8-cd08-4b8b-9e7f-dc87bcb8dae5	f19253ea-cf0f-4e8b-a24b-b9fb5ec2bdfc	priority	100
f6fe4813-dd0f-4b1f-b6e6-96254d38acb7	f19253ea-cf0f-4e8b-a24b-b9fb5ec2bdfc	keyUse	ENC
499f9b1e-f119-4549-b8b3-a74a757c5565	f19253ea-cf0f-4e8b-a24b-b9fb5ec2bdfc	privateKey	MIIEowIBAAKCAQEAuzgyVGZ6tYb0SV8Z+jhDGZyHm0V85z3Ow4a246DX83VKKgIIARIBQmnYETf1xp4exZoSZjjPHYCLv0LS3gqgNDWnvD4q5WCjkSxXWbnp/xoqeZzJ7KiGSCVx83gKJ+kZ6fWIFwU/uqhsgRk+uOrk5rtWEqmJxdh7or0x9qKOHKGilrRDZoeto1tjobG90QOo9YWiD5p5H62CLc43IY0sK720on38TV8u75+AEvbgMpqS1jiSS0CesrtjN43/bYIs4EAXSOTAoCngA+64fsZP4iycpg1AOVpCWCVdQa3YPvlxqlE5t5GAEmlezDf3RCHgAPngmGYlU7wVY3BDZG5FCQIDAQABAoIBAAtl8np8+r+OhdTpu1Umk789bmwfoOkbNDlnPD9DjaI+49MG6KHYDMeUVhlGROpguhLhvHkIwGNVbiyoztnB39sN4TZuuoHYjlzKTE8kKIDlgOyChTCpWfOOhA+EoWmooXFDB5QPN8APfPunI9ByTJlXknf0ZnTrJyvTRPV1FB3eBmqCvUnunfGydD9xYIbhcBoimPbwUalqw8+eCANJzloptN3IMeU/nUtzIPnyBxOOe7y+9ogqg7BEUHPYh92gVrKgy1Z+YLKIalaWjWScEoVZpmPeuAzGujm6UJBPfJ7r/N/p0GBJ0YWgPewhx6UZw62lVZDM43Io8LVyl/wAAFkCgYEA/fD95QPJnXIs/pvj46htGU4CjCPCi5b9Hnd5hcDDm7moVYaYbQSZpmwQ0D7mmuft74Hbck49x2b7TbRlSeuWwPiebJ3U7KkXMtXHnPfTPrQyY5LrC3XyNfuCEXPaR6L0JF6nBVJXnvD5R+YoDt5gBOBvSYgKpmeQyJeZuNfuHPMCgYEAvLy8aaKGH5IJssqsGxKE6wvQZHu8r3GQW9wyEetB0ur1OawPq2wXXfiv5QM4oEw+Eh6uRSEAimGxaMhCxtIbZIdLkMsILj6axNrxmVXWQC6bqsw6uHPtDXzPzgJvSV19S4FjGKvrGkTemkZzPg8tuUnLswd5YPTew9piD/bhJRMCgYEAsbCJ2FA4KaWU+mvWoJxgCs7dVXZIUSjL4R+0tvTVawgUVBQkYFRRt3Pyp+T7s/UKNwdkqK066WaT/iF2pqzlBg5xvIsMTLVc+ENCtAFtnXi1sZtCQPi9DSz6LIAmgu3xa+mXcU/W4+62X6sa6JyOD5uEA63f1eSuGM6L0B24DiUCgYBDEaq+uyOAaowJvh3kzPLw99TJMHN/wRJ0ok4ksf5FLnuQUAWNfC7dlPckob1osU9Jbx+sryqbAlZiDvAz6QwU8EM5I/03OcYT+F3siGVHj4h/7G1diMyPg2/xHEphvtg8kbEeXlGAl0KnfiuLvScZdhDuANTwUHQtExjP5YJigwKBgDpb/vULVuZE67hNt1bWpIjsBVKfJilz34EpbOO92Zdp34ru6uaWN6fM+t+5ng8G5hiGcfR+iKvoAPjOQOd/N5zhBNrQzX2Hy1608vXfJ/Wv70moQtGXD+7+FTC4vy8lQu4gJYOVbGfX3KVveeGeKgZAuL0MPRpWCuKySJdf4O7y
c7326671-8aef-47d1-9cf8-ad886e214406	f19253ea-cf0f-4e8b-a24b-b9fb5ec2bdfc	certificate	MIICmzCCAYMCBgGJ8s51ezANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwODE0MDY0NzQ0WhcNMzMwODE0MDY0OTI0WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC7ODJUZnq1hvRJXxn6OEMZnIebRXznPc7DhrbjoNfzdUoqAggBEgFCadgRN/XGnh7FmhJmOM8dgIu/QtLeCqA0Nae8PirlYKORLFdZuen/Gip5nMnsqIZIJXHzeAon6Rnp9YgXBT+6qGyBGT646uTmu1YSqYnF2HuivTH2oo4coaKWtENmh62jW2Ohsb3RA6j1haIPmnkfrYItzjchjSwrvbSiffxNXy7vn4AS9uAympLWOJJLQJ6yu2M3jf9tgizgQBdI5MCgKeAD7rh+xk/iLJymDUA5WkJYJV1Brdg++XGqUTm3kYASaV7MN/dEIeAA+eCYZiVTvBVjcENkbkUJAgMBAAEwDQYJKoZIhvcNAQELBQADggEBALI5MKty5lyZHzTT6PlJAq+EqPImQoIfItRzlQwEoTAu4zo3XxwKiYZOIUQ9qALqTLKCigmC1bxROj5iqMWgR5DMqhjJVEaFM20M8bOga6hJb1SourZahANSmSRHUpCO1Hmpz9hxzKzuEgkt139swc69FVTci2b8xyt48sUbVQKnm1RYZHiOYt4F7tuE01XzfZ+Ol9kx60jnpveq0ntTwiirLoTmqms2ClUBooZsrKiYkeIIwnbdqIFFj23X6QMPUBlX0/az0GuGFggc6ODIRN8PzxZ4WMD74gtCjMCpB6Dd3VlVVrNl/ApVvWVuoMQsL2XiCli1IsXFJDrvNwlHQUA=
a69906ef-c65e-4503-8f1e-feca79ae40df	f19253ea-cf0f-4e8b-a24b-b9fb5ec2bdfc	algorithm	RSA-OAEP
e460221a-8948-474c-950a-d59f97f5390f	36521e22-b16f-47bc-a8f2-6c6c09537575	keyUse	SIG
0500eb18-a0d4-4a27-b7e9-15d499fe0dde	36521e22-b16f-47bc-a8f2-6c6c09537575	privateKey	MIIEpAIBAAKCAQEAkuEcC8ubiM3OZqsheAJJVu06f9rk/asHeQYVs4GwmGj4uKYURQpy5E7wLgUMWQlRvrmUKB5MyKHzrdQwRc+yS4DUNU6Kzj6GKZT2EKHR6RHX8aNgEwDL3Odg63WEEm35GKJB/mlqCONI4WX5YxX+yk1uF2xNMCFfDyNLu1H4BCPS4NkrUO5XaKEZa9DcOTg/16sIgeTjdqJklWJmoJacFSg+GtpI2W4V5e0vKdXSiUEy6XJBfV8FlnW8Iahb2OqWEKnt788H56PCF+DfdUyilmXJe1Cm4IE7kZBSLyGzkFkdXQnNp26eXLiIZsl6/cUnU347LG/WtzQrMvsqyiyPawIDAQABAoIBAEgAgF4r5sgOk9Lyq0qIXGl3i8jnhn/v2o7yc6r2tZpRQzRJfgBGWgIfzE/S+7WeAuurT7zG9b8Y3TrmnO9sHKw0sFKdeSAXuG8j7ehDW4KU07ZJ76wBJO7aokFq716VeJoh2JYeGPPYb37HHZT8UFXd1U04MzKX+WCTXemrChkEtFB7hToqM9Ihyg/d86++S8ciAq0jZAhjKxWHFUCTB+wA0JVSy+qUszHPcm0Qv5ONjyhn9I6/pBpce+5IGZb2kx/OCi7fxmBg+ZiltMLrtd6SH4KQ6irXNcV59Emm9ldXkzgDRNfsSAftx3BkFuVVlys5m1A50jo3Xc8QqpdtzKECgYEAzOzvUZd6jx/ILiMZkUwUh7dtDqhlCeXujuSCpMLFcm5Kz/Ru5GcmO/diw1VI7zoZZ7Z217e6fFsfOzkazjD4ZIraL8+Slmja9rSDdx22wZfWobRdgV16EHiW4qqDgUxpUU2j3DXwPs9c3Mr8pPxPICWVGZ2COxOnyHL3SERieHECgYEAt3yYqbvAcDEGZqlAs/GoYW01138rXBzniarE2Y8mpsVeuHAp7iUYFSoloqQBb6198TFQ16iGUjfVyb3BKmCm1fiUJbUgIz6cusTlN6Jpp/RaDbDwEJzbxIf30eYTwPwJ6bjDHEu05KuRVZzO02WMRZCyR8zFB4W75Jtz1dYRU5sCgYEAo0dd4ArsEkHmhCxfYM/Xw9M4x+cQqnRUQfJ8zb6LCAQtA8jk2oP9iOYyASVg+Yu3VlWiF3tC0XbhSZTUcNm/8IxaEKI5UDK31L47yZsZVOMglrNZlYvfiGQtBOmL4mf5ulg8aWdoxwL+IMZzyxlmCl0nkcNYUq30j9hag3BJbWECgYEAtEURqBDybEd+RnabPy95gt7NOz+R1hn/0V2ZsTXXf5oCCasJRxPiqUiTWUtQrewCBGmzR24nKbf5rw9jLMNwpmBnDPT68iWdzlGL8jD7JSwJHdJsyaWStW/wpqQpXD1DcAE6kB5BRzjYvQgmm8L1IZOb1Lb2DQHzLBMep0R+GWkCgYAkl5+m+4mSfID1I9V1ou/hVYFyyA5juPQlGzfX4gYQ85zop40DYT78tT0z46CYAKcwOZnfflNvzZVacD2Lcnce+lbcmjFs+Lpk00pmqlYPRXMlrjtIkC9dKthmPrq7GxnU+otL+8dvghvx3H1e2ko8aeTFshzo5SlDDC1aty7+KA==
41b42ab7-567f-480b-b97a-f148f6e912d2	36521e22-b16f-47bc-a8f2-6c6c09537575	certificate	MIICmzCCAYMCBgGJ8s50yTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwODE0MDY0NzQzWhcNMzMwODE0MDY0OTIzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCS4RwLy5uIzc5mqyF4AklW7Tp/2uT9qwd5BhWzgbCYaPi4phRFCnLkTvAuBQxZCVG+uZQoHkzIofOt1DBFz7JLgNQ1TorOPoYplPYQodHpEdfxo2ATAMvc52DrdYQSbfkYokH+aWoI40jhZfljFf7KTW4XbE0wIV8PI0u7UfgEI9Lg2StQ7ldooRlr0Nw5OD/XqwiB5ON2omSVYmaglpwVKD4a2kjZbhXl7S8p1dKJQTLpckF9XwWWdbwhqFvY6pYQqe3vzwfno8IX4N91TKKWZcl7UKbggTuRkFIvIbOQWR1dCc2nbp5cuIhmyXr9xSdTfjssb9a3NCsy+yrKLI9rAgMBAAEwDQYJKoZIhvcNAQELBQADggEBABvo95Gsai3NtT8oVO5EnvPx6OhWPoOTQg2XNl6eGvQCMTZPabxZn/LXumvCZZNicK6F4RnAJbfeH950V3ZVX/qHRHs9YalCf7Rg6QI2sipEhEau8jWQFG+AzAVdw4vJ4+q2pr4BcuEcLx+4P0WLw68jQ93mYNqs6G2PKOdnPP+rRDcs8sIo57Yfe0wH6CtpoiVoWm8GzTs3xT2oYJ2c1SYqhbk7/fvBjeqIbLYY2GlOMLCuZYS6kDVDSJu1WvBDChXnW1ClR7keKvG2jabliCbyJ8vG426b2bxBf3cX+Kr3S++d/KlBxeLR8TX6XoGI4bApFIti/5zDkERPJwNQIYI=
b90e870c-a4d7-4fe6-86b6-8059c9a42490	36521e22-b16f-47bc-a8f2-6c6c09537575	priority	100
fd36d1df-33ec-495f-935d-e8a24a15c790	dbb7e3d0-c740-454d-9ba0-d8158dd2ea18	priority	100
34dca325-2033-428d-a241-6cd386f20dd6	dbb7e3d0-c740-454d-9ba0-d8158dd2ea18	algorithm	HS256
432d7775-1b02-49a0-8c3b-3df86bba0c81	dbb7e3d0-c740-454d-9ba0-d8158dd2ea18	secret	8MFoYhgzGZn-03isuHQeXZivtT0Cy7tfjoBx-LocJCS2F6_gBNSOZUapxGiFo6rKtFhixnXfdMDSg5Fje1ZKiA
60210570-23d0-482b-aab6-f98879ac6801	dbb7e3d0-c740-454d-9ba0-d8158dd2ea18	kid	bffd3393-b42d-433f-954f-7fe71de76b1c
455c9841-22ce-4da8-a444-5492a23b1014	66f78c85-9804-46ed-9d27-90f513442b00	kid	43d746ec-feea-4718-85e6-9583245ecd4a
32fc9d1a-5204-48ee-81fd-0cee3879892d	66f78c85-9804-46ed-9d27-90f513442b00	secret	ytj1nPj3Mwn6O4_xY6_JeA
d4c3095b-39a7-4f90-9f83-ee74d3e8a68c	66f78c85-9804-46ed-9d27-90f513442b00	priority	100
ca2f503b-ae4f-4e2b-9e24-7ebb364350d5	1194761a-e76e-4090-b291-9208c2c5ce75	certificate	MIICmzCCAYMCBgGJ8s8FRzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZlY2d2dWUwHhcNMjMwODE0MDY0ODIwWhcNMzMwODE0MDY1MDAwWjARMQ8wDQYDVQQDDAZlY2d2dWUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCSdov5FQc+pYuKY6RVvY2HPzYQLXPZZ/v8m/7aHVOOldkJSc7eADzX/9SvQoMVdLFv9dWTclfS1u71PogCBjqvxLtw0h9bp9I2NjTMnT8HtCuWTzGT9a+Cgt+sUQNtJZCp6iEp3YXpa6yzrsffJIctcdukngh0ak/QS5DR8Fsm0yDgF9gyIJaCocOTl1DYmEphdNZVNP85oHH16b6Jsdtw65xdRIPsVDoItWq0UzSeByYXgcMd7jZZO5NzntvXh66eniWSVrEFL0A3xbuqiiP6gFTwCEKs5lHolKN0NstF0Xy92lZnqtHGOIi//jbuQYC2jYdQeNgZVYrzUp6C7vwBAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGOSaFrnXILsyobEvRCSGpLCn+/llITwO2m9KZffRAosY+jFDp38NLpOtH9OBUIJ2/7DGz3Trn/XrF1dGd/yJERxDNnis2HFn21MFh3r53GN8koE5wsXj2pL6ZKFp8ZyBMJEzD7R6T5B75FwU+PSzE97W+DSOXzvH7UB8PsRBD46/omt7a3B0425QuQe8JMtlFe++k363MKVBYTM1OG7ElNdmlYxYjVE6Xb1wyC4DIi0O9V+733vxtCLLprTlLrLXcAcWOkbuvXtEXYaQSCGOpi1yWjfeVdclNMbCGCQ3rmsn0KSGERDEt4nYrR+fD1beoGX9S2E1t+HUsEK0jS0hqE=
8530d31c-5240-48a7-a6d2-67c8e4712de6	1194761a-e76e-4090-b291-9208c2c5ce75	privateKey	MIIEpAIBAAKCAQEAknaL+RUHPqWLimOkVb2Nhz82EC1z2Wf7/Jv+2h1TjpXZCUnO3gA81//Ur0KDFXSxb/XVk3JX0tbu9T6IAgY6r8S7cNIfW6fSNjY0zJ0/B7Qrlk8xk/WvgoLfrFEDbSWQqeohKd2F6Wuss67H3ySHLXHbpJ4IdGpP0EuQ0fBbJtMg4BfYMiCWgqHDk5dQ2JhKYXTWVTT/OaBx9em+ibHbcOucXUSD7FQ6CLVqtFM0ngcmF4HDHe42WTuTc57b14eunp4lklaxBS9AN8W7qooj+oBU8AhCrOZR6JSjdDbLRdF8vdpWZ6rRxjiIv/427kGAto2HUHjYGVWK81Kegu78AQIDAQABAoIBABpBwGQ+HddgTDzaEisA2W+GqIWL8HnoR2eI+85UdZdZS9h7b+eiuUWr6pAk52UgT3MX6lsNo6r7t0kmFbHvNfQu27+lG9QNqQTpANwx0IvsA+hleCjjYbyPA9RbjbayhlW/0IQ133zyPbrUuaZKYSWHhO3lGvTr3jUkZukMIvs5ltpQgbeJrdtOAlDC6BBhMCRugae/kHyRXmMD308mRxKpHR/Fh0NaEDi7CpastUP51xQc4gXwUiR1XaP52LUomwlqbyC5lMA0j8BEhm2TQwXX5R3uRgpgN607MSsuYHNcyMX2J4a12Gh14uaMZqbAT3+rwd+Ga9dyB1b+fT6slaUCgYEAzgv2TrV094FNPl6MYJ8Qi+nJ6+Hr4DOlNnOhEi4XS0e7/dL8TER2mNWCqiEgm0lfiVu/si+oJ9FxY7Mp5I7BXxe1AaYM0Vq1RsSQLvJCF+kUAYKe+MbUf8ngk3otkmSf3FQYb6yPJhqtN7DQYNb/fdq5GpLYBYNdHlPL/tZbQTMCgYEAtfiZHWmCWA9uPV+itAPm3SILTxEZZeDr2bB4minYs2Uq1JRgxeAu9LNEzvZEI/WyEd9iUmktrEnJ7EN2zZoE8zTHAbuCVzScy1kZjq2+BaNTHeU4kaLSpy+HBAGg53APTkurE9ZWGzk7c6ag4NnxtoKZDzc/nQ2NP5s8tb4vtfsCgYEArcFEqkc3JejyHKBavLgmmfZDAxn3cY/byLlloREhL6iEjZ24iRBK+sNCdvmMp6cOW6T1WOv7X+itOChEMat4whoZ2BQRRxK5P75O4GgG+GbjKgreyGfTlxfEvFkRyRv1+zUnjjT0WmuwmwAOGTv1JEqoQhKG/M80XXjI1FQrjCUCgYBJ4grA72LVwEYhMyBLeL4WkMkIrEeknsMD2uvMpCrxA6V1NF1qWhCWl+bbJRAbjZlkOk+gaEX8CuWqQOYOqndSC961LF3KbHkw8xc2YAKkJWEM5VGnh/WBngFytfqPnWcJgh2O61qAqScjWMc/JB5I3ROqIuN4L9Vmuu/WVsbmWwKBgQCsfxiaczT1EGo8qVk9ccJHQKuxWKrJ+7iYflfKTgsHE861q1LdxmuMe79iEbF4weBI90TnHsoG53ISUJkgiblEMu6Xziu2g6a3zlJD8eGdDNJwmicEB2gatl52Av969GchjwZpLz3qyW7E40zjNgskXvxVZRzIVGBLJAP/uzw2Kw==
3c16c308-0a2d-480c-9a8b-eb9a63afa202	1194761a-e76e-4090-b291-9208c2c5ce75	priority	100
5b873a52-ee79-455e-9508-0d5f83397a3a	a290fbe9-b211-471d-a6d4-de173fc740b9	max-clients	200
e862facb-4ee0-4390-9a1c-c5a1e3378545	487c1b4f-1a6d-40fe-9be7-a849a717e631	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
ed31d3bc-3975-4ef3-a13f-5888f7c67412	487c1b4f-1a6d-40fe-9be7-a849a717e631	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
31b88d1e-f1cf-42e7-9a08-6dcf91767601	487c1b4f-1a6d-40fe-9be7-a849a717e631	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
85b1e348-4aec-43bd-8864-5b0f4dc7b226	487c1b4f-1a6d-40fe-9be7-a849a717e631	allowed-protocol-mapper-types	oidc-full-name-mapper
cc58a0cd-1b07-49f8-bee2-9b91777e52c6	487c1b4f-1a6d-40fe-9be7-a849a717e631	allowed-protocol-mapper-types	saml-user-property-mapper
09ee5750-3f4d-4077-a183-d8f97baccad7	487c1b4f-1a6d-40fe-9be7-a849a717e631	allowed-protocol-mapper-types	saml-role-list-mapper
5e887889-c190-4a8c-a4ad-04dccec7a62e	487c1b4f-1a6d-40fe-9be7-a849a717e631	allowed-protocol-mapper-types	oidc-address-mapper
96ed439a-3500-4f1a-8748-aee25100045f	487c1b4f-1a6d-40fe-9be7-a849a717e631	allowed-protocol-mapper-types	saml-user-attribute-mapper
f9ce3d9e-5848-4d4c-89bc-2d3f2db2b125	819bce71-0a61-4072-9753-e60632c9feac	allow-default-scopes	true
ab6f9a54-aa98-4b3c-8257-67923bbe410c	faa64ebd-a4cd-41b9-9c29-b6653cddfa30	allowed-protocol-mapper-types	saml-user-attribute-mapper
acd487e7-3a15-4d2e-8c11-3f14f0e7b2b4	faa64ebd-a4cd-41b9-9c29-b6653cddfa30	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
a5b25cf1-8258-412b-bdd7-098cb8ab93b9	faa64ebd-a4cd-41b9-9c29-b6653cddfa30	allowed-protocol-mapper-types	saml-user-property-mapper
c6a258f9-7c42-4b62-9468-39eefbc32874	faa64ebd-a4cd-41b9-9c29-b6653cddfa30	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
c8570e8a-7849-439f-9c38-487120e5f315	faa64ebd-a4cd-41b9-9c29-b6653cddfa30	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
beedc499-771d-41b9-a6de-3333beb87329	faa64ebd-a4cd-41b9-9c29-b6653cddfa30	allowed-protocol-mapper-types	oidc-address-mapper
2fec6c3c-9d9e-4cd7-b25b-3d415aafe01b	faa64ebd-a4cd-41b9-9c29-b6653cddfa30	allowed-protocol-mapper-types	saml-role-list-mapper
eb71657c-d871-4de3-a0aa-5924cf48e49b	faa64ebd-a4cd-41b9-9c29-b6653cddfa30	allowed-protocol-mapper-types	oidc-full-name-mapper
217ae7ac-917c-4a40-b0f5-7511a7e5a8e6	9d1f5d48-3b6f-4ffd-9651-9f327d8d0c12	client-uris-must-match	true
93d140a2-f867-4aaf-86d7-81f99a38da83	9d1f5d48-3b6f-4ffd-9651-9f327d8d0c12	host-sending-registration-request-must-match	true
047ed197-0b9a-482a-b71d-258b4822344d	da220a1c-3078-4d86-bf16-71923c3858e5	algorithm	RSA-OAEP
66d7487c-5774-4034-a8f1-7fff23b9c899	da220a1c-3078-4d86-bf16-71923c3858e5	certificate	MIICmzCCAYMCBgGJ8s8F1zANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZlY2d2dWUwHhcNMjMwODE0MDY0ODIxWhcNMzMwODE0MDY1MDAxWjARMQ8wDQYDVQQDDAZlY2d2dWUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCp4Seyt5d5dj3eopA4bf2erL65N2EgkZlfNglquH6HxSr2/LE346eW5HjaIirohNQhhAnFBw67E4YAIrftbaZ8OFhmWWDtzHBFpyq+z/fJHc888B2iov+YjYTki7pg1nZxbU824j14JPTilcxCg67gSCi44pLnb5wHXL9NnI6Dw1g+VtNwCa19pMBKsRxdsXx68riJw1PVs8qsFDlqBEkT/E0cTB+RJfNg7rQTuRR7cSJZsech3wvACmjL9mKaXkdF8ezpbKGvcP8VYan0/9H565wqaofZ91g7nRwnewAMvhEONOEIFkJ/UaCKDn8Ob2AzBTK6VTn2KzB78K3K1yThAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAI8tbAgW40yF/payD7DZSzqzxKmVD3qdRSU5wcmPUBNOjZI/D5wWD5rcGCTF36pWUL6dJzjFNzrVo/WUz56nl+FfcOAhJ6E6qIvu0DrbV9AxhoGZ/rmfVR6H7X9z7Ox3zR7pJbCBZnYtO5KANn6l8r6zdCgrzWW/XkP0JE2mEB4c+oMjFSn68AvtT9p3duVWI3Yt2Ct1IZzokyh0LwvUzHf5a4FoRXtxQEKe2jh2V3jls0Sd6JRoU+N3b033Zx+0p+79o2YTNm7xHH7exyctiWSXQs++zT6utJo8daOn8d9HJiC4rMM2hoNvQeh0xHTp6PUvBK0O60+Xtr2y1oGz3Ic=
57dd4f91-50e9-4f4d-ab09-1465753ef71b	da220a1c-3078-4d86-bf16-71923c3858e5	privateKey	MIIEpAIBAAKCAQEAqeEnsreXeXY93qKQOG39nqy+uTdhIJGZXzYJarh+h8Uq9vyxN+OnluR42iIq6ITUIYQJxQcOuxOGACK37W2mfDhYZllg7cxwRacqvs/3yR3PPPAdoqL/mI2E5Iu6YNZ2cW1PNuI9eCT04pXMQoOu4EgouOKS52+cB1y/TZyOg8NYPlbTcAmtfaTASrEcXbF8evK4icNT1bPKrBQ5agRJE/xNHEwfkSXzYO60E7kUe3EiWbHnId8LwApoy/Ziml5HRfHs6Wyhr3D/FWGp9P/R+eucKmqH2fdYO50cJ3sADL4RDjThCBZCf1Ggig5/Dm9gMwUyulU59iswe/Ctytck4QIDAQABAoIBAAGZvbB6p8d692+TJpalBObNaes74g8q9wPvWe6ssgK+hxpyUFtCap82nCvCNtc3renaTRcjWzp0j0qN2S+4RNlilKTjeIEKEChcWDAJvKPzOys32BAizvOfiPgYJ82K9L0KKJT/1ABfYQQn4Rei9us9m85c4mFiRxkXyOTC1fIIaZwG4EZBMv5PqW9MXiWOMItSoHwYNre6Ja79e8r3HHJVcNnHxBxt2RLsYuYBp4DxZvgpMgg1lhwKI9S79r+5NAohm4HqPotreocC4TS008jvJV3Qbg6aPPEqW/300wimuMqnZMsSGE5M3KYC7sFZGEn6GffBrxNll9KBkl2iPUECgYEA2RrJps7S2H9Ll22fN5KNrt1DJJWBEeGZBpfWV7/1yZj1dlGDjvmXG3/5qwAcg0O9b8ulcX8uPb4qA4xZb8xSb9F1RmOW9oirOfSN0C0kFBZILO4iP2ZJiYjw/WEkTdPGFavZbUq9RBje1HvKcRgyFkQ85DyIv83Lylr+rUiFusECgYEAyFBzTjxMBBxUQ46FZPlvZlMasDKFeV2PAaQ0pJ+QKRYKou2CX+z4AcHNHSAUVFXWiLGBiq1HTOYwhJpGPXiYM+06lN4DZP2j4sAIMbDwLVvjDdJssPfqlD21hp3jVsZ/vzc22NnbzFEAUzpFIsuptq675EIcnZJ6YunPI2sYkiECgYEAggKmq3vDi95/GAmPhSoAKq1Z3fihuGGO0AHxW88ak0VECTy7Oc2BjfhPPPXuHTVdpisfwh3VRSgx5LoRfP+whkG6pxJQfwZM84HdwsKljlnhkvZwD+NjOjeFiVa49NpTDvtAU1CkkrkKB9ix3JQOuoLWrB8MDUBiP6XKSV7apoECgYAA5UMutVxNpGbICooUIn1aAsMayI8KNN3fzwEhP0lgtaWEhvVPQnr1Xw1wtOUCX4PfBpQir5WjBWBwJ1RrD+/2Q3hAlCGFwRCLgfpHZpgcS83fEPLFc8ZLtV7rZCdRCwAlNbT8ETVHW5FZzefjOO/gTjWu1pDUL4R2jr8LVH4+oQKBgQC5Ita8xGU5K19v6Px0PeWA/4iC9ckE9ix703F2BftQLor+/JvM2ABlE0n249u9q++j23/74bc93N+7hqDdddUBfP7cTSpSBTmFwR7dGqoRFS90JQeKVL9UcLUGLqVtuR8iRyI2HmVQNqzNYVIDviLNeRCb3fMkQmGG91+uQw0UPA==
b4e52d9b-6e1d-44e7-afbb-278058199ee3	da220a1c-3078-4d86-bf16-71923c3858e5	priority	100
51411e2d-81d4-4eb1-9618-b5b24d56bb50	39397f40-c828-4059-95a5-bc9a6de49528	kid	097f52bd-550a-4b45-8308-229e9ac4c43b
56eb5ee9-e460-4592-b5d7-19bb79ed2d95	39397f40-c828-4059-95a5-bc9a6de49528	secret	a0R9UUIZ1bpU3FbNnghyUQ
b1650b4f-1676-45ef-bb61-a901f622842c	39397f40-c828-4059-95a5-bc9a6de49528	priority	100
eeef41f5-3056-49e4-a7ca-815460c93d59	2e7b1c1f-7823-4343-9030-937eaac1dfd1	allow-default-scopes	true
96ab7e43-97aa-4908-9df3-c56441547e43	c489b84a-9833-4c39-a20f-765dc8aaecf7	algorithm	HS256
a3b7348a-a72e-42c8-b292-e1ff8e38e650	c489b84a-9833-4c39-a20f-765dc8aaecf7	kid	52f8c00a-423a-4de7-97a8-4ba8ec5a0f59
afb62b91-6483-48d6-b0b8-633b91916722	c489b84a-9833-4c39-a20f-765dc8aaecf7	priority	100
8a875006-08a7-4ccf-ac52-50f0b4a51801	c489b84a-9833-4c39-a20f-765dc8aaecf7	secret	4rjUN_czACf93n418y4Dl6OpXi5qlVuaPwYGhs-il_bvk25WQaKyQ-ry8rbcy0EJ7nBHkN6il2D9dSQIynn5Mw
116a0c80-2776-4d03-a053-491cb0e15c67	678cd7b3-88fe-40e7-b2f1-4702c3b69dc5	algorithm	RSA-OAEP
e95fb96a-d655-409b-bd49-38fba781bf23	678cd7b3-88fe-40e7-b2f1-4702c3b69dc5	certificate	MIICpTCCAY0CBgGJ/H6CLzANBgkqhkiG9w0BAQsFADAWMRQwEgYDVQQDDAtlY2d2dWVfdGVzdDAeFw0yMzA4MTYwMzU2MzZaFw0zMzA4MTYwMzU4MTZaMBYxFDASBgNVBAMMC2VjZ3Z1ZV90ZXN0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAv85r6q8vCjASIGvJG0/p1/4NRpM35eH2QeN5YZTdfhdiy3uj2C3Op4jtvklSfIoglIyO1DA9oOn1ZxqOPxLwmFiO5xpE/Ug68DSq4tyKVKQwUadp+cDttT7csQKMIbVmkAMXg7eJxFf74oPO4khm4k6NcUnNddgSXvoRxuLXoZpQ+aCEaZa6192uo5mthLx+4b4Y7XiHeIPmNPcehUILm5lKe9huE7uwkcES9ZiDZThuQMgK0k9RBlK+SVkIwqPZJ4es+gZe1QbCOaP3TZxvYCg9tvNOKzMWAFXE3ncl3q8LGZ2YlFb8hSabloJ/KzoYpjtQ9ODxuEaLqMzyuZSQkQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQCp0cyMn51F0Y6+jm+WC21HyzG/8eysB4Ny5QAv14U7a11FgRm/dR1BvwANqRomizfQPlLxzRkIeY5aUMbniqWnEYydYjGeYxaPxFPxuQIqzHuK+epWfxgyWOyfrLautnJa4Sbq8m9V07te7Oy8xGOkSoYX85laPOCImWK6i5XoIKVDvcB9tRUPO5a/rCNYnzrC4WKMpqW2TIan8lHdiQhusgHBkpgeyN/B1XM+NqSqWGE/Z2TD48WcfMG06gzXQMLi0axMhjwvXap09IN0kg9vNkK3MpFd6vaeARt+Z1+4GbVILzu68Fmm59j7ffxO6vTsFEacVdJZrRMH2XorMSX5
0efafe38-290e-40fa-8354-777a8ad45790	678cd7b3-88fe-40e7-b2f1-4702c3b69dc5	privateKey	MIIEpAIBAAKCAQEAv85r6q8vCjASIGvJG0/p1/4NRpM35eH2QeN5YZTdfhdiy3uj2C3Op4jtvklSfIoglIyO1DA9oOn1ZxqOPxLwmFiO5xpE/Ug68DSq4tyKVKQwUadp+cDttT7csQKMIbVmkAMXg7eJxFf74oPO4khm4k6NcUnNddgSXvoRxuLXoZpQ+aCEaZa6192uo5mthLx+4b4Y7XiHeIPmNPcehUILm5lKe9huE7uwkcES9ZiDZThuQMgK0k9RBlK+SVkIwqPZJ4es+gZe1QbCOaP3TZxvYCg9tvNOKzMWAFXE3ncl3q8LGZ2YlFb8hSabloJ/KzoYpjtQ9ODxuEaLqMzyuZSQkQIDAQABAoIBACLHf8r8vAdZYxgM41j3+xuGvgqDjFm7SOd2o15d23HPNMNX5oQ+/h9j1VQxQGtDspetCwMPwkUI1048QvnN6eF+AV+HZGYW8FT4/9mGCvFBGl/b/vviD1hTjznrj9RW68OGQ//GyozXNV3D78IZRcqYWs5lhwNszBv7tTh+joIHRGpoVIZkKJmVEkNjHCNKExHZ+tz7wFI3GhwzL0RLwMa8t6Yzh2ubWLa0VQbVfHp4G6+JogNcxUq88SubbqeY3PjqQG3j0FHQ7xTAdkrml9LF0k56InMtI0DeIIt07f7ncjgd43nfs5X5axThqzMv4UkMgKC0/gDyOIbuu8c0ZBcCgYEA5TRgOswq3G3fnHEUPbzqjSjdmqEL2z4FoTb4gFh6TjtSzoOccYdCtHls4JkaATQLByz6LzGEhKiIDCpH2cLeepqUdkJ0QkOO4ESuKihmVeKUcnC5ZmNbQRCUQuGgS3SbZLc4yVdmQcU/dOjhxskPCJVNGuDbNi+kI38aM7UmGkMCgYEA1jrK1uV/n5oMzzkCHPkznu+gRUbBoTXR9z0mmfa60A25hgVfE5tlUgFdFrrAxDiCvWUZO+QH6TYoy5giNRALwgRYKkXzVAmNJbQ2nGXPFCEdKG2mct+qzHsjZg5X1Dl3qIFDB2eGp7wOuTFjEF21CvvQDEgDN+OU9wd+cn/xDpsCgYB3AdblMJUglrwAEoab97chTBKj8vKhB3cM2en1WftHG25HY/aay8xKwLFTfKsP7OG8/BF6548TAh6BkoJ0AsZZimGDdcW/kixhLcfwg8F+3oKNWRIqo3QCOIWCpHwCMa1tgeSuRf8GL1Bfd3ujJ0ny/vJl/lJTtDDZbWlBZ9E82QKBgQC6eVaSlBXxARDhV8glHC34zLB/XMWy47wuL4ZoQkH+U9QHeql10a/yH8m9vTWKF36GCXhbj3PrZf9AqN4tvhfd/BYaReU2Y1H/XcyjemM0LFbLGBboqxRrBUycyyNcUeF8RXfo/A5T9vgB76FBX6/1LZe8+PoELg8+r8E7PW7AvQKBgQC9ODGkKf5/nRmb6pqvwRDtuTD1x0OM3M5PAtmJy3FE2PMiFPhp21ymCPvtcCm1IoviQ7CuABi78drNDIBWzavLvUX4zNTZunVLp0yLYvUlQzH9R4PxAqX4rutBhHQmcyKNWu7k+1xKJvvJ+HPPktTsEVfx5MVIDt70XNOiG2rznA==
7c0a79b8-419e-48d7-88ef-c14d6cb2b3e5	678cd7b3-88fe-40e7-b2f1-4702c3b69dc5	priority	100
33d6cb26-3b4e-411f-96c6-6cca0f5063fe	ad73c9db-1c4a-44aa-852e-7db31d22d76f	certificate	MIICpTCCAY0CBgGJ/H6C4DANBgkqhkiG9w0BAQsFADAWMRQwEgYDVQQDDAtlY2d2dWVfdGVzdDAeFw0yMzA4MTYwMzU2MzZaFw0zMzA4MTYwMzU4MTZaMBYxFDASBgNVBAMMC2VjZ3Z1ZV90ZXN0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuvNLpVO1miCdccm5YdjJ6VYFFE8omOZUITVQPE9GGXA6qqGZVu4wd1GCA5UVh+3q5s5eLugTA+hsGNazRSI23YHhdm8kuNmlxkB9shQrrlmQV/jWWobINcuznKGaVkfaqHoFHNlspcS6n0dC0VI/aPqXtJhWbXXeKZoGFvjXCqbmKrDzCR2U/Ybj0Z9LpuRs9cguo91+mMazSl/rsQabGwrhcvD2/xO30Fy8MfqzDXRwgu0BgyMlelwvNJrv34SL2oad47YqprEVHNcImgJ6C5xCenl90CuNVgpeGmnSUgj4d9LM82INA7e1RvhaY8qvnmhSFNr9BwItGmhyYN6VXQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQABSuYMZW+xrH0VsbrZ3/2rbIIaOhw6kqZjeoPP7+ZRefe6ykRfWluv9+jiLuHFlcPGeH66uytE+G62ohVpkcQCJ+RWHYdkPkKx0reb0Ko5/4xYLc+vNhW+nOLZstCTxyLAhOZJVJnCueb7uYYmAKMt4Y4DUh8zH/GPOqHe9qtIbtWM7Y3bEZNGv+O06cmzi6JS5e6bGNU6CzFs5lgnrgTLlbMQwJbpUFDO7gzo3IP6rEBkREfg4wfeDrQQV06ZTYxQKXc8qz4xre9Tn5Lr4Xloanq3DyjKR+xNyN7R6bb9F4I+dpjxG36wAh5/qPhT5t8UMGqHOUkZq1wym7suMUfL
bcb8b510-4327-41c5-8257-4300a0ff2809	ad73c9db-1c4a-44aa-852e-7db31d22d76f	privateKey	MIIEpAIBAAKCAQEAuvNLpVO1miCdccm5YdjJ6VYFFE8omOZUITVQPE9GGXA6qqGZVu4wd1GCA5UVh+3q5s5eLugTA+hsGNazRSI23YHhdm8kuNmlxkB9shQrrlmQV/jWWobINcuznKGaVkfaqHoFHNlspcS6n0dC0VI/aPqXtJhWbXXeKZoGFvjXCqbmKrDzCR2U/Ybj0Z9LpuRs9cguo91+mMazSl/rsQabGwrhcvD2/xO30Fy8MfqzDXRwgu0BgyMlelwvNJrv34SL2oad47YqprEVHNcImgJ6C5xCenl90CuNVgpeGmnSUgj4d9LM82INA7e1RvhaY8qvnmhSFNr9BwItGmhyYN6VXQIDAQABAoIBAAEClGreh7un59Hd1z4ejOropLUcBRt/GxYrNancTOEdCJKoWQrtprWRPLeYDldzwyxT43ozZvqJECAW9T2MSsavyZizlNjBvb2kv2BiHj5M0iCO01pjfyDh01NtDHYnD5js43wu33XcAcuTyULoFU9xEyt8iFAaLhxKKKj912CwKiks1+GZ4RESnxhQheo3V/cGiykrFM9oMkwmjubnjLhHTYtgV+qrqGkt2GCvKy81KJiy2fuOKq9WPie4oUBvnEW/DmewCwgftrCPaZll4r/Bj3eyJkuqYO7a8fBAbdamMZY5jFJhZRAPfIP3lf3BtBPAyCuEn8OhH5rhbUM3C00CgYEA3GLqcLNwQ4k9Uu98OwPxmMuaA1HtJDfKLsseF9imXTBLVBhm2TiNzwpP2IBGPtAH3nQKhXza2VZib7APzvR7KNdp50JotIsH0PHBeRpBwCn79vGtIAoZrg+3VW9aTMA/laZwfPWoXCzyZxeqc31bFz9t5BFuNSnl+t0aVqIB3scCgYEA2SktZOWoPBAE09aETdFtNbJ0n5lnh09/p+9bfPNTTXyTg0RGJEWuNKw7ewFdAMBdIqAkcLBFfqXV1cJIkYYNA+mi0KUvXWf0hmsogXB7iuJBwHi1oauOHsscoYjQn4pFTgJRSe4n/GwpYgjY8OfW+ENHQKSqnw/uadcUTFAGVrsCgYBKvNzGZYPP023Rf1fA58B50aokMBdcrfLJ1aYZ7iXU+njBRxkx1yT4LoYPZMjtqjzQ6sdap5HMHKh7OdjSlURjAFJw06uQdomrCSFUgVwE3/gLsb/FWseEqN3CgmW8G4I0rOH+7owu3itCXNs4GS3X/3Gz41ldfBz66xpwgLZjpwKBgQCv4xsiQqSdaTgPwArO4JY8zLqK3fwtayVxBnwqWwaYlxL/WdgZ3to3TVyrxzHlvuhweBarswnGh1kH1mFihJmcFqrJpVEUrXMvQDHBjTJzDcjFtL8gH8xvgoFBEIgxABQcF+JxJ9T5LT3jalkT3iOOVyep4vVS+dtXnF2TZamMqwKBgQDYqCwwG96yub+PUy2VzM7GWwGZU0DADMNn53EibLeEfAcwkeM6t1aot8jSQ2jis2iva00ZaKNHmI5v1Xd8WrAb6A9so3+W9PRmnVqRihf0/rE/THcZOI1bXaWEuthLpxxpme69YZR0HBloM0bJizUCh6Ynv7WgOdkmmf5AyfvkSg==
5f6a1964-b454-45d0-b8ce-2a0835419861	ad73c9db-1c4a-44aa-852e-7db31d22d76f	priority	100
17fa299c-38a3-4104-8808-94497f4829a4	4e9f63c7-3b44-4914-8732-4ca89ae8147d	allow-default-scopes	true
fbcdf1c4-460d-433e-bb8b-6c22b84a06c6	371b3561-bd44-4963-bbab-785e2ab58eda	secret	69CZ01sT8Yh-blwJ6m97AJAKtn3bylCs30XH2kK-ZxEYDSbrabkUMKNFtEP2LVTZr4UyG5lcGoAEIqyrL5EsXQ
3b8af707-f350-4879-99e3-37951d976af5	371b3561-bd44-4963-bbab-785e2ab58eda	priority	100
142b5f05-0e4f-4e32-adfa-571c7f637421	371b3561-bd44-4963-bbab-785e2ab58eda	algorithm	HS256
14fb5217-5f6b-4fcc-a00c-c677cf98a1ee	371b3561-bd44-4963-bbab-785e2ab58eda	kid	ea612ffc-4682-4adf-a120-aaafe742d41e
9e896b17-09f6-409c-b8aa-93f89ced488a	51d60c7c-cc83-4a4f-8c93-3f8a7aa44f04	max-clients	200
4b22ecce-79ba-4dd8-af69-0981c975e8ae	4c9f8a0a-9573-441f-88c8-d6fd88f93331	allowed-protocol-mapper-types	saml-user-property-mapper
fd906525-baf0-4ce8-8517-1c1375cf55d4	4c9f8a0a-9573-441f-88c8-d6fd88f93331	allowed-protocol-mapper-types	saml-user-attribute-mapper
c578c052-68a6-4b2a-a71d-bba04f9d4376	4c9f8a0a-9573-441f-88c8-d6fd88f93331	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
724c3c8c-f8e9-472f-830e-96f75c04ca30	4c9f8a0a-9573-441f-88c8-d6fd88f93331	allowed-protocol-mapper-types	oidc-address-mapper
8345f9af-8f1e-4da2-be35-7bcd6cc20c88	4c9f8a0a-9573-441f-88c8-d6fd88f93331	allowed-protocol-mapper-types	saml-role-list-mapper
898861b0-0193-4f58-81bf-8fb07bbcc4a1	4c9f8a0a-9573-441f-88c8-d6fd88f93331	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
e2218cb6-e888-4373-9368-14eb611ec9da	4c9f8a0a-9573-441f-88c8-d6fd88f93331	allowed-protocol-mapper-types	oidc-full-name-mapper
31f6feb7-c5d6-4b0c-98d2-47a594768871	4c9f8a0a-9573-441f-88c8-d6fd88f93331	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
e0b50f78-788a-4e78-8bd6-89e5bcd5ac77	a9cd3bb3-4890-4b67-ae1b-9e90073574d7	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
81bfb308-77ad-4c19-a96d-812298517019	a9cd3bb3-4890-4b67-ae1b-9e90073574d7	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
d4a4d957-29d0-44dc-9070-7dc821ce2d09	a9cd3bb3-4890-4b67-ae1b-9e90073574d7	allowed-protocol-mapper-types	saml-role-list-mapper
a97d1848-6d11-4d99-a9c5-1d991717fe0b	a9cd3bb3-4890-4b67-ae1b-9e90073574d7	allowed-protocol-mapper-types	oidc-full-name-mapper
816c9c10-e910-4e45-8baf-6c808307d63e	a9cd3bb3-4890-4b67-ae1b-9e90073574d7	allowed-protocol-mapper-types	oidc-address-mapper
eb1eded2-7602-4467-8557-3853a117d6b6	a9cd3bb3-4890-4b67-ae1b-9e90073574d7	allowed-protocol-mapper-types	saml-user-attribute-mapper
8f17ed14-f92a-449a-9f92-92598d90f8eb	a9cd3bb3-4890-4b67-ae1b-9e90073574d7	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
b1e01356-7860-412e-9d16-477cedd37a7c	a9cd3bb3-4890-4b67-ae1b-9e90073574d7	allowed-protocol-mapper-types	saml-user-property-mapper
6bf1c361-79b6-4766-94d8-f64491b013bc	9f014c14-50a6-490d-86e8-537bba2492da	kid	b58f246b-d1c1-4eba-ac91-8936228f049a
fb9071f7-0252-4483-b43c-1ad18e9a5cfd	9f014c14-50a6-490d-86e8-537bba2492da	secret	Jo1S9jez31KPjMS1U-hrPw
2cd22186-9afc-480d-99ce-06cc35b5a855	9f014c14-50a6-490d-86e8-537bba2492da	priority	100
25426c05-e0cb-400d-acf2-a7f2bf0f92a0	e739ae78-4acb-4137-9f34-7bf97fe6a780	allow-default-scopes	true
65487e05-0908-45a5-894c-e6d0fe7b93e4	24acbbc8-a62a-4e4c-8d99-caa8fe83f577	host-sending-registration-request-must-match	true
f3eb0c78-25f8-4b67-b80a-e476aa2098b4	24acbbc8-a62a-4e4c-8d99-caa8fe83f577	client-uris-must-match	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	564de5da-5177-48c1-9340-c274063a0693
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	57902ec0-a1b8-466e-8041-05c34a44db0c
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	70783a11-4132-4498-b3c7-4758f40158fe
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	2df48a40-f73c-4edc-832e-e7946eb8d725
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	9acfd6c9-bb97-4720-ac86-3fd0776506ea
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	240f5622-36b8-42f9-8513-e5a7b4f3eae9
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	f37ad641-9728-47f5-93ff-a68a141078e8
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	8fb2f6f1-a17a-4a8a-8dcc-43c2348c071a
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	df6ef29a-3478-4faa-8752-531741f14c06
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	a6501d3e-f61e-48a5-9298-9d323a96bcf6
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	5e7e4602-acd2-42f1-abb7-414cdbb0cba3
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	d089cf95-ac70-46fd-86d5-a3300a153751
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	ba5295ca-1c89-4dbd-9fa8-552cec65cf91
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	a568f8b0-610c-433c-9d00-9b9306396a9c
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	c68526ea-ae27-4dd3-b321-415d416db021
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	10b7ec74-ca1f-49e0-838d-36df1591803e
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	a7fab53d-14c8-4bf1-b13b-c92368537234
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	17b01e26-0942-4501-aef8-fd4da948a63c
2df48a40-f73c-4edc-832e-e7946eb8d725	17b01e26-0942-4501-aef8-fd4da948a63c
2df48a40-f73c-4edc-832e-e7946eb8d725	c68526ea-ae27-4dd3-b321-415d416db021
9acfd6c9-bb97-4720-ac86-3fd0776506ea	10b7ec74-ca1f-49e0-838d-36df1591803e
a630d05f-8f0f-4315-a09f-908b56dbdd92	d72cef89-778f-4f19-8edd-4463497081ae
a630d05f-8f0f-4315-a09f-908b56dbdd92	adb04b60-793e-4160-adc2-c9749dd9e747
adb04b60-793e-4160-adc2-c9749dd9e747	98c273a9-1d5a-4b73-b26e-5def2d892ffb
28593943-f291-4c62-8658-5ebb4c8024ff	deac41cc-0c5a-4570-a835-5321424fd952
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	2892fac1-6091-4de8-8665-62ee959068ff
a630d05f-8f0f-4315-a09f-908b56dbdd92	75f6c072-832d-43ef-83e6-b59f09febe70
a630d05f-8f0f-4315-a09f-908b56dbdd92	9682a378-9041-42c4-a653-8872db4d3f60
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	55cb1aec-8703-45c4-9825-6c2c61ad4a50
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	abf3eb56-8fb7-4e4e-8e87-0714f953655c
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	073d8f3b-fe2c-456a-8703-c68f6c468902
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	8c08bf36-9abd-4b1d-9da7-300b424a3155
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	777853a3-53cc-445f-8ac5-b1c8e17fc826
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	8f1e85dc-186d-4939-b345-67879ca63a8f
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	1b6f3ef4-e180-487e-8ff9-e223beac3143
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	9f730877-6614-4819-b441-036ffdc3e7db
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	aaa13251-8f0d-4943-a197-72b038b572de
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	5338ae18-f027-4ec8-be88-456cca1f95f0
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	ab66d46b-555c-4b25-9f01-0b73f56499d6
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	bd44d109-908d-43ea-9b72-244f2ea39649
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	e419e201-505e-425c-8306-4d597af43df7
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	b5e59694-37f0-4211-945c-f2d07e55d54e
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	b679f682-fbcd-446b-a2d8-1e44a14ce9b2
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	cebff73d-43f3-4808-a269-487a99405f45
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	49cf21a1-b0c6-4f07-8a7a-7e72e3cbfe8b
073d8f3b-fe2c-456a-8703-c68f6c468902	b5e59694-37f0-4211-945c-f2d07e55d54e
073d8f3b-fe2c-456a-8703-c68f6c468902	49cf21a1-b0c6-4f07-8a7a-7e72e3cbfe8b
8c08bf36-9abd-4b1d-9da7-300b424a3155	b679f682-fbcd-446b-a2d8-1e44a14ce9b2
235b7ba1-c0f3-414a-b2b6-6ba04f7e5f43	ea7d2f1c-cf6d-428f-91d4-4e63910186fa
235b7ba1-c0f3-414a-b2b6-6ba04f7e5f43	2c4f22e3-d3dc-47e2-b8f0-fcde5236d0a8
65aa1435-eb72-4925-94ee-737c65c93089	41864266-7c38-4cb7-8a53-acdd63a3105d
65aa1435-eb72-4925-94ee-737c65c93089	e789998b-0b9a-4f3f-9cba-5ce693d54b6b
65aa1435-eb72-4925-94ee-737c65c93089	56bfe62c-bdb0-42f6-8351-4e38f6370a6e
65aa1435-eb72-4925-94ee-737c65c93089	745167cf-3a7e-4302-9027-f7ec388b2fa2
7b0e47f1-3687-4641-bfdc-c47728abf91e	971c8a63-50f4-42fd-96fe-bff483996025
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	235b7ba1-c0f3-414a-b2b6-6ba04f7e5f43
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	1a3a4805-03f4-4a19-826c-e419e7d0e49b
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	ea7f6cab-0b72-46cb-b805-580f886c7baa
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	7b0e47f1-3687-4641-bfdc-c47728abf91e
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	971c8a63-50f4-42fd-96fe-bff483996025
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	5006cccc-ecf9-433c-80de-be06e6cbb81e
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	2c4f22e3-d3dc-47e2-b8f0-fcde5236d0a8
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	75dedb29-1dbd-4cdc-bba1-0bc0eb805b6a
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	be87eb49-aa0c-490e-b78d-fd684d51f0c5
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	449612b0-012c-4869-a65c-8f78ea22895f
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	91b2d6d7-6b0c-4142-9c26-b2b45e0690ca
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	43a70a76-90b5-4320-a274-126ffc80a1b6
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	ea7d2f1c-cf6d-428f-91d4-4e63910186fa
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	c90bf2ad-3447-4444-b3ba-21d3563688f6
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	221c9293-f38b-458d-8400-db169a5b9d22
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	6a1f4950-14c8-465e-ae14-361160c61345
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	bbe55091-5055-47c2-835a-2123fc5ccd7d
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	8cee6636-9527-4d12-895d-bf21e11ec843
e789998b-0b9a-4f3f-9cba-5ce693d54b6b	0af23ec5-9c11-489f-bdb7-d2fdeef78d1d
eaa471ce-d6c2-4f77-8f95-55438bb50722	ca95fa5d-e131-4d23-adab-ca29ab55ad47
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	8fa6b10c-3fc4-47d9-beb8-64360f01bc41
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	aed2e846-2cb1-4c30-b7d9-7d63048bc322
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	b459fe70-743f-4fe2-b9d5-6d1ee7b4b825
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	1e4809f6-8326-4029-849f-065b6cbe6b09
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	d9ddf0d7-1ac8-4834-8cfc-381bf7f468ef
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	beaf38c1-e820-4f83-8eed-eeb1a607f9a8
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	8a17f193-190e-4b7b-80f6-bdd686b244f4
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	67197180-8ad8-43f6-8c8c-622982cc9aa6
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	595574fd-93f7-49ac-989f-c79ff49cbd98
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	478c5117-1e0b-4c87-9fc6-070767964046
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	0cffcabb-0440-47d0-8e9e-2f7544ebc33f
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	061af8a7-9bed-4fe8-afa6-bac04653faf5
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	ca6dc41a-a6ec-4c41-ab6b-950bf681c711
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	0ac59f32-04c1-43a3-883c-a4bf393a332f
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	63003fd9-8db8-4a0c-8c2e-279951ea0224
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	ff452031-aea2-4d24-9eb7-0129684b6dd8
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	569f7a2b-7602-40ba-b13a-b1ee1141931f
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	01745345-bde6-4563-bed0-454ee5a98a4f
1e4809f6-8326-4029-849f-065b6cbe6b09	63003fd9-8db8-4a0c-8c2e-279951ea0224
1e4809f6-8326-4029-849f-065b6cbe6b09	01745345-bde6-4563-bed0-454ee5a98a4f
d9ddf0d7-1ac8-4834-8cfc-381bf7f468ef	ff452031-aea2-4d24-9eb7-0129684b6dd8
09f14aa1-3f02-4df8-a8ee-5b9878faadcb	83a95184-bd87-4dce-9ffb-27ae17e8d88a
0c3d8bd8-047d-460a-9280-b50b641ba02a	3b2f46cb-5f15-46b4-9f3f-a290714dad8c
45680771-5407-4510-a5eb-8d08e7922847	4a02475d-1ae5-47ea-b83b-5fbafc13ace6
45680771-5407-4510-a5eb-8d08e7922847	e47d854c-12bf-42d7-b7ac-3a09def24036
45680771-5407-4510-a5eb-8d08e7922847	c709960d-4255-4db8-8348-98de6038789c
45680771-5407-4510-a5eb-8d08e7922847	81224b77-7e5f-4ce9-9581-d861e9cd0ebd
45680771-5407-4510-a5eb-8d08e7922847	842b2522-848f-4cec-b223-7a3cd3503b49
45680771-5407-4510-a5eb-8d08e7922847	020f3aa3-1eb3-4700-9b05-898c78f23fbf
45680771-5407-4510-a5eb-8d08e7922847	3d82b5ba-65b3-47b5-a8ef-f2f99f78ee5b
45680771-5407-4510-a5eb-8d08e7922847	77bb1e7a-aa48-4e1c-a4c6-9eb7d2ddccff
45680771-5407-4510-a5eb-8d08e7922847	ff7fe238-ae1f-4f31-8d90-aaa259e147f7
45680771-5407-4510-a5eb-8d08e7922847	89ae04e8-5830-401a-ad8f-ed9a561c9b06
45680771-5407-4510-a5eb-8d08e7922847	42ecc68d-0fe0-43b8-9f3b-20d1e8a7b44c
45680771-5407-4510-a5eb-8d08e7922847	0c3d8bd8-047d-460a-9280-b50b641ba02a
45680771-5407-4510-a5eb-8d08e7922847	99eb8e46-70eb-44c7-8578-02cd22ffa09b
45680771-5407-4510-a5eb-8d08e7922847	6133bf7e-4935-4fc3-89bf-7bab9a5babe2
45680771-5407-4510-a5eb-8d08e7922847	3b2f46cb-5f15-46b4-9f3f-a290714dad8c
45680771-5407-4510-a5eb-8d08e7922847	bb2f0e61-7e0b-444e-a09b-c6756fa496ce
45680771-5407-4510-a5eb-8d08e7922847	7535da06-2c06-4986-975f-ffd93d0390c2
45680771-5407-4510-a5eb-8d08e7922847	c11cc104-7d90-438d-9a55-2a02b6d59718
93b0d98c-4824-4e9f-82e7-50545a06287d	e26b5b1b-06f2-476c-ab7a-0a382c6c708e
98575750-78cc-4a33-85ae-f3688af59051	eb054eb2-f7ba-45c6-834b-ada129a417da
98575750-78cc-4a33-85ae-f3688af59051	521ce7d8-a397-4c51-b6db-c0e4b9978894
98575750-78cc-4a33-85ae-f3688af59051	74c1337c-f6dd-47b8-bb7c-c5894aadf46e
98575750-78cc-4a33-85ae-f3688af59051	93b0d98c-4824-4e9f-82e7-50545a06287d
c14142ef-e8ed-4cab-b05f-dfe0b79a10d6	eb054eb2-f7ba-45c6-834b-ada129a417da
c14142ef-e8ed-4cab-b05f-dfe0b79a10d6	521ce7d8-a397-4c51-b6db-c0e4b9978894
c14142ef-e8ed-4cab-b05f-dfe0b79a10d6	74c1337c-f6dd-47b8-bb7c-c5894aadf46e
c14142ef-e8ed-4cab-b05f-dfe0b79a10d6	93b0d98c-4824-4e9f-82e7-50545a06287d
ff7fe238-ae1f-4f31-8d90-aaa259e147f7	e47d854c-12bf-42d7-b7ac-3a09def24036
ff7fe238-ae1f-4f31-8d90-aaa259e147f7	7535da06-2c06-4986-975f-ffd93d0390c2
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	5dc5b625-f9e9-4286-a1b1-b84333cb0b17
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
d8e9fe49-b87d-448e-a9ab-e5ccec8cc95f	\N	password	4a9a5a8b-422f-4731-85db-f34cd55634b2	1691995764407	\N	{"value":"fA5xRUM9gIEtIHDZfHC0UbHU2AEz/IzZb+pYuoR/c+8=","salt":"pT7pFMWQQZs6EZFyauGWVw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
eefbdde8-e47b-4ff5-8137-327ceaad17a0	\N	password	1b3aa467-1bd5-4df1-8a6f-2a638e9e67fb	1692002831553	\N	{"value":"eyRPFBefoQOXSboF2fWLKU4+ghiMgQugV3+x2oQDS4M=","salt":"s81IV+Vv0xfbFOgDepZiBA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
3c9ef2d6-dceb-43d7-b659-e1ad1304f481	\N	password	d10fe7f6-88ec-438b-a2c4-947f0dd71f40	1692003079987	\N	{"value":"/173+7BpgJrpZD4xjVu2NMdCJSpJynTT78TZ0lN+6mU=","salt":"6v66vvcaPOww3Dct1+krJg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
f309aad9-6fa0-485c-809d-beab50077c78	\N	password	465b18d5-a27c-47ba-b123-707dc46c5cdd	1692003231178	\N	{"value":"pMLeGoBQhYqL/QavbfE+Ur4pyTtiP1KzFl2RjwurBtw=","salt":"YpTDhrzuxV7foLvt3C4aSQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
4cc0d882-563e-47d2-9d4a-4c554c7be2d0	\N	password	72dc9077-39fc-4bc4-b7e1-6161ee42fc48	1692003278144	\N	{"value":"cB3zE2KMKl40g1489iZVgQhcveQwmCN6iya1SLkBqcc=","salt":"inXDto6rpPLFOfO+I/aQKw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
32a46290-3f8d-4d77-bdb9-db41ead92b10	\N	password	ae6377a3-9809-4c57-887e-39b74f1ab9be	1692003350983	\N	{"value":"yzWR1GKe1cBvM4dH79SvJMVhcGhM7P7CaUxMMQ7s9PQ=","salt":"FjiFnBAF2Oe1Li0qLbD20A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
45d35e1b-7548-4321-9228-5177be479a82	\N	password	6b7be798-7d17-49fe-9184-a05dd95b129a	1692003369625	\N	{"value":"BYTYdWCfAWNgqSuPmRYtaz10NG6hzX9/CdA2Bc2I4d0=","salt":"31laA45kyY8BIJDFN2YdIw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
8811b0a6-ce7f-4eae-af82-7d47f79f7c28	\N	password	86ce729a-390c-445d-a60b-be12b139d434	1692003805154	\N	{"value":"FDvuAYETgHB6LiK8YzG2hBysiUmCCgPNe+3mJYE5Rhc=","salt":"aPH3l+OF0xEYpe/hpOKtbw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
89824d52-796b-45af-a80f-15775b9c14f6	\N	password	a33b3d95-bd48-4056-804c-20236917e169	1692166528340	\N	{"value":"K1dlO+/fNGBxqqBDpuK8OyWbTYolReUKzMuAGXDKVnw=","salt":"6Wr6yUrWG7F0xl8HLulO0Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
42fc0620-2c7f-421e-b1eb-11a9859938af	\N	password	094ab296-50ae-4871-8c56-df05dc1c7f14	1692167049499	\N	{"value":"eCq3x+xGKixtPWOQ2wkcxq8tbV+Q0YvwZEBA9D2wmt8=","salt":"M4hYth8eev8R+ZlzILu4MQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
dc370649-fda9-44c6-ae7f-f614576519b9	\N	password	f1eaab0f-de5e-4084-a61d-3064d9c35b61	1692167085606	\N	{"value":"H0+VWM/KsAzD9nEw1eVae4mOaoc5s8hYAEHVF18GdAI=","salt":"VkQJO9PIqHvHUgNC5Nseuw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
6058c044-64f1-4961-9567-9db98be9e663	\N	password	c3c6c636-1a60-4491-9feb-92959e1a3c6c	1692167411129	\N	{"value":"UqwwZP6bWGNIR7rx1qZ4i9ZTzjDibfJ9lm4TjBMA+YM=","salt":"QrHiJBBz7l4S7xobeFqbdw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
4971f6c3-ec65-4ee0-98ab-984af2b8aae8	\N	password	01550362-ec22-4b11-81d7-607eaf197b51	1692168300768	\N	{"value":"7a1RPEFpKo8JGLpytqWSFeAHtt/v8VZkIww45ilPPiw=","salt":"est2q9HPNiyoOOfr+OYN8Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
02d1fa98-71b6-485c-afda-c5d2f56e4757	\N	password	1de09fb6-cc86-4db0-88e4-c0e3f31fa42f	1691996371895	\N	{"value":"sKNkZIvb6uM6qXVI+CumRhGtdayxR2gGT6a0357Dhnc=","salt":"4gXXRIZAUn93Jhpp0udvfA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
716526b6-f859-494e-a9d8-1bb2508ac2f7	\N	password	0ca09762-e817-4e1d-aa47-d2f33fff3c66	1691996372008	\N	{"value":"3pPI3+TBEeeJ4QNr3pamlf4iZOcrZOFTQ0L4TmSICYg=","salt":"DWRwfkOe2h/GXnSxpyXS8A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
52dd2d95-c599-4e2d-84dd-b329acaf3fae	\N	password	8f77adc0-ee6f-4968-9aad-99f0ddfb8454	1691996372318	\N	{"value":"HsGh9Vd2NpT9p5a1hwlaRrrdsQDW8mOweEOYlJngB+E=","salt":"xPkj1L7qsijPsdXG9sy6eg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
76373e47-2905-4a1f-9ee0-e581c7740dcb	\N	password	c55138b1-f10b-4bc5-8042-9da8e7e7f9fb	1691996372398	\N	{"value":"v8RZSCtKSMEBN9WWOgW0VEscRwJkIsYVBpaZXemCYkM=","salt":"UDaXbzlotrJeNxEgbqwx9Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
5d642843-6f77-45d4-b6d4-142fb2789f69	\N	password	62333f60-9be1-4703-b80b-59ad49039485	1691996372475	\N	{"value":"yPf0edcry3JuIDumujtaYWEaIIi9m1Z8CWYby+xqJIE=","salt":"elAJtbcF12txSfSnbUWpFg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
f0be80ba-a817-47a7-9280-fb4791a4a99d	\N	password	9d37a8e6-1057-4d51-a8bc-b1fa894d5a43	1691996372561	\N	{"value":"TS8y0F+9APo1cf1SmFGKDzsc5ow8ub9UPRa2vH4JJ40=","salt":"XavUPTb8HMrSAAM6P9HhWQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
e2f2c7c2-90e5-4cf4-8bb5-60ca58209fda	\N	password	75146597-f1ef-4cb6-9b8d-ae0d41d751e6	1691996372643	\N	{"value":"tamJjXmpr1+5hXW3+ecV+arjY5+w7+5+xeFevjfZnyY=","salt":"nzIsNffbJOs/6Tu8UAP4nQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
6e815fb6-c168-4dde-a596-55df1b47b30d	\N	password	b7910098-86d5-426a-acfe-4660ef67b383	1691996372916	\N	{"value":"rN1bgJezdNg85vZVZ6NT6DTxkgWgMdq0ILB7tS+luEk=","salt":"Pt0t5HNQZKhX7FvZmsxviw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
f23cc55d-50c2-4df6-8e3c-f5c2475b694c	\N	password	7db2f70f-8790-46e0-9c1f-bd5376a1411b	1691996373153	\N	{"value":"0aq7oNl5gxti2BLOYPeVTFJJuLcLsy0SxdMa/6ogH1w=","salt":"37oTU7pnV1f+CTPOXDGp9g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
93cd050d-f58d-4a99-b177-18cd60d0c4d6	\N	password	bc2824c9-0dcb-4f59-a67a-e7d0f5168f5c	1692168300862	\N	{"value":"Lpxo50lmyqhX6B4DKy8vCCSIUdXH5qib5csK5EwDm18=","salt":"B7eWfApCAXtvYOWlnwZZMA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
09994801-69ac-4bb6-a367-48090b9000d3	\N	password	809406ce-c1fc-47a8-9eed-3393a41ad9e5	1692168301210	\N	{"value":"nqtCDKJUseDpjCxa1WaU677iHmDHB4JQO3cUHNmlrAE=","salt":"HZ0eOeUXZmD7BlFiJbb4RQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
6664dea6-ef26-4ccb-80c8-799ad3e7489f	\N	password	1f09e5a2-94a8-4c5d-b0e5-3aa5fdeb6690	1692168301296	\N	{"value":"Wq/f+ZVtcxX4niRlM/TkanL0aZ09Su7vu9HHrSeKhQs=","salt":"xzGVA9evaynqtvSB7qOmlg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
175dc3e6-d75b-4953-8fb3-467017685512	\N	password	e0f3a790-bdec-4773-a6f8-74ff99974379	1692168301380	\N	{"value":"A/L/xJLzn3m4ydw/zpVJBznwMDUX0rd49PKN1agF1fI=","salt":"+5dkXCHWtRJ+NcBjlhQhiA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
63854ce2-1cc8-449a-ac93-d980f5a1831e	\N	password	510e5ac0-a790-4c85-b9df-31834fe775e6	1692168301489	\N	{"value":"4B3B48XdCrkyEIxYw8K6kNjM6JskaoH0yjcjd5dy170=","salt":"qYD8sZMfdARC3fMim8Y4Jg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
dd833f72-7368-4c80-a466-af7a1d62c190	\N	password	3085d08d-0bf2-4682-9ee6-8f45d86bbfc9	1692168301591	\N	{"value":"jHvg6xLMHL64O1qkX+C/HPjcaqYhSoiMgQuGw1T5bmk=","salt":"TUvP0PVD1Sv0a2Mlbdqy2A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
d0416bf9-7cbc-4dc4-8f54-3a165cfb2fd8	\N	password	f738e3d2-d3a5-4eca-b9d2-95654d648536	1692168301918	\N	{"value":"knZUOeQba9JnzWEN5eskpfA+EShPw4blIfQTxgzKOdU=","salt":"+OeTeoayL2vLsYyBEySSKQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
af1f0050-094a-4c40-b0c9-b1bb84c45519	\N	password	ae31e892-465d-478e-b580-7c50c7bedd21	1692168302229	\N	{"value":"iIouX9rjh9F8KOMqqEvCEfwc5N+e9/2AwJaMIpKuYQA=","salt":"8LT33YpuW3Q4z5A4TwuNKg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
d6691b9e-7cbe-44bd-9cc1-bbdb37397676	\N	password	5fb5d325-8e17-4b62-9cfd-520f3aa6f586	1692168432897	\N	{"value":"xxlqd6WEz2PdpnB/6Hg+4njMyEm3eoY6ZQlO3dBShFk=","salt":"CsaAiR0oPwwV2hY3Cedr9w==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
db061405-50a2-4e5c-bb35-667b2387671b	\N	password	b374dddc-4626-4d3e-b1bf-e445e2de1897	1692168432994	\N	{"value":"l+jNb2/bVXzzFZKnmEZ6xgmAiD1PXLeonfBMoMwjLnI=","salt":"W/ODTIw4odRr2SjT8tHICA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
800dc7e2-8a95-4763-963e-7b9023ad6b3c	\N	password	1693758e-4aaf-4b3c-9201-53dff25bb796	1692168433301	\N	{"value":"UpzYGUmRBfmag9sHhO6R+lv+Tmiao4hqdNkHQyLcgTs=","salt":"ZBBzgVhxnP3W4ttpKL54yg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
f203f308-224e-48ee-9e30-3c4129d14e9b	\N	password	e31ebbb6-ada7-42d1-938b-57f196235347	1692168433396	\N	{"value":"9OjF1W0xN+Qp8DC0Err+ZeP1dfTZXzNP05ZRtsvS2vM=","salt":"scLimocpUebqEdXU3EhSKA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
b5a83bd0-ba8d-456e-b91c-165749d0b4da	\N	password	8356010a-f011-4ad7-83b8-680e96d0311d	1692168433482	\N	{"value":"SQISn+XrmQ1LI1pmmA/6HNqdWilfXloF+nST21ueGt8=","salt":"EWNn38kuli6D3I/yNiqA5g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ffbb379d-7939-4059-8bae-ad0d7047deb1	\N	password	a7bc6f61-dc81-4b1f-9e4d-22f4fc6261c5	1692168433586	\N	{"value":"EX3ejSpBZWBdsEx8t+geNr/j2HbE78XcIRXkSh+iuQo=","salt":"n3wtnS+z6VOhgz6bYpfi9w==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
4c2c4aaf-e387-4cf1-b65d-0d30a20bcb50	\N	password	91db1cb1-5c5e-4480-83b1-ee0e064e7a2a	1692168433771	\N	{"value":"iiZlc/tcPr5IRhrNR6JInEiaYsLb2OdlQHWylKHdEs8=","salt":"Nfkgzvpyd5JKq55YdVeW4w==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
0f41fbf3-f753-4120-a2ff-bc4b0adcba35	\N	password	950150f9-b0a0-45be-b53e-510a70c018e5	1692168434123	\N	{"value":"TlrmFrf8CbUeIBSRULNyEC7pQ/WI69pKROuk0OOGEek=","salt":"8vB71Kn8H3ps3VXrvs39Wg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
a2732819-f2a4-43e9-a9c9-0ff5ce74c417	\N	password	03a8aef9-fc64-474b-9adc-90a4c1ff2d4c	1692168434431	\N	{"value":"eCmP6mFW8X1d2Bd46kYin89ki1Ofm1GmgiKLGD6OY9c=","salt":"ziNadJKkmR/FagLkQ8jnVw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
21b2103d-b924-40fc-8383-c45dcc82a617	\N	password	cefaa241-12d7-431d-bc52-89a6fd17a2e6	1692181657061	\N	{"value":"p1OXDd0IFXscbJpisY1dIpXn3L8xaPUCr3LFOhA25mU=","salt":"qrRDfzHvf6Tmy3AdwmdZ8g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
e92774b2-c926-47db-bd3a-6331b8150595	\N	password	53b07ec8-73d9-4ffd-8071-f9a73b20f330	1692185840527	\N	{"value":"lqUwE20MCRrfI2MTO3WNxEPYnhC1jPv+t5s4OcfVoHo=","salt":"UNcAx0LtnOBbrTSHCGVRMw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
71ecf08e-eabb-471b-92b8-d06d7ab4b123	\N	password	94610168-c5a1-44f1-be05-bf7a09e98ab1	1692185873291	\N	{"value":"9rR2cA2Z4uHqWMigjHto8cYU6SuzEGA+PIWatsI1NJA=","salt":"mELvz6iAqilXMjU5dkWpmQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
46e80749-1363-4191-a87b-ba5a19bac536	\N	password	b50fceb3-d68f-45af-a95e-ef39768d7be0	1692185877215	\N	{"value":"szbLObxDucMgrCeL+LwpIAbKoQ0Hulx2bUXAVhbBEi4=","salt":"cXIKSCcW09cIL5lXZHlRHw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
82cb88c9-9d49-419d-ba03-e302ad440e12	\N	password	6fa2fc79-3a21-4947-9ede-a850288e7764	1692185881002	\N	{"value":"3D9ZFlY+zCzPdFnAT4ks3Mrp+GOlXkdnPvTad/r11go=","salt":"pNYW2ArSxHHJRmcX44uxlw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
5eed49c7-7a74-4cc7-991e-22af37dbe2dc	\N	password	c50a0b33-8455-4c81-816c-19aefba992d4	1692185884618	\N	{"value":"4Wa4bX3QVOnd8zt+N8wyJ69QBUtQItmjIjqoeKgEvqU=","salt":"a0Kpi6EaD8RsSYUW7Fi4Cw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2023-08-14 06:49:20.328193	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.16.1	\N	\N	1995759796
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2023-08-14 06:49:20.335553	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.16.1	\N	\N	1995759796
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2023-08-14 06:49:20.388991	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.16.1	\N	\N	1995759796
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2023-08-14 06:49:20.397183	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.16.1	\N	\N	1995759796
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2023-08-14 06:49:20.528841	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.16.1	\N	\N	1995759796
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2023-08-14 06:49:20.532837	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.16.1	\N	\N	1995759796
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2023-08-14 06:49:20.639275	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.16.1	\N	\N	1995759796
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2023-08-14 06:49:20.64351	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.16.1	\N	\N	1995759796
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2023-08-14 06:49:20.649118	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.16.1	\N	\N	1995759796
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2023-08-14 06:49:20.783016	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.16.1	\N	\N	1995759796
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2023-08-14 06:49:20.850156	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.16.1	\N	\N	1995759796
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2023-08-14 06:49:20.854113	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.16.1	\N	\N	1995759796
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2023-08-14 06:49:20.867772	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.16.1	\N	\N	1995759796
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-08-14 06:49:20.904382	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.16.1	\N	\N	1995759796
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-08-14 06:49:20.908464	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.16.1	\N	\N	1995759796
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-08-14 06:49:20.912643	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.16.1	\N	\N	1995759796
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-08-14 06:49:20.917101	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.16.1	\N	\N	1995759796
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2023-08-14 06:49:20.971622	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.16.1	\N	\N	1995759796
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2023-08-14 06:49:21.028637	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.16.1	\N	\N	1995759796
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2023-08-14 06:49:21.036978	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.16.1	\N	\N	1995759796
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2023-08-14 06:49:21.040881	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.16.1	\N	\N	1995759796
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2023-08-14 06:49:21.04547	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.16.1	\N	\N	1995759796
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2023-08-14 06:49:21.065577	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.16.1	\N	\N	1995759796
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2023-08-14 06:49:21.074309	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.16.1	\N	\N	1995759796
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2023-08-14 06:49:21.0781	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.16.1	\N	\N	1995759796
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2023-08-14 06:49:21.162734	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.16.1	\N	\N	1995759796
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2023-08-14 06:49:21.296677	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.16.1	\N	\N	1995759796
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2023-08-14 06:49:21.301496	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.16.1	\N	\N	1995759796
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2023-08-14 06:49:21.426917	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.16.1	\N	\N	1995759796
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2023-08-14 06:49:21.450329	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.16.1	\N	\N	1995759796
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2023-08-14 06:49:21.473667	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.16.1	\N	\N	1995759796
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2023-08-14 06:49:21.478887	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.16.1	\N	\N	1995759796
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-08-14 06:49:21.487188	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.16.1	\N	\N	1995759796
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-08-14 06:49:21.490855	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.16.1	\N	\N	1995759796
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-08-14 06:49:21.528467	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.16.1	\N	\N	1995759796
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2023-08-14 06:49:21.536524	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.16.1	\N	\N	1995759796
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-08-14 06:49:21.550153	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.16.1	\N	\N	1995759796
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2023-08-14 06:49:21.557832	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.16.1	\N	\N	1995759796
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2023-08-14 06:49:21.566209	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.16.1	\N	\N	1995759796
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-08-14 06:49:21.570293	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.16.1	\N	\N	1995759796
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-08-14 06:49:21.575036	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.16.1	\N	\N	1995759796
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2023-08-14 06:49:21.5815	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.16.1	\N	\N	1995759796
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-08-14 06:49:21.903233	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.16.1	\N	\N	1995759796
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2023-08-14 06:49:21.911748	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.16.1	\N	\N	1995759796
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-08-14 06:49:21.91963	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.16.1	\N	\N	1995759796
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-08-14 06:49:21.924939	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.16.1	\N	\N	1995759796
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-08-14 06:49:21.928666	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.16.1	\N	\N	1995759796
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-08-14 06:49:21.995824	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.16.1	\N	\N	1995759796
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-08-14 06:49:22.003945	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.16.1	\N	\N	1995759796
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2023-08-14 06:49:22.09728	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.16.1	\N	\N	1995759796
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2023-08-14 06:49:22.173708	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.16.1	\N	\N	1995759796
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2023-08-14 06:49:22.18221	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	1995759796
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2023-08-14 06:49:22.187488	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.16.1	\N	\N	1995759796
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2023-08-14 06:49:22.19238	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.16.1	\N	\N	1995759796
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-08-14 06:49:22.206376	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.16.1	\N	\N	1995759796
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-08-14 06:49:22.214514	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.16.1	\N	\N	1995759796
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-08-14 06:49:22.272664	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.16.1	\N	\N	1995759796
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-08-14 06:49:22.400723	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.16.1	\N	\N	1995759796
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2023-08-14 06:49:22.445479	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.16.1	\N	\N	1995759796
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2023-08-14 06:49:22.453859	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.16.1	\N	\N	1995759796
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-08-14 06:49:22.463207	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.16.1	\N	\N	1995759796
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-08-14 06:49:22.476817	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.16.1	\N	\N	1995759796
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2023-08-14 06:49:22.484686	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.16.1	\N	\N	1995759796
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2023-08-14 06:49:22.48908	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.16.1	\N	\N	1995759796
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2023-08-14 06:49:22.493414	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.16.1	\N	\N	1995759796
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2023-08-14 06:49:22.52207	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.16.1	\N	\N	1995759796
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2023-08-14 06:49:22.535484	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.16.1	\N	\N	1995759796
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2023-08-14 06:49:22.543502	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.16.1	\N	\N	1995759796
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2023-08-14 06:49:22.558677	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.16.1	\N	\N	1995759796
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2023-08-14 06:49:22.567045	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.16.1	\N	\N	1995759796
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2023-08-14 06:49:22.574752	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.16.1	\N	\N	1995759796
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-08-14 06:49:22.583351	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.16.1	\N	\N	1995759796
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-08-14 06:49:22.589259	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.16.1	\N	\N	1995759796
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-08-14 06:49:22.59292	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.16.1	\N	\N	1995759796
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-08-14 06:49:22.604341	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.16.1	\N	\N	1995759796
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-08-14 06:49:22.6182	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.16.1	\N	\N	1995759796
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-08-14 06:49:22.625945	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.16.1	\N	\N	1995759796
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-08-14 06:49:22.629667	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.16.1	\N	\N	1995759796
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-08-14 06:49:22.653839	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.16.1	\N	\N	1995759796
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-08-14 06:49:22.657714	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.16.1	\N	\N	1995759796
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-08-14 06:49:22.676783	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.16.1	\N	\N	1995759796
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-08-14 06:49:22.680602	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.16.1	\N	\N	1995759796
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-08-14 06:49:22.688967	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.16.1	\N	\N	1995759796
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-08-14 06:49:22.69277	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.16.1	\N	\N	1995759796
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-08-14 06:49:22.706649	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.16.1	\N	\N	1995759796
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2023-08-14 06:49:22.715152	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.16.1	\N	\N	1995759796
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-08-14 06:49:22.724354	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.16.1	\N	\N	1995759796
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-08-14 06:49:22.74527	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.16.1	\N	\N	1995759796
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-08-14 06:49:22.754911	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.16.1	\N	\N	1995759796
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-08-14 06:49:22.764279	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.16.1	\N	\N	1995759796
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-08-14 06:49:22.778619	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.16.1	\N	\N	1995759796
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-08-14 06:49:22.788061	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.16.1	\N	\N	1995759796
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-08-14 06:49:22.791812	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.16.1	\N	\N	1995759796
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-08-14 06:49:22.807011	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.16.1	\N	\N	1995759796
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-08-14 06:49:22.811039	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.16.1	\N	\N	1995759796
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-08-14 06:49:22.820756	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.16.1	\N	\N	1995759796
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-08-14 06:49:22.846969	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.16.1	\N	\N	1995759796
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-08-14 06:49:22.849785	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	1995759796
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-08-14 06:49:22.864462	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	1995759796
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-08-14 06:49:22.879641	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	1995759796
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-08-14 06:49:22.883508	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	1995759796
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-08-14 06:49:22.900922	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.16.1	\N	\N	1995759796
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-08-14 06:49:22.907631	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.16.1	\N	\N	1995759796
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2023-08-14 06:49:22.916181	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.16.1	\N	\N	1995759796
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2023-08-14 06:49:22.93523	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.16.1	\N	\N	1995759796
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2023-08-14 06:49:22.950362	106	EXECUTED	8:4b80546c1dc550ac552ee7b24a4ab7c0	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.16.1	\N	\N	1995759796
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2023-08-14 06:49:22.955696	107	EXECUTED	8:af510cd1bb2ab6339c45372f3e491696	customChange		\N	4.16.1	\N	\N	1995759796
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-08-14 06:49:22.969588	108	EXECUTED	8:05c99fc610845ef66ee812b7921af0ef	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.16.1	\N	\N	1995759796
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-08-14 06:49:22.973744	109	MARK_RAN	8:314e803baf2f1ec315b3464e398b8247	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.16.1	\N	\N	1995759796
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-08-14 06:49:22.983355	110	EXECUTED	8:56e4677e7e12556f70b604c573840100	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	1995759796
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2023-08-14 06:49:22.989119	111	EXECUTED	8:8806cb33d2a546ce770384bf98cf6eac	customChange		\N	4.16.1	\N	\N	1995759796
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2023-08-14 06:49:23.056174	112	EXECUTED	8:fdb2924649d30555ab3a1744faba4928	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.16.1	\N	\N	1995759796
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2023-08-14 06:49:23.060025	113	MARK_RAN	8:1c96cc2b10903bd07a03670098d67fd6	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.16.1	\N	\N	1995759796
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	bfda63e1-1922-4c3d-a141-5b1395cfb980	f
a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	1ecefd7a-2a0e-4579-81c4-5bc3a640f368	t
a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8	t
a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	8a81d9c7-7986-4697-afe3-9d48c0d1bd16	t
a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	83399c51-a0b9-4694-bd12-12ddf2a6de8f	f
a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	7dfd8353-53e6-4152-9ce6-63a9327e2297	f
a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	009e1b2c-8ad3-4e27-9e38-c2cec9a86ba5	t
a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	c6d0de5a-674f-4e90-a7b3-6052971e8c18	t
a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	83628b9f-695c-4609-a797-23b2b0fd1416	f
a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	0c5859a4-d620-49bb-96e5-44afdebd31f4	t
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	1c24bfe0-68ec-457a-8fb9-8f6fccde0ba5	t
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	43869505-7a24-424e-9ada-0cef970169a5	t
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	111caa50-b290-43a8-b04a-cce3c73dbefa	t
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	29945782-f537-4661-beb2-eb77c9d23669	f
aefd2657-49a5-49c5-8baf-3f385b695e4c	24f77fc1-6495-4de2-9be1-d514f0dd13e0	t
aefd2657-49a5-49c5-8baf-3f385b695e4c	8a58d093-cf7a-4ece-9bd1-b8fa6769102f	t
aefd2657-49a5-49c5-8baf-3f385b695e4c	9f3a037d-e705-4b11-92fd-39cb4cead1ca	t
aefd2657-49a5-49c5-8baf-3f385b695e4c	0e9a644a-e2f6-4604-8067-c2c063711b39	t
aefd2657-49a5-49c5-8baf-3f385b695e4c	8c191ac3-be5b-46ba-8d12-de837c0633be	t
aefd2657-49a5-49c5-8baf-3f385b695e4c	2c79b6f4-e825-4bd6-ad09-a690bbce720f	t
aefd2657-49a5-49c5-8baf-3f385b695e4c	6ed55704-cc61-4fc7-bc90-e120af91f49c	f
aefd2657-49a5-49c5-8baf-3f385b695e4c	0caa4f9b-eb3c-4b3e-b8cd-8648d8ac38fe	f
aefd2657-49a5-49c5-8baf-3f385b695e4c	c94fcaf7-3d58-4d78-ac28-5d057c755461	f
aefd2657-49a5-49c5-8baf-3f385b695e4c	da4bcdff-e364-496d-836f-3d96bf50a358	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
d949166d-5e11-4d80-b9ce-4f51050fa464	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"893344262"}	user_not_found	10.10.7.104	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996069052	LOGIN_ERROR	\N
5bf03628-7849-4af9-b2a8-abc419a73788	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"cwilson@example.net"}	user_not_found	10.10.7.104	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996069494	LOGIN_ERROR	\N
cc2776c5-019b-48b8-93b2-92168b5a469f	frontend	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://10.10.2.146:4200/","code_id":"8bf7811b-bdc7-4268-97b0-55078a865767","username":"efds"}	user_not_found	10.10.2.146	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996175400	LOGIN_ERROR	\N
b0c18c06-62c8-4cc9-b855-3c38c1fe3d26	frontend	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://10.10.2.146:4200/","code_id":"6336c676-76f0-48e6-a68a-dd00c753c435","username":"deepak@probeplus.in"}	user_not_found	10.10.7.104	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996177687	LOGIN_ERROR	\N
63571f02-f0d3-40d5-b7a2-351d3efb8dfe	frontend	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://10.10.2.146:4200/","code_id":"6336c676-76f0-48e6-a68a-dd00c753c435","username":"deepak@probeplus.in"}	user_not_found	10.10.7.104	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996184622	LOGIN_ERROR	\N
5366307e-970d-4ef7-9c3e-3273d4b1029e	frontend	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://10.10.2.146:4200/","code_id":"6336c676-76f0-48e6-a68a-dd00c753c435","username":"spa@probeplus.in"}	user_not_found	10.10.7.104	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996199502	LOGIN_ERROR	\N
5adebec9-ed3e-486f-a9fa-dabf80586362	frontend	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://10.10.2.146:4200/","code_id":"6336c676-76f0-48e6-a68a-dd00c753c435","username":"deepak@probeplus.in"}	user_not_found	10.10.7.104	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996209282	LOGIN_ERROR	\N
e0e29e6a-538d-42ee-bf44-bd0319273d6f	frontend	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://10.10.2.146:4200/","code_id":"8bf7811b-bdc7-4268-97b0-55078a865767","username":"deepak@probeplus.in"}	user_not_found	10.10.2.146	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996225802	LOGIN_ERROR	\N
c1b66eb5-4ab8-4833-8d00-1fc6d9b62207	frontend	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://10.10.2.146:4200/","code_id":"8bf7811b-bdc7-4268-97b0-55078a865767","username":"deepak@probeplus.in"}	user_not_found	10.10.2.146	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996234916	LOGIN_ERROR	\N
be6b0391-c683-4adc-850b-0cc8eaf8751c	frontend	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://10.10.2.146:4200/","code_id":"6336c676-76f0-48e6-a68a-dd00c753c435","username":"deepak@probeplus.in"}	user_not_found	10.10.7.104	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996242668	LOGIN_ERROR	\N
2b0132fb-1b45-41ec-81ca-77ba2f6bccbc	frontend	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://10.10.2.146:4200/","code_id":"6336c676-76f0-48e6-a68a-dd00c753c435","username":"deepak@probeplus.in"}	user_not_found	10.10.7.104	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996249801	LOGIN_ERROR	\N
1620b5fc-9a54-4538-acc7-185826f26a99	frontend	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://10.10.2.146:4200/","code_id":"6336c676-76f0-48e6-a68a-dd00c753c435","username":"deepak@probeplus.in"}	user_not_found	10.10.7.104	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996278715	LOGIN_ERROR	\N
b868a2d3-bcc1-4b7e-b77a-230795f65277	frontend	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://10.10.2.146:4200/","code_id":"6336c676-76f0-48e6-a68a-dd00c753c435","username":"spa@gmail.com"}	user_not_found	10.10.7.104	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996289813	LOGIN_ERROR	\N
b6546754-369a-4bb8-8c88-dbc736b27510	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"174814669"}	user_not_found	10.10.7.104	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996317914	LOGIN_ERROR	\N
5759457a-10a3-4f50-af98-6d5dbdbcc793	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"phillipmoore@example.org"}	user_not_found	10.10.7.104	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996318340	LOGIN_ERROR	\N
d04400d2-2ae3-455e-af3c-234ce0eb72ba	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"1002147447"}	user_not_found	10.10.7.104	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996366518	LOGIN_ERROR	\N
21931294-a342-4104-be78-20a06c2f0fac	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"villegassabrina@example.net"}	user_not_found	10.10.7.104	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996366947	LOGIN_ERROR	\N
118e14f8-e398-4949-ad0d-7cc75ffa339c	frontend	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://10.10.2.146:4200/#/summary","code_id":"1246c539-7d06-4e22-bdd8-5ffdf1de5445","username":"deepak@probeplus.in"}	invalid_user_credentials	10.10.7.104	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996457221	LOGIN_ERROR	7db2f70f-8790-46e0-9c1f-bd5376a1411b
7d811232-b36a-4166-a217-b6e647f5dc05	frontend	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://localhost:4200/#/service-provider-admin/clinical-facility-management","code_id":"1826058e-2d06-4b66-890d-4fd0c4857297","username":"spa@gmail.com"}	invalid_user_credentials	10.10.5.74	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1691996866910	LOGIN_ERROR	c55138b1-f10b-4bc5-8042-9da8e7e7f9fb
2a190737-8924-4685-8bcd-7f898a42adf5	\N	{"restart_after_timeout":"true"}	expired_code	10.10.5.74	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1692007063341	LOGIN_ERROR	\N
399548a6-35a8-4f73-83bb-0d88a48069e8	frontend	{"auth_method":"openid-connect","redirect_uri":"http://localhost:4200/#/service-provider-admin/clinical-facility-management","code_id":"75d5fc10-baeb-4476-891d-f1be7f962a49","username":"deepak@probeplus.in"}	invalid_user_credentials	10.10.5.74	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1692007073725	LOGIN_ERROR	7db2f70f-8790-46e0-9c1f-bd5376a1411b
8ef8aa21-4c9e-4694-ac22-c87538dd972f	frontend	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://localhost:4200/","code_id":"cdfc8f76-3c0c-4c41-8ae1-44621579e046","username":"deepak@probeplus.in"}	invalid_user_credentials	10.10.5.74	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1692078398690	LOGIN_ERROR	7db2f70f-8790-46e0-9c1f-bd5376a1411b
1735a7b3-8c3a-4f86-9721-1696f8b6a63e	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"deepak@probeplus.in"}	invalid_user_credentials	10.10.7.104	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1692078684039	LOGIN_ERROR	7db2f70f-8790-46e0-9c1f-bd5376a1411b
726e6fe3-54d2-4e00-83de-c205046bec70	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"604146120"}	user_not_found	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692158737130	LOGIN_ERROR	\N
f94b99db-9382-4c30-a08d-2a20105e92b8	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"amybaxter@example.com"}	user_not_found	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692158737507	LOGIN_ERROR	\N
4a8b6391-8529-47d4-8faa-75039482bb1e	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"ujones@example.org"}	user_disabled	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692158747167	LOGIN_ERROR	d7a71416-19e4-40e6-be8c-86795821d04f
0f2dd507-971b-4d7d-ab0a-07526ab2f564	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"5614024498"}	user_not_found	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692158761639	LOGIN_ERROR	\N
ecfeb853-03dd-459f-900a-9e8ed1b7a226	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"kgibson@example.org"}	user_not_found	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692158762786	LOGIN_ERROR	\N
3851294b-183f-4589-bbc8-6bc7122987dd	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"admin1@gmail.com"}	user_not_found	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692158870902	LOGIN_ERROR	\N
61e96715-6c9a-4b58-b2ac-eb97a57d4248	frontend	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://10.10.2.146:4200/","code_id":"e284a5f6-7a0e-4abf-95b7-e92075bc1e36","username":"deepak@probeplus.in"}	invalid_user_credentials	10.10.3.196	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1692185340795	LOGIN_ERROR	7db2f70f-8790-46e0-9c1f-bd5376a1411b
5ba86de8-c2c9-4c49-8d0c-8e12a2cf90f1	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"cfa@gmail.com"}	user_disabled	10.10.7.104	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1692186841538	LOGIN_ERROR	b7910098-86d5-426a-acfe-4660ef67b383
35236abe-38a1-4f0c-82f8-3d24b54a97fe	\N	{"restart_after_timeout":"true"}	expired_code	10.10.2.146	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1692189386902	LOGIN_ERROR	\N
aabf8b71-facf-4884-b461-09cd81e59395	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"1090707799"}	user_not_found	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692245280223	LOGIN_ERROR	\N
ac15cdc5-eb49-45d3-9a4e-917943fcd15b	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"ereed@example.org"}	user_not_found	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692245280626	LOGIN_ERROR	\N
1b3f0d4c-0e98-43f5-b305-b5a44b6a2306	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"xhodges@example.net"}	user_disabled	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692245290347	LOGIN_ERROR	50ee32b9-9455-41f2-9634-8b2b09261731
a6215691-cd10-4f14-817f-b28e6b47dcd2	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"8209891546"}	user_not_found	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692245304979	LOGIN_ERROR	\N
ddf9655f-4407-4aec-87ec-12fd9aa9c821	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"webbderrick@example.org"}	user_not_found	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692245306123	LOGIN_ERROR	\N
2dcf01ad-c36c-42fb-9a6f-f0e72b3162eb	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"admin1@gmail.com"}	user_not_found	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692245415700	LOGIN_ERROR	\N
ffacf8b1-5567-4dab-ad86-8bd6b3b283aa	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"1002513295"}	user_not_found	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692246309345	LOGIN_ERROR	\N
c69d9d2e-81d3-4ae0-bc17-096c3e33e8f9	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"milessean@example.net"}	user_not_found	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692246309756	LOGIN_ERROR	\N
6154698d-d13c-4b87-b837-a3de084d6edc	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"205878734"}	user_not_found	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692246770668	LOGIN_ERROR	\N
4289d514-ca2a-48a9-9ed1-fe9e9d73de66	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"williamsjoseph@example.com"}	user_not_found	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692246771135	LOGIN_ERROR	\N
32d3e3e7-9221-4aa8-a14f-2d071baa8424	frontend	{"grant_type":"authorization_code","code_id":"364493e8-6047-4d94-8a8a-e2b0ab52a185","client_auth_method":"client-secret"}	invalid_code	10.10.3.178	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	364493e8-6047-4d94-8a8a-e2b0ab52a185	1692247833501	CODE_TO_TOKEN_ERROR	\N
1ba9b3b8-3969-429c-b514-032c787bd139	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"493955794"}	user_not_found	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692247992365	LOGIN_ERROR	\N
b2d0f494-fee2-4f52-9525-e7d435503386	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"ericabell@example.net"}	user_not_found	10.10.7.104	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	1692247992762	LOGIN_ERROR	\N
e9bfb247-6263-4409-a306-bc63b7117076	frontend	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://localhost:4200/","code_id":"6a0c98b7-7f70-4a79-b51b-1d9fe19dd563","username":"deepak@probeplus.in"}	invalid_user_credentials	10.10.5.74	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1692253418841	LOGIN_ERROR	7db2f70f-8790-46e0-9c1f-bd5376a1411b
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
9d9f0655-9a67-4aa7-886d-ccbe5377b2c4	facility_1	 	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
a630d05f-8f0f-4315-a09f-908b56dbdd92	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f	${role_default-roles}	default-roles-master	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	\N	\N
564de5da-5177-48c1-9340-c274063a0693	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f	${role_create-realm}	create-realm	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	\N	\N
57902ec0-a1b8-466e-8041-05c34a44db0c	f9238327-e5d6-450e-a80e-55114996557e	t	${role_create-client}	create-client	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
70783a11-4132-4498-b3c7-4758f40158fe	f9238327-e5d6-450e-a80e-55114996557e	t	${role_view-realm}	view-realm	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
2df48a40-f73c-4edc-832e-e7946eb8d725	f9238327-e5d6-450e-a80e-55114996557e	t	${role_view-users}	view-users	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
9acfd6c9-bb97-4720-ac86-3fd0776506ea	f9238327-e5d6-450e-a80e-55114996557e	t	${role_view-clients}	view-clients	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
240f5622-36b8-42f9-8513-e5a7b4f3eae9	f9238327-e5d6-450e-a80e-55114996557e	t	${role_view-events}	view-events	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
f37ad641-9728-47f5-93ff-a68a141078e8	f9238327-e5d6-450e-a80e-55114996557e	t	${role_view-identity-providers}	view-identity-providers	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
8fb2f6f1-a17a-4a8a-8dcc-43c2348c071a	f9238327-e5d6-450e-a80e-55114996557e	t	${role_view-authorization}	view-authorization	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
df6ef29a-3478-4faa-8752-531741f14c06	f9238327-e5d6-450e-a80e-55114996557e	t	${role_manage-realm}	manage-realm	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
a6501d3e-f61e-48a5-9298-9d323a96bcf6	f9238327-e5d6-450e-a80e-55114996557e	t	${role_manage-users}	manage-users	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
5e7e4602-acd2-42f1-abb7-414cdbb0cba3	f9238327-e5d6-450e-a80e-55114996557e	t	${role_manage-clients}	manage-clients	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
d089cf95-ac70-46fd-86d5-a3300a153751	f9238327-e5d6-450e-a80e-55114996557e	t	${role_manage-events}	manage-events	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
ba5295ca-1c89-4dbd-9fa8-552cec65cf91	f9238327-e5d6-450e-a80e-55114996557e	t	${role_manage-identity-providers}	manage-identity-providers	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
a568f8b0-610c-433c-9d00-9b9306396a9c	f9238327-e5d6-450e-a80e-55114996557e	t	${role_manage-authorization}	manage-authorization	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
c68526ea-ae27-4dd3-b321-415d416db021	f9238327-e5d6-450e-a80e-55114996557e	t	${role_query-users}	query-users	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
10b7ec74-ca1f-49e0-838d-36df1591803e	f9238327-e5d6-450e-a80e-55114996557e	t	${role_query-clients}	query-clients	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
a7fab53d-14c8-4bf1-b13b-c92368537234	f9238327-e5d6-450e-a80e-55114996557e	t	${role_query-realms}	query-realms	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f	${role_admin}	admin	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	\N	\N
17b01e26-0942-4501-aef8-fd4da948a63c	f9238327-e5d6-450e-a80e-55114996557e	t	${role_query-groups}	query-groups	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
d72cef89-778f-4f19-8edd-4463497081ae	d87078a0-bab2-4e8e-a96c-84c69b9a8051	t	${role_view-profile}	view-profile	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	d87078a0-bab2-4e8e-a96c-84c69b9a8051	\N
adb04b60-793e-4160-adc2-c9749dd9e747	d87078a0-bab2-4e8e-a96c-84c69b9a8051	t	${role_manage-account}	manage-account	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	d87078a0-bab2-4e8e-a96c-84c69b9a8051	\N
98c273a9-1d5a-4b73-b26e-5def2d892ffb	d87078a0-bab2-4e8e-a96c-84c69b9a8051	t	${role_manage-account-links}	manage-account-links	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	d87078a0-bab2-4e8e-a96c-84c69b9a8051	\N
b8c0e2b5-4ad5-4516-a05d-8d866306b508	d87078a0-bab2-4e8e-a96c-84c69b9a8051	t	${role_view-applications}	view-applications	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	d87078a0-bab2-4e8e-a96c-84c69b9a8051	\N
deac41cc-0c5a-4570-a835-5321424fd952	d87078a0-bab2-4e8e-a96c-84c69b9a8051	t	${role_view-consent}	view-consent	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	d87078a0-bab2-4e8e-a96c-84c69b9a8051	\N
28593943-f291-4c62-8658-5ebb4c8024ff	d87078a0-bab2-4e8e-a96c-84c69b9a8051	t	${role_manage-consent}	manage-consent	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	d87078a0-bab2-4e8e-a96c-84c69b9a8051	\N
caa9af7c-8ff8-4e68-aba6-70e291803eb1	d87078a0-bab2-4e8e-a96c-84c69b9a8051	t	${role_view-groups}	view-groups	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	d87078a0-bab2-4e8e-a96c-84c69b9a8051	\N
c93cd1f3-1811-4c3d-8369-807625a787b4	d87078a0-bab2-4e8e-a96c-84c69b9a8051	t	${role_delete-account}	delete-account	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	d87078a0-bab2-4e8e-a96c-84c69b9a8051	\N
23f81dc8-3c24-49d1-972e-23a29577326e	fc566840-928b-47ab-8c69-9602c2d9d5a8	t	${role_read-token}	read-token	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	fc566840-928b-47ab-8c69-9602c2d9d5a8	\N
2892fac1-6091-4de8-8665-62ee959068ff	f9238327-e5d6-450e-a80e-55114996557e	t	${role_impersonation}	impersonation	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f9238327-e5d6-450e-a80e-55114996557e	\N
75f6c072-832d-43ef-83e6-b59f09febe70	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f	${role_offline-access}	offline_access	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	\N	\N
9682a378-9041-42c4-a653-8872db4d3f60	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f	${role_uma_authorization}	uma_authorization	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	\N	\N
65aa1435-eb72-4925-94ee-737c65c93089	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	f	${role_default-roles}	default-roles-ecgvue	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	\N
55cb1aec-8703-45c4-9825-6c2c61ad4a50	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_create-client}	create-client	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
abf3eb56-8fb7-4e4e-8e87-0714f953655c	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_view-realm}	view-realm	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
073d8f3b-fe2c-456a-8703-c68f6c468902	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_view-users}	view-users	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
8c08bf36-9abd-4b1d-9da7-300b424a3155	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_view-clients}	view-clients	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
777853a3-53cc-445f-8ac5-b1c8e17fc826	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_view-events}	view-events	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
8f1e85dc-186d-4939-b345-67879ca63a8f	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_view-identity-providers}	view-identity-providers	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
1b6f3ef4-e180-487e-8ff9-e223beac3143	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_view-authorization}	view-authorization	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
9f730877-6614-4819-b441-036ffdc3e7db	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_manage-realm}	manage-realm	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
aaa13251-8f0d-4943-a197-72b038b572de	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_manage-users}	manage-users	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
5338ae18-f027-4ec8-be88-456cca1f95f0	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_manage-clients}	manage-clients	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
ab66d46b-555c-4b25-9f01-0b73f56499d6	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_manage-events}	manage-events	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
bd44d109-908d-43ea-9b72-244f2ea39649	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_manage-identity-providers}	manage-identity-providers	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
e419e201-505e-425c-8306-4d597af43df7	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_manage-authorization}	manage-authorization	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
b5e59694-37f0-4211-945c-f2d07e55d54e	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_query-users}	query-users	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
b679f682-fbcd-446b-a2d8-1e44a14ce9b2	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_query-clients}	query-clients	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
cebff73d-43f3-4808-a269-487a99405f45	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_query-realms}	query-realms	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
49cf21a1-b0c6-4f07-8a7a-7e72e3cbfe8b	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_query-groups}	query-groups	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
41864266-7c38-4cb7-8a53-acdd63a3105d	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	f	${role_uma_authorization}	uma_authorization	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	\N
745167cf-3a7e-4302-9027-f7ec388b2fa2	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	f	${role_offline-access}	offline_access	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	\N
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_realm-admin}	realm-admin	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
235b7ba1-c0f3-414a-b2b6-6ba04f7e5f43	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_view-users}	view-users	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
1a3a4805-03f4-4a19-826c-e419e7d0e49b	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_view-events}	view-events	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
ea7f6cab-0b72-46cb-b805-580f886c7baa	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_view-realm}	view-realm	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
7b0e47f1-3687-4641-bfdc-c47728abf91e	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_view-clients}	view-clients	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
971c8a63-50f4-42fd-96fe-bff483996025	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_query-clients}	query-clients	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
5006cccc-ecf9-433c-80de-be06e6cbb81e	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_view-authorization}	view-authorization	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
2c4f22e3-d3dc-47e2-b8f0-fcde5236d0a8	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_query-groups}	query-groups	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
75dedb29-1dbd-4cdc-bba1-0bc0eb805b6a	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_manage-clients}	manage-clients	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
be87eb49-aa0c-490e-b78d-fd684d51f0c5	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_manage-authorization}	manage-authorization	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
449612b0-012c-4869-a65c-8f78ea22895f	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_manage-users}	manage-users	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
91b2d6d7-6b0c-4142-9c26-b2b45e0690ca	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_manage-identity-providers}	manage-identity-providers	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
43a70a76-90b5-4320-a274-126ffc80a1b6	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_manage-events}	manage-events	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
ea7d2f1c-cf6d-428f-91d4-4e63910186fa	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_query-users}	query-users	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
c90bf2ad-3447-4444-b3ba-21d3563688f6	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_manage-realm}	manage-realm	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
221c9293-f38b-458d-8400-db169a5b9d22	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_view-identity-providers}	view-identity-providers	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
6a1f4950-14c8-465e-ae14-361160c61345	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_create-client}	create-client	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
bbe55091-5055-47c2-835a-2123fc5ccd7d	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_query-realms}	query-realms	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
8cee6636-9527-4d12-895d-bf21e11ec843	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_impersonation}	impersonation	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
7d3614f0-de3f-405f-9524-8df3537c5335	0d4e2343-70bb-483a-ac8a-8c0ee9375046	t	${role_read-token}	read-token	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	0d4e2343-70bb-483a-ac8a-8c0ee9375046	\N
c6c53ef4-a3d9-43f8-ad86-0c61e2ab9fca	ce842fe5-3812-4965-bd2a-223b37637c1d	t	${role_delete-account}	delete-account	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ce842fe5-3812-4965-bd2a-223b37637c1d	\N
0af23ec5-9c11-489f-bdb7-d2fdeef78d1d	ce842fe5-3812-4965-bd2a-223b37637c1d	t	${role_manage-account-links}	manage-account-links	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ce842fe5-3812-4965-bd2a-223b37637c1d	\N
064dab66-9585-4f6c-8da5-c3ed93dcefa3	ce842fe5-3812-4965-bd2a-223b37637c1d	t	${role_view-groups}	view-groups	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ce842fe5-3812-4965-bd2a-223b37637c1d	\N
e789998b-0b9a-4f3f-9cba-5ce693d54b6b	ce842fe5-3812-4965-bd2a-223b37637c1d	t	${role_manage-account}	manage-account	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ce842fe5-3812-4965-bd2a-223b37637c1d	\N
56bfe62c-bdb0-42f6-8351-4e38f6370a6e	ce842fe5-3812-4965-bd2a-223b37637c1d	t	${role_view-profile}	view-profile	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ce842fe5-3812-4965-bd2a-223b37637c1d	\N
4e8f9d9f-d399-45ea-8113-71310cf26061	ce842fe5-3812-4965-bd2a-223b37637c1d	t	${role_view-applications}	view-applications	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ce842fe5-3812-4965-bd2a-223b37637c1d	\N
eaa471ce-d6c2-4f77-8f95-55438bb50722	ce842fe5-3812-4965-bd2a-223b37637c1d	t	${role_manage-consent}	manage-consent	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ce842fe5-3812-4965-bd2a-223b37637c1d	\N
ca95fa5d-e131-4d23-adab-ca29ab55ad47	ce842fe5-3812-4965-bd2a-223b37637c1d	t	${role_view-consent}	view-consent	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ce842fe5-3812-4965-bd2a-223b37637c1d	\N
8fa6b10c-3fc4-47d9-beb8-64360f01bc41	22e245e6-fcc1-4130-98c8-5c6784d62b12	t	${role_impersonation}	impersonation	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	22e245e6-fcc1-4130-98c8-5c6784d62b12	\N
c14142ef-e8ed-4cab-b05f-dfe0b79a10d6	aefd2657-49a5-49c5-8baf-3f385b695e4c	f	${role_default-roles}	default-roles-ecgvue_test	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	\N
aed2e846-2cb1-4c30-b7d9-7d63048bc322	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_create-client}	create-client	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
b459fe70-743f-4fe2-b9d5-6d1ee7b4b825	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_view-realm}	view-realm	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
1e4809f6-8326-4029-849f-065b6cbe6b09	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_view-users}	view-users	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
d9ddf0d7-1ac8-4834-8cfc-381bf7f468ef	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_view-clients}	view-clients	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
beaf38c1-e820-4f83-8eed-eeb1a607f9a8	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_view-events}	view-events	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
8a17f193-190e-4b7b-80f6-bdd686b244f4	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_view-identity-providers}	view-identity-providers	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
67197180-8ad8-43f6-8c8c-622982cc9aa6	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_view-authorization}	view-authorization	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
595574fd-93f7-49ac-989f-c79ff49cbd98	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_manage-realm}	manage-realm	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
478c5117-1e0b-4c87-9fc6-070767964046	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_manage-users}	manage-users	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
0cffcabb-0440-47d0-8e9e-2f7544ebc33f	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_manage-clients}	manage-clients	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
061af8a7-9bed-4fe8-afa6-bac04653faf5	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_manage-events}	manage-events	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
ca6dc41a-a6ec-4c41-ab6b-950bf681c711	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_manage-identity-providers}	manage-identity-providers	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
0ac59f32-04c1-43a3-883c-a4bf393a332f	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_manage-authorization}	manage-authorization	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
63003fd9-8db8-4a0c-8c2e-279951ea0224	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_query-users}	query-users	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
ff452031-aea2-4d24-9eb7-0129684b6dd8	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_query-clients}	query-clients	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
569f7a2b-7602-40ba-b13a-b1ee1141931f	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_query-realms}	query-realms	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
01745345-bde6-4563-bed0-454ee5a98a4f	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_query-groups}	query-groups	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
98575750-78cc-4a33-85ae-f3688af59051	aefd2657-49a5-49c5-8baf-3f385b695e4c	f	${role_default-roles}	default-roles-ecgvue	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	\N
521ce7d8-a397-4c51-b6db-c0e4b9978894	aefd2657-49a5-49c5-8baf-3f385b695e4c	f	${role_uma_authorization}	uma_authorization	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	\N
74c1337c-f6dd-47b8-bb7c-c5894aadf46e	aefd2657-49a5-49c5-8baf-3f385b695e4c	f	${role_offline-access}	offline_access	aefd2657-49a5-49c5-8baf-3f385b695e4c	\N	\N
4a02475d-1ae5-47ea-b83b-5fbafc13ace6	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_manage-realm}	manage-realm	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
e47d854c-12bf-42d7-b7ac-3a09def24036	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_query-groups}	query-groups	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
c709960d-4255-4db8-8348-98de6038789c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_manage-users}	manage-users	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
81224b77-7e5f-4ce9-9581-d861e9cd0ebd	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_view-identity-providers}	view-identity-providers	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
842b2522-848f-4cec-b223-7a3cd3503b49	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_manage-clients}	manage-clients	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
020f3aa3-1eb3-4700-9b05-898c78f23fbf	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_query-realms}	query-realms	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
3d82b5ba-65b3-47b5-a8ef-f2f99f78ee5b	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_view-authorization}	view-authorization	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
77bb1e7a-aa48-4e1c-a4c6-9eb7d2ddccff	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_manage-authorization}	manage-authorization	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
ff7fe238-ae1f-4f31-8d90-aaa259e147f7	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_view-users}	view-users	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
45680771-5407-4510-a5eb-8d08e7922847	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_realm-admin}	realm-admin	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
89ae04e8-5830-401a-ad8f-ed9a561c9b06	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_manage-events}	manage-events	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
42ecc68d-0fe0-43b8-9f3b-20d1e8a7b44c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_view-realm}	view-realm	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
0c3d8bd8-047d-460a-9280-b50b641ba02a	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_view-clients}	view-clients	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
99eb8e46-70eb-44c7-8578-02cd22ffa09b	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_view-events}	view-events	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
6133bf7e-4935-4fc3-89bf-7bab9a5babe2	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_manage-identity-providers}	manage-identity-providers	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
3b2f46cb-5f15-46b4-9f3f-a290714dad8c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_query-clients}	query-clients	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
bb2f0e61-7e0b-444e-a09b-c6756fa496ce	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_create-client}	create-client	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
7535da06-2c06-4986-975f-ffd93d0390c2	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_query-users}	query-users	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
c11cc104-7d90-438d-9a55-2a02b6d59718	a4ba32ea-5b38-431c-98db-866a0a08c0ab	t	${role_impersonation}	impersonation	aefd2657-49a5-49c5-8baf-3f385b695e4c	a4ba32ea-5b38-431c-98db-866a0a08c0ab	\N
32f19477-0e04-437c-b359-b1f3c9a45fa8	8aa37b02-7d8b-473d-9974-63ff0c861839	t	${role_read-token}	read-token	aefd2657-49a5-49c5-8baf-3f385b695e4c	8aa37b02-7d8b-473d-9974-63ff0c861839	\N
eb054eb2-f7ba-45c6-834b-ada129a417da	6f2a4af0-383a-4299-80f8-660c62766a88	t	${role_view-profile}	view-profile	aefd2657-49a5-49c5-8baf-3f385b695e4c	6f2a4af0-383a-4299-80f8-660c62766a88	\N
67264468-09c3-41ea-add0-8d68f5c3b10b	6f2a4af0-383a-4299-80f8-660c62766a88	t	${role_delete-account}	delete-account	aefd2657-49a5-49c5-8baf-3f385b695e4c	6f2a4af0-383a-4299-80f8-660c62766a88	\N
e26b5b1b-06f2-476c-ab7a-0a382c6c708e	6f2a4af0-383a-4299-80f8-660c62766a88	t	${role_manage-account-links}	manage-account-links	aefd2657-49a5-49c5-8baf-3f385b695e4c	6f2a4af0-383a-4299-80f8-660c62766a88	\N
83a95184-bd87-4dce-9ffb-27ae17e8d88a	6f2a4af0-383a-4299-80f8-660c62766a88	t	${role_view-consent}	view-consent	aefd2657-49a5-49c5-8baf-3f385b695e4c	6f2a4af0-383a-4299-80f8-660c62766a88	\N
93b0d98c-4824-4e9f-82e7-50545a06287d	6f2a4af0-383a-4299-80f8-660c62766a88	t	${role_manage-account}	manage-account	aefd2657-49a5-49c5-8baf-3f385b695e4c	6f2a4af0-383a-4299-80f8-660c62766a88	\N
09f14aa1-3f02-4df8-a8ee-5b9878faadcb	6f2a4af0-383a-4299-80f8-660c62766a88	t	${role_manage-consent}	manage-consent	aefd2657-49a5-49c5-8baf-3f385b695e4c	6f2a4af0-383a-4299-80f8-660c62766a88	\N
e52ab80b-ad35-42d0-91c5-22aefffc9d94	6f2a4af0-383a-4299-80f8-660c62766a88	t	${role_view-applications}	view-applications	aefd2657-49a5-49c5-8baf-3f385b695e4c	6f2a4af0-383a-4299-80f8-660c62766a88	\N
95a6221a-ab2a-43ac-96d5-b5009dbf2cf0	6f2a4af0-383a-4299-80f8-660c62766a88	t	${role_view-groups}	view-groups	aefd2657-49a5-49c5-8baf-3f385b695e4c	6f2a4af0-383a-4299-80f8-660c62766a88	\N
5dc5b625-f9e9-4286-a1b1-b84333cb0b17	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	t	${role_impersonation}	impersonation	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
nz0lk	21.1.1	1691995763
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
e3f0e3ae-584a-4c9e-991b-d0fc4c535520	audience resolve	openid-connect	oidc-audience-resolve-mapper	b05bd7c0-e999-4234-b313-c5a40ec524b3	\N
2fa44902-1001-4f71-b5f0-f323404a2c44	locale	openid-connect	oidc-usermodel-attribute-mapper	8f81c007-8bed-4f25-9009-2bbcb098c5f3	\N
cb8cb4ba-9c72-4dc1-8f9e-0217d0fb6670	role list	saml	saml-role-list-mapper	\N	1ecefd7a-2a0e-4579-81c4-5bc3a640f368
b35b519b-12a7-4755-a5d4-a75b39a15cfd	full name	openid-connect	oidc-full-name-mapper	\N	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8
577b715c-7065-454b-bb87-e3cadb7b3709	family name	openid-connect	oidc-usermodel-property-mapper	\N	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8
bf6c9f34-055f-4ff0-9ebe-52ea998cfbd6	given name	openid-connect	oidc-usermodel-property-mapper	\N	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8
98ae4762-a0ae-4650-9edd-690ac7c9fe10	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8
b749166f-5fb6-4d25-bcc6-52ac6a6f3dd7	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8
feb5641a-4171-4776-9382-1df11a1c3cbd	username	openid-connect	oidc-usermodel-property-mapper	\N	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8
97e0f332-4f94-4440-823f-3c59006a5c71	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8
4c8ab416-7e08-4ddb-8f03-e136fcfa7623	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8
06dd6564-2330-491a-9593-ce9d9f083f87	website	openid-connect	oidc-usermodel-attribute-mapper	\N	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8
9e09a546-d12d-40fc-be97-419a8724286a	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8
161dde25-8914-42ab-b597-d51d81f446f4	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8
ab4fa215-e4de-469c-a4e3-ef8c5007c244	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8
9f28ada5-94ac-4683-bea3-6bbe788936c5	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8
43d2925f-b3dc-4980-8ca9-9e169faac6a2	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	c2c33b18-fe39-40de-b60e-9d9f19b0b0b8
68f502fd-a63f-4d0c-bf3c-e77797b4f441	email	openid-connect	oidc-usermodel-property-mapper	\N	8a81d9c7-7986-4697-afe3-9d48c0d1bd16
0cd260a4-4721-4e38-b78d-f493ca68227e	email verified	openid-connect	oidc-usermodel-property-mapper	\N	8a81d9c7-7986-4697-afe3-9d48c0d1bd16
bb6090b1-cf91-47ac-bdd1-c8b71bbfedd7	address	openid-connect	oidc-address-mapper	\N	83399c51-a0b9-4694-bd12-12ddf2a6de8f
cff5255a-026c-42ba-8ed7-8e63295587fe	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	7dfd8353-53e6-4152-9ce6-63a9327e2297
85c9ef2a-d967-4a7f-bdd8-4c7cec7fbeb4	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	7dfd8353-53e6-4152-9ce6-63a9327e2297
e28d84e0-7213-4b42-b6a7-4ccce13d7b07	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	009e1b2c-8ad3-4e27-9e38-c2cec9a86ba5
eb69836a-5a35-43cd-82d0-214728994265	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	009e1b2c-8ad3-4e27-9e38-c2cec9a86ba5
aa290ebc-ef3e-4941-8bd4-0da88541424e	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	009e1b2c-8ad3-4e27-9e38-c2cec9a86ba5
6495db44-ba74-402d-8d4c-0eceddb0e8eb	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	c6d0de5a-674f-4e90-a7b3-6052971e8c18
52278465-d2b8-443f-9f8c-61e3572d880d	upn	openid-connect	oidc-usermodel-property-mapper	\N	83628b9f-695c-4609-a797-23b2b0fd1416
fe6fd503-964a-40cc-bc93-252eb6f802fc	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	83628b9f-695c-4609-a797-23b2b0fd1416
bff14e1b-cc39-447b-9d64-522b92864150	acr loa level	openid-connect	oidc-acr-mapper	\N	0c5859a4-d620-49bb-96e5-44afdebd31f4
4e3c42f7-eeb2-4710-af90-5c8825d9e1f6	email	openid-connect	oidc-usermodel-property-mapper	\N	111caa50-b290-43a8-b04a-cce3c73dbefa
b452e76d-f041-4cc8-b6ff-5b752393ec53	email verified	openid-connect	oidc-usermodel-property-mapper	\N	111caa50-b290-43a8-b04a-cce3c73dbefa
40e69245-8ec5-4402-85ca-1511d67f29ff	role list	saml	saml-role-list-mapper	\N	1c24bfe0-68ec-457a-8fb9-8f6fccde0ba5
0b51f3f1-a8f6-42cc-90e4-7e3f75626ce2	acr loa level	openid-connect	oidc-acr-mapper	\N	0a18b98d-38e5-44d2-9332-1065b0c342dc
02db03ed-efc3-4a92-bae2-4a1ddd7e2212	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	474bd65f-db29-470c-a9c3-3ad8f8615a6f
e138e485-be95-4a28-b166-413b5de03a1c	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	d33b511f-1df4-4f3a-b4fd-8e7e0403f908
ae8adfc8-358e-4eeb-b6cc-8888913b8755	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	d33b511f-1df4-4f3a-b4fd-8e7e0403f908
3569f404-6572-43fe-9fe5-bbe3f62ebb4d	full name	openid-connect	oidc-full-name-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
926a53c9-43fc-4a7a-884f-3160d5d4f368	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
a74258ab-8023-46a9-b1d0-9cf7ecbd57fd	family name	openid-connect	oidc-usermodel-property-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
8c612bbc-cf22-4e8d-99ea-9bfcb1d0091b	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
6bc1ff18-ef37-47c8-ab1b-a7d6b758f48e	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
fdee5501-b021-4268-a7e7-830bae79ef53	given name	openid-connect	oidc-usermodel-property-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
86d53e21-f9c7-46d5-9a0a-219ce59d5072	website	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
5a8550e9-c699-4180-9f07-c267fd4aab69	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
5010a54d-ff82-4a6b-a588-ad12d13171cb	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
6d6061fa-88be-43cd-a449-b5447008909b	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
9fe2d0db-4e74-48a4-9cb6-852320a00836	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
9152dbc2-e5d8-4e46-acfc-2e64e83aec8f	username	openid-connect	oidc-usermodel-property-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
ef8b868c-87e3-4f5d-b54b-e6adbb6977e2	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
26f67423-c0fa-47cf-9f61-e4fc7128d3e1	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
454e36c1-6ea3-4384-85cc-7e9e51a49970	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	29945782-f537-4661-beb2-eb77c9d23669
3a6db17e-83bb-4839-8c6b-a5f2462b8126	upn	openid-connect	oidc-usermodel-property-mapper	\N	29945782-f537-4661-beb2-eb77c9d23669
a61e9f92-bc4b-483b-8388-9d9738f5c357	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	d5d707c6-4d4f-4bc9-8a5b-4e089040061d
f46e20e9-ba95-40fe-ba91-991fa87510b5	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	d5d707c6-4d4f-4bc9-8a5b-4e089040061d
ae73882b-8672-4af6-90c9-e1574a07506e	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	d5d707c6-4d4f-4bc9-8a5b-4e089040061d
a2f74ac3-1732-48e3-9af9-a15c91628312	address	openid-connect	oidc-address-mapper	\N	a86d5100-8b35-49e9-94c3-3952256a2ffc
647ea11e-691b-41ae-981d-7dc3803a20c1	audience resolve	openid-connect	oidc-audience-resolve-mapper	335fc954-d318-439c-a800-ec6890e7befc	\N
c1ea2141-97bd-44dd-852c-be3e038187a8	locale	openid-connect	oidc-usermodel-attribute-mapper	098636cc-5794-485f-ba91-8128deafe934	\N
4fe4e367-d4d8-415e-abfb-762c03da3ce9	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	dedf63b3-4d87-4515-b7d4-8ee882db4bd1	\N
acea8205-61e9-42bf-a260-30c47eb7fd68	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	dedf63b3-4d87-4515-b7d4-8ee882db4bd1	\N
8f0d9947-ae53-4509-82ec-4e45b1980ab7	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	dedf63b3-4d87-4515-b7d4-8ee882db4bd1	\N
943db1b6-6b7f-4371-9000-fa92662b4277	email verified	openid-connect	oidc-usermodel-property-mapper	\N	9f3a037d-e705-4b11-92fd-39cb4cead1ca
d0ee33d1-a083-4e48-9469-15babe46b12b	email	openid-connect	oidc-usermodel-property-mapper	\N	9f3a037d-e705-4b11-92fd-39cb4cead1ca
cc16a949-a229-4277-a65f-f790fcd9b1e8	acr loa level	openid-connect	oidc-acr-mapper	\N	2c79b6f4-e825-4bd6-ad09-a690bbce720f
7fad167c-21ea-42e3-9fc2-6be718e8e803	upn	openid-connect	oidc-usermodel-property-mapper	\N	da4bcdff-e364-496d-836f-3d96bf50a358
ec92615a-2ab3-44e3-8989-dcf3ce2072ee	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	da4bcdff-e364-496d-836f-3d96bf50a358
dee01409-8f02-497d-8a2f-db19f199b7cf	address	openid-connect	oidc-address-mapper	\N	0caa4f9b-eb3c-4b3e-b8cd-8648d8ac38fe
909ffbe4-68f7-49b5-8660-842bce167474	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	8c191ac3-be5b-46ba-8d12-de837c0633be
94ed0475-da8c-4b50-abb7-5357d9633be1	role list	saml	saml-role-list-mapper	\N	24f77fc1-6495-4de2-9be1-d514f0dd13e0
102ebb84-9aaf-4ea4-9b6e-76c2a708a1e7	website	openid-connect	oidc-usermodel-attribute-mapper	\N	8a58d093-cf7a-4ece-9bd1-b8fa6769102f
284aaed2-5960-4a80-948f-0df7414cc90c	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	8a58d093-cf7a-4ece-9bd1-b8fa6769102f
3873a867-e45f-48e5-b53e-1e0880dcdf30	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	8a58d093-cf7a-4ece-9bd1-b8fa6769102f
59a6c5be-c73e-4b06-8c0f-0a462c9fe3b3	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	8a58d093-cf7a-4ece-9bd1-b8fa6769102f
a54a4095-fb14-473b-a662-f04eab75da76	username	openid-connect	oidc-usermodel-property-mapper	\N	8a58d093-cf7a-4ece-9bd1-b8fa6769102f
c8638138-bbac-4111-9732-0d0542848244	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	8a58d093-cf7a-4ece-9bd1-b8fa6769102f
8ad1cd8c-6ea4-4bb0-89c7-43d1fa42d09d	full name	openid-connect	oidc-full-name-mapper	\N	8a58d093-cf7a-4ece-9bd1-b8fa6769102f
0fa08848-056b-4541-9177-410be82426ee	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	8a58d093-cf7a-4ece-9bd1-b8fa6769102f
d7966be5-a145-4efa-9bb5-421b2f01bbe1	family name	openid-connect	oidc-usermodel-property-mapper	\N	8a58d093-cf7a-4ece-9bd1-b8fa6769102f
a9273394-23ac-4676-a227-8aca300c1f06	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	8a58d093-cf7a-4ece-9bd1-b8fa6769102f
c17bfb4d-5d86-4ecd-84f0-f4c79f249583	ROLES	openid-connect	oidc-usermodel-attribute-mapper	e03a9c44-332a-48cd-8777-d544fd7d3feb	\N
290fdc33-32a0-4deb-ae45-afb5fb9c3d70	SPID	openid-connect	oidc-usermodel-attribute-mapper	e03a9c44-332a-48cd-8777-d544fd7d3feb	\N
ccccb2ca-695e-4496-8719-0935a274de19	SP_ROLE	openid-connect	oidc-usermodel-attribute-mapper	e03a9c44-332a-48cd-8777-d544fd7d3feb	\N
e1b3025a-ac58-4e6c-baef-6547bd4dd63b	SA ROLE	openid-connect	oidc-usermodel-attribute-mapper	e03a9c44-332a-48cd-8777-d544fd7d3feb	\N
3c2f0844-0526-4a3e-9d7d-e60233dbec88	CFID	openid-connect	oidc-usermodel-attribute-mapper	e03a9c44-332a-48cd-8777-d544fd7d3feb	\N
0b9c1cf8-4ea2-4d20-b583-286021f99870	User ID	openid-connect	oidc-usermodel-attribute-mapper	e03a9c44-332a-48cd-8777-d544fd7d3feb	\N
6cc92c54-2f5f-4afc-a0cb-d3a5c984e327	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	c94fcaf7-3d58-4d78-ac28-5d057c755461
9af628f3-49fd-4919-9194-a4c32007b979	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	c94fcaf7-3d58-4d78-ac28-5d057c755461
b83f4d0b-ff30-49fd-92a9-bacb41405880	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	8a58d093-cf7a-4ece-9bd1-b8fa6769102f
16e781e8-802f-4aad-8375-cb8da3813727	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	8a58d093-cf7a-4ece-9bd1-b8fa6769102f
ea74ffe8-a97b-4b77-a550-63a525b6756c	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	8a58d093-cf7a-4ece-9bd1-b8fa6769102f
288db54e-25b0-4882-932e-613a7b094d32	given name	openid-connect	oidc-usermodel-property-mapper	\N	8a58d093-cf7a-4ece-9bd1-b8fa6769102f
81adb246-7b3b-4f3c-b12a-e309c3de12d1	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	0e9a644a-e2f6-4604-8067-c2c063711b39
30cfc75b-6d85-4c46-bb02-bb4491d84a85	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	0e9a644a-e2f6-4604-8067-c2c063711b39
070faed3-958f-4fde-be81-3b3aa79078fd	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	0e9a644a-e2f6-4604-8067-c2c063711b39
643dcb6f-271f-4003-add9-500b7de8b09d	audience resolve	openid-connect	oidc-audience-resolve-mapper	4a4ae264-0e11-45ac-b63c-0cbc3615b0cd	\N
d1928a4e-bd5f-47cf-ae3d-d90fd8878f04	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	896090fe-19fb-4c95-906e-e8ad3063bb35	\N
91abae6f-e7e1-4059-93f4-de52a84bc251	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	896090fe-19fb-4c95-906e-e8ad3063bb35	\N
4f3323b0-d3f3-44bf-ba89-1acb8c2ad8ff	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	896090fe-19fb-4c95-906e-e8ad3063bb35	\N
45cd2358-e298-4a17-b711-c615844211be	Roles	openid-connect	oidc-usermodel-attribute-mapper	1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	\N
f192adb6-2d4a-4194-b6c9-8c0620fd93eb	SPID	openid-connect	oidc-usermodel-attribute-mapper	1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	\N
91b31945-d5fd-4ad3-a748-5f2003b5194d	SA_ROLE	openid-connect	oidc-usermodel-attribute-mapper	1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	\N
96d41323-0cd1-4aa1-8888-d971646a58c7	CFID	openid-connect	oidc-usermodel-attribute-mapper	1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	\N
050ae687-0a0d-41a0-9aba-28c75bfb671c	SP_ROLE	openid-connect	oidc-usermodel-attribute-mapper	1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	\N
4e22ee2b-1c9f-46b9-b2e6-23402ac59719	User id 	openid-connect	oidc-usermodel-attribute-mapper	1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	\N
8982d4be-91e1-4261-8b3f-6d91251add4b	locale	openid-connect	oidc-usermodel-attribute-mapper	5a232f16-784b-45d3-8184-f5293fbea17e	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
2fa44902-1001-4f71-b5f0-f323404a2c44	true	userinfo.token.claim
2fa44902-1001-4f71-b5f0-f323404a2c44	locale	user.attribute
2fa44902-1001-4f71-b5f0-f323404a2c44	true	id.token.claim
2fa44902-1001-4f71-b5f0-f323404a2c44	true	access.token.claim
2fa44902-1001-4f71-b5f0-f323404a2c44	locale	claim.name
2fa44902-1001-4f71-b5f0-f323404a2c44	String	jsonType.label
cb8cb4ba-9c72-4dc1-8f9e-0217d0fb6670	false	single
cb8cb4ba-9c72-4dc1-8f9e-0217d0fb6670	Basic	attribute.nameformat
cb8cb4ba-9c72-4dc1-8f9e-0217d0fb6670	Role	attribute.name
06dd6564-2330-491a-9593-ce9d9f083f87	true	userinfo.token.claim
06dd6564-2330-491a-9593-ce9d9f083f87	website	user.attribute
06dd6564-2330-491a-9593-ce9d9f083f87	true	id.token.claim
06dd6564-2330-491a-9593-ce9d9f083f87	true	access.token.claim
06dd6564-2330-491a-9593-ce9d9f083f87	website	claim.name
06dd6564-2330-491a-9593-ce9d9f083f87	String	jsonType.label
161dde25-8914-42ab-b597-d51d81f446f4	true	userinfo.token.claim
161dde25-8914-42ab-b597-d51d81f446f4	birthdate	user.attribute
161dde25-8914-42ab-b597-d51d81f446f4	true	id.token.claim
161dde25-8914-42ab-b597-d51d81f446f4	true	access.token.claim
161dde25-8914-42ab-b597-d51d81f446f4	birthdate	claim.name
161dde25-8914-42ab-b597-d51d81f446f4	String	jsonType.label
43d2925f-b3dc-4980-8ca9-9e169faac6a2	true	userinfo.token.claim
43d2925f-b3dc-4980-8ca9-9e169faac6a2	updatedAt	user.attribute
43d2925f-b3dc-4980-8ca9-9e169faac6a2	true	id.token.claim
43d2925f-b3dc-4980-8ca9-9e169faac6a2	true	access.token.claim
43d2925f-b3dc-4980-8ca9-9e169faac6a2	updated_at	claim.name
43d2925f-b3dc-4980-8ca9-9e169faac6a2	long	jsonType.label
4c8ab416-7e08-4ddb-8f03-e136fcfa7623	true	userinfo.token.claim
4c8ab416-7e08-4ddb-8f03-e136fcfa7623	picture	user.attribute
4c8ab416-7e08-4ddb-8f03-e136fcfa7623	true	id.token.claim
4c8ab416-7e08-4ddb-8f03-e136fcfa7623	true	access.token.claim
4c8ab416-7e08-4ddb-8f03-e136fcfa7623	picture	claim.name
4c8ab416-7e08-4ddb-8f03-e136fcfa7623	String	jsonType.label
577b715c-7065-454b-bb87-e3cadb7b3709	true	userinfo.token.claim
577b715c-7065-454b-bb87-e3cadb7b3709	lastName	user.attribute
577b715c-7065-454b-bb87-e3cadb7b3709	true	id.token.claim
577b715c-7065-454b-bb87-e3cadb7b3709	true	access.token.claim
577b715c-7065-454b-bb87-e3cadb7b3709	family_name	claim.name
577b715c-7065-454b-bb87-e3cadb7b3709	String	jsonType.label
97e0f332-4f94-4440-823f-3c59006a5c71	true	userinfo.token.claim
97e0f332-4f94-4440-823f-3c59006a5c71	profile	user.attribute
97e0f332-4f94-4440-823f-3c59006a5c71	true	id.token.claim
97e0f332-4f94-4440-823f-3c59006a5c71	true	access.token.claim
97e0f332-4f94-4440-823f-3c59006a5c71	profile	claim.name
97e0f332-4f94-4440-823f-3c59006a5c71	String	jsonType.label
98ae4762-a0ae-4650-9edd-690ac7c9fe10	true	userinfo.token.claim
98ae4762-a0ae-4650-9edd-690ac7c9fe10	middleName	user.attribute
98ae4762-a0ae-4650-9edd-690ac7c9fe10	true	id.token.claim
98ae4762-a0ae-4650-9edd-690ac7c9fe10	true	access.token.claim
98ae4762-a0ae-4650-9edd-690ac7c9fe10	middle_name	claim.name
98ae4762-a0ae-4650-9edd-690ac7c9fe10	String	jsonType.label
9e09a546-d12d-40fc-be97-419a8724286a	true	userinfo.token.claim
9e09a546-d12d-40fc-be97-419a8724286a	gender	user.attribute
9e09a546-d12d-40fc-be97-419a8724286a	true	id.token.claim
9e09a546-d12d-40fc-be97-419a8724286a	true	access.token.claim
9e09a546-d12d-40fc-be97-419a8724286a	gender	claim.name
9e09a546-d12d-40fc-be97-419a8724286a	String	jsonType.label
9f28ada5-94ac-4683-bea3-6bbe788936c5	true	userinfo.token.claim
9f28ada5-94ac-4683-bea3-6bbe788936c5	locale	user.attribute
9f28ada5-94ac-4683-bea3-6bbe788936c5	true	id.token.claim
9f28ada5-94ac-4683-bea3-6bbe788936c5	true	access.token.claim
9f28ada5-94ac-4683-bea3-6bbe788936c5	locale	claim.name
9f28ada5-94ac-4683-bea3-6bbe788936c5	String	jsonType.label
ab4fa215-e4de-469c-a4e3-ef8c5007c244	true	userinfo.token.claim
ab4fa215-e4de-469c-a4e3-ef8c5007c244	zoneinfo	user.attribute
ab4fa215-e4de-469c-a4e3-ef8c5007c244	true	id.token.claim
ab4fa215-e4de-469c-a4e3-ef8c5007c244	true	access.token.claim
ab4fa215-e4de-469c-a4e3-ef8c5007c244	zoneinfo	claim.name
ab4fa215-e4de-469c-a4e3-ef8c5007c244	String	jsonType.label
b35b519b-12a7-4755-a5d4-a75b39a15cfd	true	userinfo.token.claim
b35b519b-12a7-4755-a5d4-a75b39a15cfd	true	id.token.claim
b35b519b-12a7-4755-a5d4-a75b39a15cfd	true	access.token.claim
b749166f-5fb6-4d25-bcc6-52ac6a6f3dd7	true	userinfo.token.claim
b749166f-5fb6-4d25-bcc6-52ac6a6f3dd7	nickname	user.attribute
b749166f-5fb6-4d25-bcc6-52ac6a6f3dd7	true	id.token.claim
b749166f-5fb6-4d25-bcc6-52ac6a6f3dd7	true	access.token.claim
b749166f-5fb6-4d25-bcc6-52ac6a6f3dd7	nickname	claim.name
b749166f-5fb6-4d25-bcc6-52ac6a6f3dd7	String	jsonType.label
bf6c9f34-055f-4ff0-9ebe-52ea998cfbd6	true	userinfo.token.claim
bf6c9f34-055f-4ff0-9ebe-52ea998cfbd6	firstName	user.attribute
bf6c9f34-055f-4ff0-9ebe-52ea998cfbd6	true	id.token.claim
bf6c9f34-055f-4ff0-9ebe-52ea998cfbd6	true	access.token.claim
bf6c9f34-055f-4ff0-9ebe-52ea998cfbd6	given_name	claim.name
bf6c9f34-055f-4ff0-9ebe-52ea998cfbd6	String	jsonType.label
feb5641a-4171-4776-9382-1df11a1c3cbd	true	userinfo.token.claim
feb5641a-4171-4776-9382-1df11a1c3cbd	username	user.attribute
feb5641a-4171-4776-9382-1df11a1c3cbd	true	id.token.claim
feb5641a-4171-4776-9382-1df11a1c3cbd	true	access.token.claim
feb5641a-4171-4776-9382-1df11a1c3cbd	preferred_username	claim.name
feb5641a-4171-4776-9382-1df11a1c3cbd	String	jsonType.label
0cd260a4-4721-4e38-b78d-f493ca68227e	true	userinfo.token.claim
0cd260a4-4721-4e38-b78d-f493ca68227e	emailVerified	user.attribute
0cd260a4-4721-4e38-b78d-f493ca68227e	true	id.token.claim
0cd260a4-4721-4e38-b78d-f493ca68227e	true	access.token.claim
0cd260a4-4721-4e38-b78d-f493ca68227e	email_verified	claim.name
0cd260a4-4721-4e38-b78d-f493ca68227e	boolean	jsonType.label
68f502fd-a63f-4d0c-bf3c-e77797b4f441	true	userinfo.token.claim
68f502fd-a63f-4d0c-bf3c-e77797b4f441	email	user.attribute
68f502fd-a63f-4d0c-bf3c-e77797b4f441	true	id.token.claim
68f502fd-a63f-4d0c-bf3c-e77797b4f441	true	access.token.claim
68f502fd-a63f-4d0c-bf3c-e77797b4f441	email	claim.name
68f502fd-a63f-4d0c-bf3c-e77797b4f441	String	jsonType.label
bb6090b1-cf91-47ac-bdd1-c8b71bbfedd7	formatted	user.attribute.formatted
bb6090b1-cf91-47ac-bdd1-c8b71bbfedd7	country	user.attribute.country
bb6090b1-cf91-47ac-bdd1-c8b71bbfedd7	postal_code	user.attribute.postal_code
bb6090b1-cf91-47ac-bdd1-c8b71bbfedd7	true	userinfo.token.claim
bb6090b1-cf91-47ac-bdd1-c8b71bbfedd7	street	user.attribute.street
bb6090b1-cf91-47ac-bdd1-c8b71bbfedd7	true	id.token.claim
bb6090b1-cf91-47ac-bdd1-c8b71bbfedd7	region	user.attribute.region
bb6090b1-cf91-47ac-bdd1-c8b71bbfedd7	true	access.token.claim
bb6090b1-cf91-47ac-bdd1-c8b71bbfedd7	locality	user.attribute.locality
85c9ef2a-d967-4a7f-bdd8-4c7cec7fbeb4	true	userinfo.token.claim
85c9ef2a-d967-4a7f-bdd8-4c7cec7fbeb4	phoneNumberVerified	user.attribute
85c9ef2a-d967-4a7f-bdd8-4c7cec7fbeb4	true	id.token.claim
85c9ef2a-d967-4a7f-bdd8-4c7cec7fbeb4	true	access.token.claim
85c9ef2a-d967-4a7f-bdd8-4c7cec7fbeb4	phone_number_verified	claim.name
85c9ef2a-d967-4a7f-bdd8-4c7cec7fbeb4	boolean	jsonType.label
cff5255a-026c-42ba-8ed7-8e63295587fe	true	userinfo.token.claim
cff5255a-026c-42ba-8ed7-8e63295587fe	phoneNumber	user.attribute
cff5255a-026c-42ba-8ed7-8e63295587fe	true	id.token.claim
cff5255a-026c-42ba-8ed7-8e63295587fe	true	access.token.claim
cff5255a-026c-42ba-8ed7-8e63295587fe	phone_number	claim.name
cff5255a-026c-42ba-8ed7-8e63295587fe	String	jsonType.label
e28d84e0-7213-4b42-b6a7-4ccce13d7b07	true	multivalued
e28d84e0-7213-4b42-b6a7-4ccce13d7b07	foo	user.attribute
e28d84e0-7213-4b42-b6a7-4ccce13d7b07	true	access.token.claim
e28d84e0-7213-4b42-b6a7-4ccce13d7b07	realm_access.roles	claim.name
e28d84e0-7213-4b42-b6a7-4ccce13d7b07	String	jsonType.label
eb69836a-5a35-43cd-82d0-214728994265	true	multivalued
eb69836a-5a35-43cd-82d0-214728994265	foo	user.attribute
eb69836a-5a35-43cd-82d0-214728994265	true	access.token.claim
eb69836a-5a35-43cd-82d0-214728994265	resource_access.${client_id}.roles	claim.name
eb69836a-5a35-43cd-82d0-214728994265	String	jsonType.label
52278465-d2b8-443f-9f8c-61e3572d880d	true	userinfo.token.claim
52278465-d2b8-443f-9f8c-61e3572d880d	username	user.attribute
52278465-d2b8-443f-9f8c-61e3572d880d	true	id.token.claim
52278465-d2b8-443f-9f8c-61e3572d880d	true	access.token.claim
52278465-d2b8-443f-9f8c-61e3572d880d	upn	claim.name
52278465-d2b8-443f-9f8c-61e3572d880d	String	jsonType.label
fe6fd503-964a-40cc-bc93-252eb6f802fc	true	multivalued
fe6fd503-964a-40cc-bc93-252eb6f802fc	foo	user.attribute
fe6fd503-964a-40cc-bc93-252eb6f802fc	true	id.token.claim
fe6fd503-964a-40cc-bc93-252eb6f802fc	true	access.token.claim
fe6fd503-964a-40cc-bc93-252eb6f802fc	groups	claim.name
fe6fd503-964a-40cc-bc93-252eb6f802fc	String	jsonType.label
bff14e1b-cc39-447b-9d64-522b92864150	true	id.token.claim
bff14e1b-cc39-447b-9d64-522b92864150	true	access.token.claim
4e3c42f7-eeb2-4710-af90-5c8825d9e1f6	true	userinfo.token.claim
4e3c42f7-eeb2-4710-af90-5c8825d9e1f6	email	user.attribute
4e3c42f7-eeb2-4710-af90-5c8825d9e1f6	true	id.token.claim
4e3c42f7-eeb2-4710-af90-5c8825d9e1f6	true	access.token.claim
4e3c42f7-eeb2-4710-af90-5c8825d9e1f6	email	claim.name
4e3c42f7-eeb2-4710-af90-5c8825d9e1f6	String	jsonType.label
b452e76d-f041-4cc8-b6ff-5b752393ec53	true	userinfo.token.claim
b452e76d-f041-4cc8-b6ff-5b752393ec53	emailVerified	user.attribute
b452e76d-f041-4cc8-b6ff-5b752393ec53	true	id.token.claim
b452e76d-f041-4cc8-b6ff-5b752393ec53	true	access.token.claim
b452e76d-f041-4cc8-b6ff-5b752393ec53	email_verified	claim.name
b452e76d-f041-4cc8-b6ff-5b752393ec53	boolean	jsonType.label
40e69245-8ec5-4402-85ca-1511d67f29ff	false	single
40e69245-8ec5-4402-85ca-1511d67f29ff	Basic	attribute.nameformat
40e69245-8ec5-4402-85ca-1511d67f29ff	Role	attribute.name
0b51f3f1-a8f6-42cc-90e4-7e3f75626ce2	true	id.token.claim
0b51f3f1-a8f6-42cc-90e4-7e3f75626ce2	true	access.token.claim
0b51f3f1-a8f6-42cc-90e4-7e3f75626ce2	true	userinfo.token.claim
ae8adfc8-358e-4eeb-b6cc-8888913b8755	true	userinfo.token.claim
ae8adfc8-358e-4eeb-b6cc-8888913b8755	phoneNumber	user.attribute
ae8adfc8-358e-4eeb-b6cc-8888913b8755	true	id.token.claim
ae8adfc8-358e-4eeb-b6cc-8888913b8755	true	access.token.claim
ae8adfc8-358e-4eeb-b6cc-8888913b8755	phone_number	claim.name
ae8adfc8-358e-4eeb-b6cc-8888913b8755	String	jsonType.label
e138e485-be95-4a28-b166-413b5de03a1c	true	userinfo.token.claim
e138e485-be95-4a28-b166-413b5de03a1c	phoneNumberVerified	user.attribute
e138e485-be95-4a28-b166-413b5de03a1c	true	id.token.claim
e138e485-be95-4a28-b166-413b5de03a1c	true	access.token.claim
e138e485-be95-4a28-b166-413b5de03a1c	phone_number_verified	claim.name
e138e485-be95-4a28-b166-413b5de03a1c	boolean	jsonType.label
26f67423-c0fa-47cf-9f61-e4fc7128d3e1	true	userinfo.token.claim
26f67423-c0fa-47cf-9f61-e4fc7128d3e1	gender	user.attribute
26f67423-c0fa-47cf-9f61-e4fc7128d3e1	true	id.token.claim
26f67423-c0fa-47cf-9f61-e4fc7128d3e1	true	access.token.claim
26f67423-c0fa-47cf-9f61-e4fc7128d3e1	gender	claim.name
26f67423-c0fa-47cf-9f61-e4fc7128d3e1	String	jsonType.label
3569f404-6572-43fe-9fe5-bbe3f62ebb4d	true	id.token.claim
3569f404-6572-43fe-9fe5-bbe3f62ebb4d	true	access.token.claim
3569f404-6572-43fe-9fe5-bbe3f62ebb4d	true	userinfo.token.claim
5010a54d-ff82-4a6b-a588-ad12d13171cb	true	userinfo.token.claim
5010a54d-ff82-4a6b-a588-ad12d13171cb	birthdate	user.attribute
5010a54d-ff82-4a6b-a588-ad12d13171cb	true	id.token.claim
5010a54d-ff82-4a6b-a588-ad12d13171cb	true	access.token.claim
5010a54d-ff82-4a6b-a588-ad12d13171cb	birthdate	claim.name
5010a54d-ff82-4a6b-a588-ad12d13171cb	String	jsonType.label
5a8550e9-c699-4180-9f07-c267fd4aab69	true	userinfo.token.claim
5a8550e9-c699-4180-9f07-c267fd4aab69	profile	user.attribute
5a8550e9-c699-4180-9f07-c267fd4aab69	true	id.token.claim
5a8550e9-c699-4180-9f07-c267fd4aab69	true	access.token.claim
5a8550e9-c699-4180-9f07-c267fd4aab69	profile	claim.name
5a8550e9-c699-4180-9f07-c267fd4aab69	String	jsonType.label
6bc1ff18-ef37-47c8-ab1b-a7d6b758f48e	true	userinfo.token.claim
6bc1ff18-ef37-47c8-ab1b-a7d6b758f48e	nickname	user.attribute
6bc1ff18-ef37-47c8-ab1b-a7d6b758f48e	true	id.token.claim
6bc1ff18-ef37-47c8-ab1b-a7d6b758f48e	true	access.token.claim
6bc1ff18-ef37-47c8-ab1b-a7d6b758f48e	nickname	claim.name
6bc1ff18-ef37-47c8-ab1b-a7d6b758f48e	String	jsonType.label
6d6061fa-88be-43cd-a449-b5447008909b	true	userinfo.token.claim
6d6061fa-88be-43cd-a449-b5447008909b	middleName	user.attribute
6d6061fa-88be-43cd-a449-b5447008909b	true	id.token.claim
6d6061fa-88be-43cd-a449-b5447008909b	true	access.token.claim
6d6061fa-88be-43cd-a449-b5447008909b	middle_name	claim.name
6d6061fa-88be-43cd-a449-b5447008909b	String	jsonType.label
86d53e21-f9c7-46d5-9a0a-219ce59d5072	true	userinfo.token.claim
86d53e21-f9c7-46d5-9a0a-219ce59d5072	website	user.attribute
86d53e21-f9c7-46d5-9a0a-219ce59d5072	true	id.token.claim
86d53e21-f9c7-46d5-9a0a-219ce59d5072	true	access.token.claim
86d53e21-f9c7-46d5-9a0a-219ce59d5072	website	claim.name
86d53e21-f9c7-46d5-9a0a-219ce59d5072	String	jsonType.label
8c612bbc-cf22-4e8d-99ea-9bfcb1d0091b	true	userinfo.token.claim
8c612bbc-cf22-4e8d-99ea-9bfcb1d0091b	locale	user.attribute
8c612bbc-cf22-4e8d-99ea-9bfcb1d0091b	true	id.token.claim
8c612bbc-cf22-4e8d-99ea-9bfcb1d0091b	true	access.token.claim
8c612bbc-cf22-4e8d-99ea-9bfcb1d0091b	locale	claim.name
8c612bbc-cf22-4e8d-99ea-9bfcb1d0091b	String	jsonType.label
9152dbc2-e5d8-4e46-acfc-2e64e83aec8f	true	userinfo.token.claim
9152dbc2-e5d8-4e46-acfc-2e64e83aec8f	username	user.attribute
9152dbc2-e5d8-4e46-acfc-2e64e83aec8f	true	id.token.claim
9152dbc2-e5d8-4e46-acfc-2e64e83aec8f	true	access.token.claim
9152dbc2-e5d8-4e46-acfc-2e64e83aec8f	preferred_username	claim.name
9152dbc2-e5d8-4e46-acfc-2e64e83aec8f	String	jsonType.label
926a53c9-43fc-4a7a-884f-3160d5d4f368	true	userinfo.token.claim
926a53c9-43fc-4a7a-884f-3160d5d4f368	updatedAt	user.attribute
926a53c9-43fc-4a7a-884f-3160d5d4f368	true	id.token.claim
926a53c9-43fc-4a7a-884f-3160d5d4f368	true	access.token.claim
926a53c9-43fc-4a7a-884f-3160d5d4f368	updated_at	claim.name
926a53c9-43fc-4a7a-884f-3160d5d4f368	long	jsonType.label
9fe2d0db-4e74-48a4-9cb6-852320a00836	true	userinfo.token.claim
9fe2d0db-4e74-48a4-9cb6-852320a00836	zoneinfo	user.attribute
9fe2d0db-4e74-48a4-9cb6-852320a00836	true	id.token.claim
9fe2d0db-4e74-48a4-9cb6-852320a00836	true	access.token.claim
9fe2d0db-4e74-48a4-9cb6-852320a00836	zoneinfo	claim.name
9fe2d0db-4e74-48a4-9cb6-852320a00836	String	jsonType.label
a74258ab-8023-46a9-b1d0-9cf7ecbd57fd	true	userinfo.token.claim
a74258ab-8023-46a9-b1d0-9cf7ecbd57fd	lastName	user.attribute
a74258ab-8023-46a9-b1d0-9cf7ecbd57fd	true	id.token.claim
a74258ab-8023-46a9-b1d0-9cf7ecbd57fd	true	access.token.claim
a74258ab-8023-46a9-b1d0-9cf7ecbd57fd	family_name	claim.name
a74258ab-8023-46a9-b1d0-9cf7ecbd57fd	String	jsonType.label
ef8b868c-87e3-4f5d-b54b-e6adbb6977e2	true	userinfo.token.claim
ef8b868c-87e3-4f5d-b54b-e6adbb6977e2	picture	user.attribute
ef8b868c-87e3-4f5d-b54b-e6adbb6977e2	true	id.token.claim
ef8b868c-87e3-4f5d-b54b-e6adbb6977e2	true	access.token.claim
ef8b868c-87e3-4f5d-b54b-e6adbb6977e2	picture	claim.name
ef8b868c-87e3-4f5d-b54b-e6adbb6977e2	String	jsonType.label
fdee5501-b021-4268-a7e7-830bae79ef53	true	userinfo.token.claim
fdee5501-b021-4268-a7e7-830bae79ef53	firstName	user.attribute
fdee5501-b021-4268-a7e7-830bae79ef53	true	id.token.claim
fdee5501-b021-4268-a7e7-830bae79ef53	true	access.token.claim
fdee5501-b021-4268-a7e7-830bae79ef53	given_name	claim.name
fdee5501-b021-4268-a7e7-830bae79ef53	String	jsonType.label
3a6db17e-83bb-4839-8c6b-a5f2462b8126	true	userinfo.token.claim
3a6db17e-83bb-4839-8c6b-a5f2462b8126	username	user.attribute
3a6db17e-83bb-4839-8c6b-a5f2462b8126	true	id.token.claim
3a6db17e-83bb-4839-8c6b-a5f2462b8126	true	access.token.claim
3a6db17e-83bb-4839-8c6b-a5f2462b8126	upn	claim.name
3a6db17e-83bb-4839-8c6b-a5f2462b8126	String	jsonType.label
454e36c1-6ea3-4384-85cc-7e9e51a49970	true	multivalued
454e36c1-6ea3-4384-85cc-7e9e51a49970	true	userinfo.token.claim
454e36c1-6ea3-4384-85cc-7e9e51a49970	foo	user.attribute
454e36c1-6ea3-4384-85cc-7e9e51a49970	true	id.token.claim
454e36c1-6ea3-4384-85cc-7e9e51a49970	true	access.token.claim
454e36c1-6ea3-4384-85cc-7e9e51a49970	groups	claim.name
454e36c1-6ea3-4384-85cc-7e9e51a49970	String	jsonType.label
a61e9f92-bc4b-483b-8388-9d9738f5c357	foo	user.attribute
a61e9f92-bc4b-483b-8388-9d9738f5c357	true	access.token.claim
a61e9f92-bc4b-483b-8388-9d9738f5c357	resource_access.${client_id}.roles	claim.name
a61e9f92-bc4b-483b-8388-9d9738f5c357	String	jsonType.label
a61e9f92-bc4b-483b-8388-9d9738f5c357	true	multivalued
ae73882b-8672-4af6-90c9-e1574a07506e	foo	user.attribute
ae73882b-8672-4af6-90c9-e1574a07506e	true	access.token.claim
ae73882b-8672-4af6-90c9-e1574a07506e	realm_access.roles	claim.name
ae73882b-8672-4af6-90c9-e1574a07506e	String	jsonType.label
ae73882b-8672-4af6-90c9-e1574a07506e	true	multivalued
a2f74ac3-1732-48e3-9af9-a15c91628312	formatted	user.attribute.formatted
a2f74ac3-1732-48e3-9af9-a15c91628312	country	user.attribute.country
a2f74ac3-1732-48e3-9af9-a15c91628312	postal_code	user.attribute.postal_code
a2f74ac3-1732-48e3-9af9-a15c91628312	true	userinfo.token.claim
a2f74ac3-1732-48e3-9af9-a15c91628312	street	user.attribute.street
a2f74ac3-1732-48e3-9af9-a15c91628312	true	id.token.claim
a2f74ac3-1732-48e3-9af9-a15c91628312	region	user.attribute.region
a2f74ac3-1732-48e3-9af9-a15c91628312	true	access.token.claim
a2f74ac3-1732-48e3-9af9-a15c91628312	locality	user.attribute.locality
4fe4e367-d4d8-415e-abfb-762c03da3ce9	clientHost	user.session.note
4fe4e367-d4d8-415e-abfb-762c03da3ce9	true	userinfo.token.claim
4fe4e367-d4d8-415e-abfb-762c03da3ce9	true	id.token.claim
4fe4e367-d4d8-415e-abfb-762c03da3ce9	true	access.token.claim
4fe4e367-d4d8-415e-abfb-762c03da3ce9	clientHost	claim.name
4fe4e367-d4d8-415e-abfb-762c03da3ce9	String	jsonType.label
8f0d9947-ae53-4509-82ec-4e45b1980ab7	clientAddress	user.session.note
8f0d9947-ae53-4509-82ec-4e45b1980ab7	true	userinfo.token.claim
8f0d9947-ae53-4509-82ec-4e45b1980ab7	true	id.token.claim
8f0d9947-ae53-4509-82ec-4e45b1980ab7	true	access.token.claim
8f0d9947-ae53-4509-82ec-4e45b1980ab7	clientAddress	claim.name
8f0d9947-ae53-4509-82ec-4e45b1980ab7	String	jsonType.label
acea8205-61e9-42bf-a260-30c47eb7fd68	client_id	user.session.note
acea8205-61e9-42bf-a260-30c47eb7fd68	true	userinfo.token.claim
acea8205-61e9-42bf-a260-30c47eb7fd68	true	id.token.claim
acea8205-61e9-42bf-a260-30c47eb7fd68	true	access.token.claim
acea8205-61e9-42bf-a260-30c47eb7fd68	client_id	claim.name
acea8205-61e9-42bf-a260-30c47eb7fd68	String	jsonType.label
0b9c1cf8-4ea2-4d20-b583-286021f99870	false	aggregate.attrs
0b9c1cf8-4ea2-4d20-b583-286021f99870	false	userinfo.token.claim
0b9c1cf8-4ea2-4d20-b583-286021f99870	false	multivalued
0b9c1cf8-4ea2-4d20-b583-286021f99870	user_id	user.attribute
0b9c1cf8-4ea2-4d20-b583-286021f99870	false	id.token.claim
0b9c1cf8-4ea2-4d20-b583-286021f99870	true	access.token.claim
0b9c1cf8-4ea2-4d20-b583-286021f99870	user_id	claim.name
290fdc33-32a0-4deb-ae45-afb5fb9c3d70	false	aggregate.attrs
290fdc33-32a0-4deb-ae45-afb5fb9c3d70	false	multivalued
290fdc33-32a0-4deb-ae45-afb5fb9c3d70	false	userinfo.token.claim
290fdc33-32a0-4deb-ae45-afb5fb9c3d70	service_provider_id	user.attribute
290fdc33-32a0-4deb-ae45-afb5fb9c3d70	false	id.token.claim
290fdc33-32a0-4deb-ae45-afb5fb9c3d70	true	access.token.claim
290fdc33-32a0-4deb-ae45-afb5fb9c3d70	service_provider_id	claim.name
3c2f0844-0526-4a3e-9d7d-e60233dbec88	false	aggregate.attrs
3c2f0844-0526-4a3e-9d7d-e60233dbec88	false	userinfo.token.claim
3c2f0844-0526-4a3e-9d7d-e60233dbec88	false	multivalued
3c2f0844-0526-4a3e-9d7d-e60233dbec88	cfid	user.attribute
3c2f0844-0526-4a3e-9d7d-e60233dbec88	false	id.token.claim
3c2f0844-0526-4a3e-9d7d-e60233dbec88	true	access.token.claim
3c2f0844-0526-4a3e-9d7d-e60233dbec88	cfid	claim.name
c17bfb4d-5d86-4ecd-84f0-f4c79f249583	false	aggregate.attrs
c17bfb4d-5d86-4ecd-84f0-f4c79f249583	false	userinfo.token.claim
c17bfb4d-5d86-4ecd-84f0-f4c79f249583	false	multivalued
c17bfb4d-5d86-4ecd-84f0-f4c79f249583	roles	user.attribute
c17bfb4d-5d86-4ecd-84f0-f4c79f249583	false	id.token.claim
c17bfb4d-5d86-4ecd-84f0-f4c79f249583	true	access.token.claim
c17bfb4d-5d86-4ecd-84f0-f4c79f249583	roles	claim.name
ccccb2ca-695e-4496-8719-0935a274de19	false	aggregate.attrs
ccccb2ca-695e-4496-8719-0935a274de19	false	multivalued
ccccb2ca-695e-4496-8719-0935a274de19	false	userinfo.token.claim
ccccb2ca-695e-4496-8719-0935a274de19	sp_role	user.attribute
ccccb2ca-695e-4496-8719-0935a274de19	false	id.token.claim
ccccb2ca-695e-4496-8719-0935a274de19	true	access.token.claim
ccccb2ca-695e-4496-8719-0935a274de19	sp_role	claim.name
e1b3025a-ac58-4e6c-baef-6547bd4dd63b	false	aggregate.attrs
e1b3025a-ac58-4e6c-baef-6547bd4dd63b	false	multivalued
e1b3025a-ac58-4e6c-baef-6547bd4dd63b	false	userinfo.token.claim
e1b3025a-ac58-4e6c-baef-6547bd4dd63b	sa_role	user.attribute
e1b3025a-ac58-4e6c-baef-6547bd4dd63b	false	id.token.claim
e1b3025a-ac58-4e6c-baef-6547bd4dd63b	true	access.token.claim
e1b3025a-ac58-4e6c-baef-6547bd4dd63b	sa_role	claim.name
c1ea2141-97bd-44dd-852c-be3e038187a8	true	userinfo.token.claim
c1ea2141-97bd-44dd-852c-be3e038187a8	locale	user.attribute
c1ea2141-97bd-44dd-852c-be3e038187a8	true	id.token.claim
c1ea2141-97bd-44dd-852c-be3e038187a8	true	access.token.claim
c1ea2141-97bd-44dd-852c-be3e038187a8	locale	claim.name
c1ea2141-97bd-44dd-852c-be3e038187a8	String	jsonType.label
6cc92c54-2f5f-4afc-a0cb-d3a5c984e327	true	userinfo.token.claim
6cc92c54-2f5f-4afc-a0cb-d3a5c984e327	phoneNumberVerified	user.attribute
6cc92c54-2f5f-4afc-a0cb-d3a5c984e327	true	id.token.claim
6cc92c54-2f5f-4afc-a0cb-d3a5c984e327	true	access.token.claim
6cc92c54-2f5f-4afc-a0cb-d3a5c984e327	phone_number_verified	claim.name
6cc92c54-2f5f-4afc-a0cb-d3a5c984e327	boolean	jsonType.label
9af628f3-49fd-4919-9194-a4c32007b979	true	userinfo.token.claim
9af628f3-49fd-4919-9194-a4c32007b979	phoneNumber	user.attribute
9af628f3-49fd-4919-9194-a4c32007b979	true	id.token.claim
9af628f3-49fd-4919-9194-a4c32007b979	true	access.token.claim
9af628f3-49fd-4919-9194-a4c32007b979	phone_number	claim.name
9af628f3-49fd-4919-9194-a4c32007b979	String	jsonType.label
943db1b6-6b7f-4371-9000-fa92662b4277	true	userinfo.token.claim
943db1b6-6b7f-4371-9000-fa92662b4277	emailVerified	user.attribute
943db1b6-6b7f-4371-9000-fa92662b4277	true	id.token.claim
943db1b6-6b7f-4371-9000-fa92662b4277	true	access.token.claim
943db1b6-6b7f-4371-9000-fa92662b4277	email_verified	claim.name
943db1b6-6b7f-4371-9000-fa92662b4277	boolean	jsonType.label
d0ee33d1-a083-4e48-9469-15babe46b12b	true	userinfo.token.claim
d0ee33d1-a083-4e48-9469-15babe46b12b	email	user.attribute
d0ee33d1-a083-4e48-9469-15babe46b12b	true	id.token.claim
d0ee33d1-a083-4e48-9469-15babe46b12b	true	access.token.claim
d0ee33d1-a083-4e48-9469-15babe46b12b	email	claim.name
d0ee33d1-a083-4e48-9469-15babe46b12b	String	jsonType.label
cc16a949-a229-4277-a65f-f790fcd9b1e8	true	id.token.claim
cc16a949-a229-4277-a65f-f790fcd9b1e8	true	access.token.claim
cc16a949-a229-4277-a65f-f790fcd9b1e8	true	userinfo.token.claim
7fad167c-21ea-42e3-9fc2-6be718e8e803	true	userinfo.token.claim
7fad167c-21ea-42e3-9fc2-6be718e8e803	username	user.attribute
7fad167c-21ea-42e3-9fc2-6be718e8e803	true	id.token.claim
7fad167c-21ea-42e3-9fc2-6be718e8e803	true	access.token.claim
7fad167c-21ea-42e3-9fc2-6be718e8e803	upn	claim.name
7fad167c-21ea-42e3-9fc2-6be718e8e803	String	jsonType.label
ec92615a-2ab3-44e3-8989-dcf3ce2072ee	true	multivalued
ec92615a-2ab3-44e3-8989-dcf3ce2072ee	true	userinfo.token.claim
ec92615a-2ab3-44e3-8989-dcf3ce2072ee	foo	user.attribute
ec92615a-2ab3-44e3-8989-dcf3ce2072ee	true	id.token.claim
ec92615a-2ab3-44e3-8989-dcf3ce2072ee	true	access.token.claim
ec92615a-2ab3-44e3-8989-dcf3ce2072ee	groups	claim.name
ec92615a-2ab3-44e3-8989-dcf3ce2072ee	String	jsonType.label
dee01409-8f02-497d-8a2f-db19f199b7cf	formatted	user.attribute.formatted
dee01409-8f02-497d-8a2f-db19f199b7cf	country	user.attribute.country
dee01409-8f02-497d-8a2f-db19f199b7cf	postal_code	user.attribute.postal_code
dee01409-8f02-497d-8a2f-db19f199b7cf	true	userinfo.token.claim
dee01409-8f02-497d-8a2f-db19f199b7cf	street	user.attribute.street
dee01409-8f02-497d-8a2f-db19f199b7cf	true	id.token.claim
dee01409-8f02-497d-8a2f-db19f199b7cf	region	user.attribute.region
dee01409-8f02-497d-8a2f-db19f199b7cf	true	access.token.claim
dee01409-8f02-497d-8a2f-db19f199b7cf	locality	user.attribute.locality
94ed0475-da8c-4b50-abb7-5357d9633be1	false	single
94ed0475-da8c-4b50-abb7-5357d9633be1	Basic	attribute.nameformat
94ed0475-da8c-4b50-abb7-5357d9633be1	Role	attribute.name
0fa08848-056b-4541-9177-410be82426ee	true	userinfo.token.claim
0fa08848-056b-4541-9177-410be82426ee	nickname	user.attribute
0fa08848-056b-4541-9177-410be82426ee	true	id.token.claim
0fa08848-056b-4541-9177-410be82426ee	true	access.token.claim
0fa08848-056b-4541-9177-410be82426ee	nickname	claim.name
0fa08848-056b-4541-9177-410be82426ee	String	jsonType.label
102ebb84-9aaf-4ea4-9b6e-76c2a708a1e7	true	userinfo.token.claim
102ebb84-9aaf-4ea4-9b6e-76c2a708a1e7	website	user.attribute
102ebb84-9aaf-4ea4-9b6e-76c2a708a1e7	true	id.token.claim
102ebb84-9aaf-4ea4-9b6e-76c2a708a1e7	true	access.token.claim
102ebb84-9aaf-4ea4-9b6e-76c2a708a1e7	website	claim.name
102ebb84-9aaf-4ea4-9b6e-76c2a708a1e7	String	jsonType.label
16e781e8-802f-4aad-8375-cb8da3813727	true	userinfo.token.claim
16e781e8-802f-4aad-8375-cb8da3813727	updatedAt	user.attribute
16e781e8-802f-4aad-8375-cb8da3813727	true	id.token.claim
16e781e8-802f-4aad-8375-cb8da3813727	true	access.token.claim
16e781e8-802f-4aad-8375-cb8da3813727	updated_at	claim.name
16e781e8-802f-4aad-8375-cb8da3813727	long	jsonType.label
284aaed2-5960-4a80-948f-0df7414cc90c	true	userinfo.token.claim
284aaed2-5960-4a80-948f-0df7414cc90c	gender	user.attribute
284aaed2-5960-4a80-948f-0df7414cc90c	true	id.token.claim
284aaed2-5960-4a80-948f-0df7414cc90c	true	access.token.claim
284aaed2-5960-4a80-948f-0df7414cc90c	gender	claim.name
284aaed2-5960-4a80-948f-0df7414cc90c	String	jsonType.label
288db54e-25b0-4882-932e-613a7b094d32	true	userinfo.token.claim
288db54e-25b0-4882-932e-613a7b094d32	firstName	user.attribute
288db54e-25b0-4882-932e-613a7b094d32	true	id.token.claim
288db54e-25b0-4882-932e-613a7b094d32	true	access.token.claim
288db54e-25b0-4882-932e-613a7b094d32	given_name	claim.name
288db54e-25b0-4882-932e-613a7b094d32	String	jsonType.label
3873a867-e45f-48e5-b53e-1e0880dcdf30	true	userinfo.token.claim
3873a867-e45f-48e5-b53e-1e0880dcdf30	zoneinfo	user.attribute
3873a867-e45f-48e5-b53e-1e0880dcdf30	true	id.token.claim
3873a867-e45f-48e5-b53e-1e0880dcdf30	true	access.token.claim
3873a867-e45f-48e5-b53e-1e0880dcdf30	zoneinfo	claim.name
3873a867-e45f-48e5-b53e-1e0880dcdf30	String	jsonType.label
59a6c5be-c73e-4b06-8c0f-0a462c9fe3b3	true	userinfo.token.claim
59a6c5be-c73e-4b06-8c0f-0a462c9fe3b3	picture	user.attribute
59a6c5be-c73e-4b06-8c0f-0a462c9fe3b3	true	id.token.claim
59a6c5be-c73e-4b06-8c0f-0a462c9fe3b3	true	access.token.claim
59a6c5be-c73e-4b06-8c0f-0a462c9fe3b3	picture	claim.name
59a6c5be-c73e-4b06-8c0f-0a462c9fe3b3	String	jsonType.label
8ad1cd8c-6ea4-4bb0-89c7-43d1fa42d09d	true	id.token.claim
8ad1cd8c-6ea4-4bb0-89c7-43d1fa42d09d	true	access.token.claim
8ad1cd8c-6ea4-4bb0-89c7-43d1fa42d09d	true	userinfo.token.claim
a54a4095-fb14-473b-a662-f04eab75da76	true	userinfo.token.claim
a54a4095-fb14-473b-a662-f04eab75da76	username	user.attribute
a54a4095-fb14-473b-a662-f04eab75da76	true	id.token.claim
a54a4095-fb14-473b-a662-f04eab75da76	true	access.token.claim
a54a4095-fb14-473b-a662-f04eab75da76	preferred_username	claim.name
a54a4095-fb14-473b-a662-f04eab75da76	String	jsonType.label
a9273394-23ac-4676-a227-8aca300c1f06	true	userinfo.token.claim
a9273394-23ac-4676-a227-8aca300c1f06	locale	user.attribute
a9273394-23ac-4676-a227-8aca300c1f06	true	id.token.claim
a9273394-23ac-4676-a227-8aca300c1f06	true	access.token.claim
a9273394-23ac-4676-a227-8aca300c1f06	locale	claim.name
a9273394-23ac-4676-a227-8aca300c1f06	String	jsonType.label
b83f4d0b-ff30-49fd-92a9-bacb41405880	true	userinfo.token.claim
b83f4d0b-ff30-49fd-92a9-bacb41405880	profile	user.attribute
b83f4d0b-ff30-49fd-92a9-bacb41405880	true	id.token.claim
b83f4d0b-ff30-49fd-92a9-bacb41405880	true	access.token.claim
b83f4d0b-ff30-49fd-92a9-bacb41405880	profile	claim.name
b83f4d0b-ff30-49fd-92a9-bacb41405880	String	jsonType.label
c8638138-bbac-4111-9732-0d0542848244	true	userinfo.token.claim
c8638138-bbac-4111-9732-0d0542848244	birthdate	user.attribute
c8638138-bbac-4111-9732-0d0542848244	true	id.token.claim
c8638138-bbac-4111-9732-0d0542848244	true	access.token.claim
c8638138-bbac-4111-9732-0d0542848244	birthdate	claim.name
c8638138-bbac-4111-9732-0d0542848244	String	jsonType.label
d7966be5-a145-4efa-9bb5-421b2f01bbe1	true	userinfo.token.claim
d7966be5-a145-4efa-9bb5-421b2f01bbe1	lastName	user.attribute
d7966be5-a145-4efa-9bb5-421b2f01bbe1	true	id.token.claim
d7966be5-a145-4efa-9bb5-421b2f01bbe1	true	access.token.claim
d7966be5-a145-4efa-9bb5-421b2f01bbe1	family_name	claim.name
d7966be5-a145-4efa-9bb5-421b2f01bbe1	String	jsonType.label
ea74ffe8-a97b-4b77-a550-63a525b6756c	true	userinfo.token.claim
ea74ffe8-a97b-4b77-a550-63a525b6756c	middleName	user.attribute
ea74ffe8-a97b-4b77-a550-63a525b6756c	true	id.token.claim
ea74ffe8-a97b-4b77-a550-63a525b6756c	true	access.token.claim
ea74ffe8-a97b-4b77-a550-63a525b6756c	middle_name	claim.name
ea74ffe8-a97b-4b77-a550-63a525b6756c	String	jsonType.label
070faed3-958f-4fde-be81-3b3aa79078fd	foo	user.attribute
070faed3-958f-4fde-be81-3b3aa79078fd	true	access.token.claim
070faed3-958f-4fde-be81-3b3aa79078fd	resource_access.${client_id}.roles	claim.name
070faed3-958f-4fde-be81-3b3aa79078fd	String	jsonType.label
070faed3-958f-4fde-be81-3b3aa79078fd	true	multivalued
81adb246-7b3b-4f3c-b12a-e309c3de12d1	foo	user.attribute
81adb246-7b3b-4f3c-b12a-e309c3de12d1	true	access.token.claim
81adb246-7b3b-4f3c-b12a-e309c3de12d1	realm_access.roles	claim.name
81adb246-7b3b-4f3c-b12a-e309c3de12d1	String	jsonType.label
81adb246-7b3b-4f3c-b12a-e309c3de12d1	true	multivalued
4f3323b0-d3f3-44bf-ba89-1acb8c2ad8ff	clientHost	user.session.note
4f3323b0-d3f3-44bf-ba89-1acb8c2ad8ff	true	userinfo.token.claim
4f3323b0-d3f3-44bf-ba89-1acb8c2ad8ff	true	id.token.claim
4f3323b0-d3f3-44bf-ba89-1acb8c2ad8ff	true	access.token.claim
4f3323b0-d3f3-44bf-ba89-1acb8c2ad8ff	clientHost	claim.name
4f3323b0-d3f3-44bf-ba89-1acb8c2ad8ff	String	jsonType.label
91abae6f-e7e1-4059-93f4-de52a84bc251	client_id	user.session.note
91abae6f-e7e1-4059-93f4-de52a84bc251	true	userinfo.token.claim
91abae6f-e7e1-4059-93f4-de52a84bc251	true	id.token.claim
91abae6f-e7e1-4059-93f4-de52a84bc251	true	access.token.claim
91abae6f-e7e1-4059-93f4-de52a84bc251	client_id	claim.name
91abae6f-e7e1-4059-93f4-de52a84bc251	String	jsonType.label
d1928a4e-bd5f-47cf-ae3d-d90fd8878f04	clientAddress	user.session.note
d1928a4e-bd5f-47cf-ae3d-d90fd8878f04	true	userinfo.token.claim
d1928a4e-bd5f-47cf-ae3d-d90fd8878f04	true	id.token.claim
d1928a4e-bd5f-47cf-ae3d-d90fd8878f04	true	access.token.claim
d1928a4e-bd5f-47cf-ae3d-d90fd8878f04	clientAddress	claim.name
d1928a4e-bd5f-47cf-ae3d-d90fd8878f04	String	jsonType.label
050ae687-0a0d-41a0-9aba-28c75bfb671c	false	aggregate.attrs
050ae687-0a0d-41a0-9aba-28c75bfb671c	false	multivalued
050ae687-0a0d-41a0-9aba-28c75bfb671c	false	userinfo.token.claim
050ae687-0a0d-41a0-9aba-28c75bfb671c	sp_role	user.attribute
050ae687-0a0d-41a0-9aba-28c75bfb671c	false	id.token.claim
050ae687-0a0d-41a0-9aba-28c75bfb671c	true	access.token.claim
050ae687-0a0d-41a0-9aba-28c75bfb671c	sp_role	claim.name
45cd2358-e298-4a17-b711-c615844211be	false	aggregate.attrs
45cd2358-e298-4a17-b711-c615844211be	true	userinfo.token.claim
45cd2358-e298-4a17-b711-c615844211be	false	multivalued
45cd2358-e298-4a17-b711-c615844211be	roles	user.attribute
45cd2358-e298-4a17-b711-c615844211be	false	id.token.claim
45cd2358-e298-4a17-b711-c615844211be	true	access.token.claim
45cd2358-e298-4a17-b711-c615844211be	roles	claim.name
4e22ee2b-1c9f-46b9-b2e6-23402ac59719	false	aggregate.attrs
4e22ee2b-1c9f-46b9-b2e6-23402ac59719	false	multivalued
4e22ee2b-1c9f-46b9-b2e6-23402ac59719	false	userinfo.token.claim
4e22ee2b-1c9f-46b9-b2e6-23402ac59719	user_id	user.attribute
4e22ee2b-1c9f-46b9-b2e6-23402ac59719	false	id.token.claim
4e22ee2b-1c9f-46b9-b2e6-23402ac59719	true	access.token.claim
4e22ee2b-1c9f-46b9-b2e6-23402ac59719	user_id	claim.name
91b31945-d5fd-4ad3-a748-5f2003b5194d	false	aggregate.attrs
91b31945-d5fd-4ad3-a748-5f2003b5194d	false	multivalued
91b31945-d5fd-4ad3-a748-5f2003b5194d	false	userinfo.token.claim
91b31945-d5fd-4ad3-a748-5f2003b5194d	sa_role	user.attribute
91b31945-d5fd-4ad3-a748-5f2003b5194d	false	id.token.claim
91b31945-d5fd-4ad3-a748-5f2003b5194d	true	access.token.claim
91b31945-d5fd-4ad3-a748-5f2003b5194d	sa_role	claim.name
96d41323-0cd1-4aa1-8888-d971646a58c7	false	aggregate.attrs
96d41323-0cd1-4aa1-8888-d971646a58c7	false	multivalued
96d41323-0cd1-4aa1-8888-d971646a58c7	false	userinfo.token.claim
96d41323-0cd1-4aa1-8888-d971646a58c7	cfid	user.attribute
96d41323-0cd1-4aa1-8888-d971646a58c7	false	id.token.claim
96d41323-0cd1-4aa1-8888-d971646a58c7	true	access.token.claim
96d41323-0cd1-4aa1-8888-d971646a58c7	cfid	claim.name
f192adb6-2d4a-4194-b6c9-8c0620fd93eb	false	aggregate.attrs
f192adb6-2d4a-4194-b6c9-8c0620fd93eb	false	multivalued
f192adb6-2d4a-4194-b6c9-8c0620fd93eb	false	userinfo.token.claim
f192adb6-2d4a-4194-b6c9-8c0620fd93eb	service_provider_id	user.attribute
f192adb6-2d4a-4194-b6c9-8c0620fd93eb	false	id.token.claim
f192adb6-2d4a-4194-b6c9-8c0620fd93eb	true	access.token.claim
f192adb6-2d4a-4194-b6c9-8c0620fd93eb	service_provider_id	claim.name
8982d4be-91e1-4261-8b3f-6d91251add4b	true	userinfo.token.claim
8982d4be-91e1-4261-8b3f-6d91251add4b	locale	user.attribute
8982d4be-91e1-4261-8b3f-6d91251add4b	true	id.token.claim
8982d4be-91e1-4261-8b3f-6d91251add4b	true	access.token.claim
8982d4be-91e1-4261-8b3f-6d91251add4b	locale	claim.name
8982d4be-91e1-4261-8b3f-6d91251add4b	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	f9238327-e5d6-450e-a80e-55114996557e	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	639d6d0e-9681-48e3-a6d2-4c2ce101a587	ab0e149e-0743-476b-b2fd-641f3d86c9fe	88c7fb6c-4ebc-43db-81dd-bf2c7ca7c63e	2aa3e096-bf45-40ed-89ad-0f097d998005	e5fae8de-9aba-4fbf-8d2e-6f94ceb399e3	2592000	f	900	t	f	48998b54-fd9d-44f3-987c-13c85ff1d1c0	0	f	0	0	a630d05f-8f0f-4315-a09f-908b56dbdd92
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	60	300	300				t	f	0	ecgvue-theme	ecgvue	0	\N	f	f	f	f	NONE	1800	36000	f	f	22e245e6-fcc1-4130-98c8-5c6784d62b12	1800	f	\N	f	f	f	t	0	1	30	6	HmacSHA1	totp	2daf7423-29eb-4353-89b9-f65429a7060b	fd042e85-027d-45fc-aa6e-fe2addb972ad	b76a2197-902a-4f31-b305-d2657f6aa68e	b46f6de2-41f4-4ac2-931c-1f197e9ac992	baf075fc-f8ab-4a57-8d55-f1d676379be6	2592000	f	900	t	f	b82128c1-e0ef-4b79-8be4-982b6912c0f0	0	f	0	0	65aa1435-eb72-4925-94ee-737c65c93089
aefd2657-49a5-49c5-8baf-3f385b695e4c	60	300	1800	keycloak	keycloak.v2	keycloak	t	f	0	keycloak	ecgvue_test	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	3bb1180d-04fc-4abb-8cbb-55f4cf0a46c9	1800	f	\N	f	f	f	t	0	1	30	6	HmacSHA1	totp	1f98c0e6-cd50-4a17-8fb6-6c080090c037	5dfb0432-1739-49d7-8fa5-c80c8d24c309	e35d8661-9c7c-4d86-a30b-764c37d4eccd	de63e330-6987-4ddd-b409-817f88f765f4	7cb781e3-b4f1-497c-b1e3-e542ea6cf803	2592000	f	900	t	f	d97771a4-093e-4754-8f0d-be521fb7d035	0	f	0	0	c14142ef-e8ed-4cab-b05f-dfe0b79a10d6
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	
_browser_header.xContentTypeOptions	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	nosniff
_browser_header.xRobotsTag	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	none
_browser_header.xFrameOptions	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	SAMEORIGIN
_browser_header.contentSecurityPolicy	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	1; mode=block
_browser_header.strictTransportSecurity	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	max-age=31536000; includeSubDomains
bruteForceProtected	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	false
permanentLockout	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	false
maxFailureWaitSeconds	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	900
minimumQuickLoginWaitSeconds	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	60
waitIncrementSeconds	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	60
quickLoginCheckMilliSeconds	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	1000
maxDeltaTimeSeconds	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	43200
failureFactor	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	30
realmReusableOtpCode	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	false
displayName	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	Keycloak
displayNameHtml	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	RS256
offlineSessionMaxLifespanEnabled	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	false
offlineSessionMaxLifespan	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	5184000
displayName	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	
displayNameHtml	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	
bruteForceProtected	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	false
permanentLockout	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	false
maxFailureWaitSeconds	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	900
minimumQuickLoginWaitSeconds	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	60
waitIncrementSeconds	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	60
quickLoginCheckMilliSeconds	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	1000
maxDeltaTimeSeconds	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	43200
failureFactor	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	30
actionTokenGeneratedByAdminLifespan	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	43200
actionTokenGeneratedByUserLifespan	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	300
defaultSignatureAlgorithm	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	RS256
offlineSessionMaxLifespanEnabled	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	false
offlineSessionMaxLifespan	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5184000
webAuthnPolicyRpEntityName	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	keycloak
webAuthnPolicySignatureAlgorithms	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ES256
webAuthnPolicyRpId	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	
webAuthnPolicyAttestationConveyancePreference	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	not specified
webAuthnPolicyAuthenticatorAttachment	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	not specified
webAuthnPolicyRequireResidentKey	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	not specified
webAuthnPolicyUserVerificationRequirement	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	not specified
webAuthnPolicyCreateTimeout	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	0
webAuthnPolicyAvoidSameAuthenticatorRegister	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	false
webAuthnPolicyRpEntityNamePasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ES256
webAuthnPolicyRpIdPasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	
webAuthnPolicyAttestationConveyancePreferencePasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	not specified
webAuthnPolicyRequireResidentKeyPasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	not specified
webAuthnPolicyCreateTimeoutPasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	false
client-policies.profiles	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	{"profiles":[]}
client-policies.policies	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	
_browser_header.xContentTypeOptions	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	nosniff
_browser_header.xRobotsTag	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	none
_browser_header.xFrameOptions	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	SAMEORIGIN
_browser_header.contentSecurityPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	1; mode=block
_browser_header.strictTransportSecurity	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	max-age=31536000; includeSubDomains
acr.loa.map	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	{}
frontendUrl	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	
cibaExpiresIn	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	120
acr.loa.map	aefd2657-49a5-49c5-8baf-3f385b695e4c	{}
actionTokenGeneratedByUserLifespan-execute-actions	aefd2657-49a5-49c5-8baf-3f385b695e4c	
actionTokenGeneratedByUserLifespan-idp-verify-account-via-email	aefd2657-49a5-49c5-8baf-3f385b695e4c	
actionTokenGeneratedByUserLifespan-reset-credentials	aefd2657-49a5-49c5-8baf-3f385b695e4c	
actionTokenGeneratedByUserLifespan-verify-email	aefd2657-49a5-49c5-8baf-3f385b695e4c	
frontendUrl	aefd2657-49a5-49c5-8baf-3f385b695e4c	
shortVerificationUri	aefd2657-49a5-49c5-8baf-3f385b695e4c	
oauth2DeviceCodeLifespan	aefd2657-49a5-49c5-8baf-3f385b695e4c	600
oauth2DevicePollingInterval	aefd2657-49a5-49c5-8baf-3f385b695e4c	5
clientOfflineSessionIdleTimeout	aefd2657-49a5-49c5-8baf-3f385b695e4c	0
clientOfflineSessionMaxLifespan	aefd2657-49a5-49c5-8baf-3f385b695e4c	0
clientSessionIdleTimeout	aefd2657-49a5-49c5-8baf-3f385b695e4c	0
displayName	aefd2657-49a5-49c5-8baf-3f385b695e4c	
displayNameHtml	aefd2657-49a5-49c5-8baf-3f385b695e4c	
bruteForceProtected	aefd2657-49a5-49c5-8baf-3f385b695e4c	false
permanentLockout	aefd2657-49a5-49c5-8baf-3f385b695e4c	false
maxFailureWaitSeconds	aefd2657-49a5-49c5-8baf-3f385b695e4c	900
minimumQuickLoginWaitSeconds	aefd2657-49a5-49c5-8baf-3f385b695e4c	60
waitIncrementSeconds	aefd2657-49a5-49c5-8baf-3f385b695e4c	60
quickLoginCheckMilliSeconds	aefd2657-49a5-49c5-8baf-3f385b695e4c	1000
maxDeltaTimeSeconds	aefd2657-49a5-49c5-8baf-3f385b695e4c	43200
failureFactor	aefd2657-49a5-49c5-8baf-3f385b695e4c	30
actionTokenGeneratedByAdminLifespan	aefd2657-49a5-49c5-8baf-3f385b695e4c	43200
actionTokenGeneratedByUserLifespan	aefd2657-49a5-49c5-8baf-3f385b695e4c	300
defaultSignatureAlgorithm	aefd2657-49a5-49c5-8baf-3f385b695e4c	RS256
offlineSessionMaxLifespanEnabled	aefd2657-49a5-49c5-8baf-3f385b695e4c	false
offlineSessionMaxLifespan	aefd2657-49a5-49c5-8baf-3f385b695e4c	5184000
clientSessionMaxLifespan	aefd2657-49a5-49c5-8baf-3f385b695e4c	0
realmReusableOtpCode	aefd2657-49a5-49c5-8baf-3f385b695e4c	false
webAuthnPolicyRpEntityName	aefd2657-49a5-49c5-8baf-3f385b695e4c	keycloak
webAuthnPolicySignatureAlgorithms	aefd2657-49a5-49c5-8baf-3f385b695e4c	ES256
webAuthnPolicyRpId	aefd2657-49a5-49c5-8baf-3f385b695e4c	
webAuthnPolicyAttestationConveyancePreference	aefd2657-49a5-49c5-8baf-3f385b695e4c	not specified
webAuthnPolicyAuthenticatorAttachment	aefd2657-49a5-49c5-8baf-3f385b695e4c	not specified
webAuthnPolicyRequireResidentKey	aefd2657-49a5-49c5-8baf-3f385b695e4c	not specified
webAuthnPolicyUserVerificationRequirement	aefd2657-49a5-49c5-8baf-3f385b695e4c	not specified
webAuthnPolicyCreateTimeout	aefd2657-49a5-49c5-8baf-3f385b695e4c	0
webAuthnPolicyAvoidSameAuthenticatorRegister	aefd2657-49a5-49c5-8baf-3f385b695e4c	false
webAuthnPolicyRpEntityNamePasswordless	aefd2657-49a5-49c5-8baf-3f385b695e4c	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	aefd2657-49a5-49c5-8baf-3f385b695e4c	ES256
webAuthnPolicyRpIdPasswordless	aefd2657-49a5-49c5-8baf-3f385b695e4c	
webAuthnPolicyAttestationConveyancePreferencePasswordless	aefd2657-49a5-49c5-8baf-3f385b695e4c	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	aefd2657-49a5-49c5-8baf-3f385b695e4c	not specified
webAuthnPolicyRequireResidentKeyPasswordless	aefd2657-49a5-49c5-8baf-3f385b695e4c	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	aefd2657-49a5-49c5-8baf-3f385b695e4c	not specified
webAuthnPolicyCreateTimeoutPasswordless	aefd2657-49a5-49c5-8baf-3f385b695e4c	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	aefd2657-49a5-49c5-8baf-3f385b695e4c	false
client-policies.profiles	aefd2657-49a5-49c5-8baf-3f385b695e4c	{"profiles":[]}
client-policies.policies	aefd2657-49a5-49c5-8baf-3f385b695e4c	{"policies":[]}
cibaAuthRequestedUserHint	aefd2657-49a5-49c5-8baf-3f385b695e4c	login_hint
cibaBackchannelTokenDeliveryMode	aefd2657-49a5-49c5-8baf-3f385b695e4c	poll
cibaExpiresIn	aefd2657-49a5-49c5-8baf-3f385b695e4c	120
cibaInterval	aefd2657-49a5-49c5-8baf-3f385b695e4c	5
parRequestUriLifespan	aefd2657-49a5-49c5-8baf-3f385b695e4c	60
_browser_header.contentSecurityPolicyReportOnly	aefd2657-49a5-49c5-8baf-3f385b695e4c	
_browser_header.xContentTypeOptions	aefd2657-49a5-49c5-8baf-3f385b695e4c	nosniff
_browser_header.xRobotsTag	aefd2657-49a5-49c5-8baf-3f385b695e4c	none
oauth2DeviceCodeLifespan	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	600
oauth2DevicePollingInterval	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5
clientOfflineSessionIdleTimeout	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	0
clientOfflineSessionMaxLifespan	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	0
clientSessionIdleTimeout	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	0
clientSessionMaxLifespan	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	0
realmReusableOtpCode	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	false
cibaAuthRequestedUserHint	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	login_hint
cibaBackchannelTokenDeliveryMode	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	poll
cibaInterval	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5
parRequestUriLifespan	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	60
_browser_header.xFrameOptions	aefd2657-49a5-49c5-8baf-3f385b695e4c	SAMEORIGIN
_browser_header.contentSecurityPolicy	aefd2657-49a5-49c5-8baf-3f385b695e4c	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	aefd2657-49a5-49c5-8baf-3f385b695e4c	1; mode=block
_browser_header.strictTransportSecurity	aefd2657-49a5-49c5-8baf-3f385b695e4c	
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	jboss-logging
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	jboss-logging
aefd2657-49a5-49c5-8baf-3f385b695e4c	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe
password	password	t	t	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1
password	password	t	t	aefd2657-49a5-49c5-8baf-3f385b695e4c
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	Developer	replyToDisplayName
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	true	starttls
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	true	auth
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1		envelopeFrom
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	false	ssl
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	hMnBcXIqGsVvOaT7	password
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	587	port
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	smtp-relay.brevo.com	host
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	deepak@probeplus.in	replyTo
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	deepak@probeplus.in	from
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	Developer	fromDisplayName
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	deepakbaskar@outlook.com	user
aefd2657-49a5-49c5-8baf-3f385b695e4c	Developer	replyToDisplayName
aefd2657-49a5-49c5-8baf-3f385b695e4c	true	starttls
aefd2657-49a5-49c5-8baf-3f385b695e4c	true	auth
aefd2657-49a5-49c5-8baf-3f385b695e4c		envelopeFrom
aefd2657-49a5-49c5-8baf-3f385b695e4c	false	ssl
aefd2657-49a5-49c5-8baf-3f385b695e4c	hMnBcXIqGsVvOaT7	password
aefd2657-49a5-49c5-8baf-3f385b695e4c	587	port
aefd2657-49a5-49c5-8baf-3f385b695e4c	smtp-relay.brevo.com	host
aefd2657-49a5-49c5-8baf-3f385b695e4c	deepak@probeplus.in	replyTo
aefd2657-49a5-49c5-8baf-3f385b695e4c	deepak@probeplus.in	from
aefd2657-49a5-49c5-8baf-3f385b695e4c	Developer	fromDisplayName
aefd2657-49a5-49c5-8baf-3f385b695e4c	deepakbaskar@outlook.com	user
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
d87078a0-bab2-4e8e-a96c-84c69b9a8051	/realms/master/account/*
b05bd7c0-e999-4234-b313-c5a40ec524b3	/realms/master/account/*
8f81c007-8bed-4f25-9009-2bbcb098c5f3	/admin/master/console/*
ce842fe5-3812-4965-bd2a-223b37637c1d	/realms/ecgvue/account/*
335fc954-d318-439c-a800-ec6890e7befc	/realms/ecgvue/account/*
098636cc-5794-485f-ba91-8128deafe934	/admin/ecgvue/console/*
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	/*
e03a9c44-332a-48cd-8777-d544fd7d3feb	http://10.10.2.146:4200/*
e03a9c44-332a-48cd-8777-d544fd7d3feb	http://localhost:4200/*
e03a9c44-332a-48cd-8777-d544fd7d3feb	https://www.ecgvue.site/*
6f2a4af0-383a-4299-80f8-660c62766a88	/realms/ecgvue_test/account/*
4a4ae264-0e11-45ac-b63c-0cbc3615b0cd	/realms/ecgvue_test/account/*
896090fe-19fb-4c95-906e-e8ad3063bb35	
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	http://10.10.2.146:4200/*
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	http://localhost:4200/*
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	https://www.ecgvue.site/*
5a232f16-784b-45d3-8184-f5293fbea17e	/admin/ecgvue_test/console/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
6f4e3377-fac9-4af4-b4db-e463f881c386	VERIFY_EMAIL	Verify Email	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	t	f	VERIFY_EMAIL	50
e50d3f8a-f514-47ee-975c-9ddea7704204	UPDATE_PROFILE	Update Profile	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	t	f	UPDATE_PROFILE	40
4be9c4e0-b7ab-4a62-8dae-4071900ec90d	CONFIGURE_TOTP	Configure OTP	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	t	f	CONFIGURE_TOTP	10
1cd68bd7-4ce3-40c1-8ccd-edbd5044c73b	UPDATE_PASSWORD	Update Password	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	t	f	UPDATE_PASSWORD	30
531122bd-83f6-4c89-b2d6-74a25d8f1ad7	TERMS_AND_CONDITIONS	Terms and Conditions	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f	f	TERMS_AND_CONDITIONS	20
4c42dc74-3b3d-4d0b-a95c-c8769146abc4	delete_account	Delete Account	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	f	f	delete_account	60
8d7cba32-6b46-4e9d-9299-a360c672f138	update_user_locale	Update User Locale	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	t	f	update_user_locale	1000
d2a7bf3d-4a3a-43a9-8af0-da0283ae49c8	webauthn-register	Webauthn Register	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	t	f	webauthn-register	70
77fdd88f-a3a3-4ad6-9622-345a7b25f0da	webauthn-register-passwordless	Webauthn Register Passwordless	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	t	f	webauthn-register-passwordless	80
ca79076a-283f-46bb-a3e5-afc63d4f112d	CONFIGURE_TOTP	Configure OTP	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	t	f	CONFIGURE_TOTP	10
73d9d095-e3c2-4ae5-8eec-cf68e4a49ec8	TERMS_AND_CONDITIONS	Terms and Conditions	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	f	f	TERMS_AND_CONDITIONS	20
3009dc04-8258-4026-b699-f7b48c8a5962	UPDATE_PASSWORD	Update Password	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	t	f	UPDATE_PASSWORD	30
7160ed51-72e5-4ed1-b0f9-25f79de15dfa	UPDATE_PROFILE	Update Profile	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	t	f	UPDATE_PROFILE	40
54b97ff7-e912-42d6-9e66-fa039b087353	VERIFY_EMAIL	Verify Email	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	t	f	VERIFY_EMAIL	50
636cbf06-a550-4357-bd82-9524281933c2	delete_account	Delete Account	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	f	f	delete_account	60
aa4fdfc5-5ce6-4539-a880-c090d8a39597	webauthn-register	Webauthn Register	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	t	f	webauthn-register	70
a732fc5e-697d-45c9-a96b-415a74b00701	webauthn-register-passwordless	Webauthn Register Passwordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	t	f	webauthn-register-passwordless	80
70715da2-2176-4db4-ab75-aeb2375cee18	update_user_locale	Update User Locale	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	t	f	update_user_locale	1000
859fda1a-ec69-40ac-8150-39bce6d7f834	CONFIGURE_TOTP	Configure OTP	aefd2657-49a5-49c5-8baf-3f385b695e4c	t	f	CONFIGURE_TOTP	10
249fab86-b91a-4315-9710-4a184ebbdb6b	TERMS_AND_CONDITIONS	Terms and Conditions	aefd2657-49a5-49c5-8baf-3f385b695e4c	f	f	TERMS_AND_CONDITIONS	20
67d5c88d-bc36-4e91-9b24-93964fa3d110	UPDATE_PASSWORD	Update Password	aefd2657-49a5-49c5-8baf-3f385b695e4c	t	f	UPDATE_PASSWORD	30
28a791e8-4b00-4846-a646-5f30c323f015	UPDATE_PROFILE	Update Profile	aefd2657-49a5-49c5-8baf-3f385b695e4c	t	f	UPDATE_PROFILE	40
47e3f0d9-8862-485c-b79d-6783fc49fa6b	VERIFY_EMAIL	Verify Email	aefd2657-49a5-49c5-8baf-3f385b695e4c	t	f	VERIFY_EMAIL	50
1f1f38ac-46de-45eb-aedb-5b727baaa191	delete_account	Delete Account	aefd2657-49a5-49c5-8baf-3f385b695e4c	f	f	delete_account	60
aead3cec-ebd2-431c-a15d-5811aa0cf64c	webauthn-register	Webauthn Register	aefd2657-49a5-49c5-8baf-3f385b695e4c	t	f	webauthn-register	70
4a2a7829-dff8-48fb-ad13-4ee59852173d	webauthn-register-passwordless	Webauthn Register Passwordless	aefd2657-49a5-49c5-8baf-3f385b695e4c	t	f	webauthn-register-passwordless	80
9a2a3c8a-3d50-4eda-a627-ec560e2404d2	update_user_locale	Update User Locale	aefd2657-49a5-49c5-8baf-3f385b695e4c	t	f	update_user_locale	1000
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
b05bd7c0-e999-4234-b313-c5a40ec524b3	adb04b60-793e-4160-adc2-c9749dd9e747
b05bd7c0-e999-4234-b313-c5a40ec524b3	caa9af7c-8ff8-4e68-aba6-70e291803eb1
335fc954-d318-439c-a800-ec6890e7befc	064dab66-9585-4f6c-8da5-c3ed93dcefa3
335fc954-d318-439c-a800-ec6890e7befc	e789998b-0b9a-4f3f-9cba-5ce693d54b6b
4a4ae264-0e11-45ac-b63c-0cbc3615b0cd	93b0d98c-4824-4e9f-82e7-50545a06287d
4a4ae264-0e11-45ac-b63c-0cbc3615b0cd	95a6221a-ab2a-43ac-96d5-b5009dbf2cf0
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
cfid	CFUUXZ	1b3aa467-1bd5-4df1-8a6f-2a638e9e67fb	adb4474b-5c15-416d-8aa7-745d76b414a6
service_provider_id	SP_LBNJ	1b3aa467-1bd5-4df1-8a6f-2a638e9e67fb	4c653ad9-a989-41b4-a62b-c998a110c678
user_id	USRGVPPCU	1b3aa467-1bd5-4df1-8a6f-2a638e9e67fb	4fe25a0a-c8a1-42a1-83d8-9d7c8f3bbc1e
roles	['prescriber']	1b3aa467-1bd5-4df1-8a6f-2a638e9e67fb	9c688c51-1747-430b-8bda-a93cdf562ffe
cfid	CFUUXZ	d10fe7f6-88ec-438b-a2c4-947f0dd71f40	a3011821-3940-46db-92cd-b68b2aa39a42
service_provider_id	SP_LBNJ	d10fe7f6-88ec-438b-a2c4-947f0dd71f40	4ef97890-c46b-45b1-9875-64851f3d6a7f
user_id	USRRWJ2C8	d10fe7f6-88ec-438b-a2c4-947f0dd71f40	928f87aa-25e0-4320-8331-5a5c9b3c69d2
roles	['interpreter']	d10fe7f6-88ec-438b-a2c4-947f0dd71f40	9591e7ee-a1aa-4ab6-9c07-336d3f8b091e
cfid	CFUUXZ	465b18d5-a27c-47ba-b123-707dc46c5cdd	99927350-9e05-4851-8a7e-ac10aaf5fae8
service_provider_id	SP_LBNJ	465b18d5-a27c-47ba-b123-707dc46c5cdd	28e15307-6ca6-4b3d-81ca-0db1d0ab8945
user_id	USR3NNPW6	465b18d5-a27c-47ba-b123-707dc46c5cdd	7a296409-4c7a-4a9f-b010-0dad7ebc8798
roles	['admin', 'prescriber', 'ecg_technician']	465b18d5-a27c-47ba-b123-707dc46c5cdd	b0100176-8531-4caa-b176-e6841b759c49
cfid	CFUUXZ	72dc9077-39fc-4bc4-b7e1-6161ee42fc48	61134b37-314c-46cc-aa5d-6835f849a341
service_provider_id	SP_LBNJ	72dc9077-39fc-4bc4-b7e1-6161ee42fc48	a5b151c1-cb8c-4814-bc9d-370a055b2ac2
user_id	USRR1XFYA	72dc9077-39fc-4bc4-b7e1-6161ee42fc48	8a602818-5016-4ff2-a7e1-90a913210d85
roles	['interpreter']	72dc9077-39fc-4bc4-b7e1-6161ee42fc48	0e1d5004-1793-4ef2-80ea-3d758822f16b
cfid	CFUUXZ	ae6377a3-9809-4c57-887e-39b74f1ab9be	db49f3ec-3d14-490b-8555-7e72b3da95e6
service_provider_id	SP_LBNJ	ae6377a3-9809-4c57-887e-39b74f1ab9be	54ca48a4-1b9b-48b7-a42a-edb3b126dbae
user_id	USRFJKIE9	ae6377a3-9809-4c57-887e-39b74f1ab9be	785e87fc-fd79-4edb-ac27-9a7be31cccd5
roles	['prescriber']	ae6377a3-9809-4c57-887e-39b74f1ab9be	8500db9e-969e-42cc-a78f-7eda18d99737
cfid	CFUUXZ	6b7be798-7d17-49fe-9184-a05dd95b129a	59e3cfe1-5ca7-409c-9ace-de479d2f6e9d
service_provider_id	SP_LBNJ	6b7be798-7d17-49fe-9184-a05dd95b129a	f24bd610-2fa7-4187-b079-4c4c4a577e2d
user_id	USRIJOLLN	6b7be798-7d17-49fe-9184-a05dd95b129a	3b0206ba-8000-4553-8025-1ce06e0c37aa
cfid	CFUUXZ	86ce729a-390c-445d-a60b-be12b139d434	cc75f051-12b7-46b4-bb20-545ca76309d2
sp_role	['cfa']	86ce729a-390c-445d-a60b-be12b139d434	6839fb7b-c2c0-4f77-91b0-34c5d011bc70
service_provider_id	SP_LBNJ	86ce729a-390c-445d-a60b-be12b139d434	512ac1f3-7275-441c-90aa-5a39bef1f8c8
user_id	USRYZP2BI	86ce729a-390c-445d-a60b-be12b139d434	0a301170-d03c-4367-a3db-c142b66ea891
sp_role	['spa_default']	a33b3d95-bd48-4056-804c-20236917e169	cc0fc989-56e5-4219-a71b-af62be816d10
service_provider_id	SP_LBNJ	a33b3d95-bd48-4056-804c-20236917e169	a992c86e-0f77-4526-8900-4f0cd1afb7b3
user_id	USRK2RSXN	a33b3d95-bd48-4056-804c-20236917e169	f74a7e0e-b07f-4228-beab-10fe3822dcf5
sa_role	['saa']	094ab296-50ae-4871-8c56-df05dc1c7f14	9fd846a8-149b-49c8-957c-fa6aed672d69
user_id	SAM1EHC9L	094ab296-50ae-4871-8c56-df05dc1c7f14	58f3e257-4cee-4101-a99d-c770a830a257
sa_role	['saa']	f1eaab0f-de5e-4084-a61d-3064d9c35b61	e1c328e2-b2c9-4992-a1f8-a24a17894f57
sa_role	['saa']	1de09fb6-cc86-4db0-88e4-c0e3f31fa42f	ce98115a-c925-4d90-9ae3-08c6800cbf25
user_id	SAMFJFRXK	1de09fb6-cc86-4db0-88e4-c0e3f31fa42f	87a1ef13-a9ce-4b4a-b45b-325d756dcbb2
sa_role	['sa']	0ca09762-e817-4e1d-aa47-d2f33fff3c66	d5f701fc-c5b6-476a-a65a-f159432260cd
user_id	SAMWH5QNY	0ca09762-e817-4e1d-aa47-d2f33fff3c66	58cdda96-dc00-41fa-b12f-d5b2f6dd2b20
sp_role	['spa_default']	8f77adc0-ee6f-4968-9aad-99f0ddfb8454	12e8ed47-1c0d-41a0-b065-48592b2eceae
service_provider_id	SP_LBNJ	8f77adc0-ee6f-4968-9aad-99f0ddfb8454	7c3cfc6a-4c1a-4f37-9586-010c5b2c2754
user_id	USRM0X9B3	8f77adc0-ee6f-4968-9aad-99f0ddfb8454	91b2b8e8-0b5f-4e9c-90e9-c34b3a3285b9
sp_role	['spa']	c55138b1-f10b-4bc5-8042-9da8e7e7f9fb	76b119a7-a55a-45d2-9aef-dde47fdc6500
service_provider_id	SP_LBNJ	c55138b1-f10b-4bc5-8042-9da8e7e7f9fb	9930a7f6-0720-41d7-87af-65369881261e
user_id	USR29WS6S	c55138b1-f10b-4bc5-8042-9da8e7e7f9fb	58197423-2108-4f7a-a082-6606003721b6
sp_role	['ref_physician']	62333f60-9be1-4703-b80b-59ad49039485	e2d2ae77-2690-4cd8-804e-0553bea4d5fb
service_provider_id	SP_LBNJ	62333f60-9be1-4703-b80b-59ad49039485	6a5b2377-aa35-4f95-8111-1941b338ee86
user_id	USRDDO6CL	62333f60-9be1-4703-b80b-59ad49039485	96c92c76-4a5a-4bdb-a761-a90d25366c80
sp_role	['sp_ecg_technician']	9d37a8e6-1057-4d51-a8bc-b1fa894d5a43	f35864e1-059d-44c8-8c2c-7aab3c95dc71
service_provider_id	SP_LBNJ	9d37a8e6-1057-4d51-a8bc-b1fa894d5a43	bde8ca86-a094-46bc-972a-0a5f56e69f7c
user_id	USRLT4IB2	9d37a8e6-1057-4d51-a8bc-b1fa894d5a43	161d0b55-f02b-48f6-bd21-29d4806bd858
sp_role	['sp_interpreter']	75146597-f1ef-4cb6-9b8d-ae0d41d751e6	7ae30a4d-2b76-412e-a355-603e58472e26
service_provider_id	SP_LBNJ	75146597-f1ef-4cb6-9b8d-ae0d41d751e6	fdb0aeb7-eb7e-41f9-afa4-2fe57753bb61
user_id	USR3GGRI7	75146597-f1ef-4cb6-9b8d-ae0d41d751e6	0ca9b2ac-fcc4-4af1-8c8a-7568b63430e3
cfid	CFUUXZ	b7910098-86d5-426a-acfe-4660ef67b383	0f16c14b-d6ac-42a7-9005-0a8acbc738c0
sp_role	['cfa']	b7910098-86d5-426a-acfe-4660ef67b383	a5b8c558-ba4a-46cd-acb8-9f8915c5c3f1
service_provider_id	SP_LBNJ	b7910098-86d5-426a-acfe-4660ef67b383	b1d03ed0-2838-4a55-b8cd-20be3d8d4351
user_id	USRQ834SA	b7910098-86d5-426a-acfe-4660ef67b383	37be18fc-69a1-41b0-b545-358143d0e2ea
cfid	CFUUXZ	7db2f70f-8790-46e0-9c1f-bd5376a1411b	2099fcd3-1cf1-4b14-ab8e-d98fe5be71d1
service_provider_id	SP_LBNJ	7db2f70f-8790-46e0-9c1f-bd5376a1411b	ef04ae8c-90eb-463e-96c4-b46d8bbbfba8
user_id	USRACY7JL	7db2f70f-8790-46e0-9c1f-bd5376a1411b	72e187e0-c9cd-4fc7-a29f-42b2c613be3f
roles	['admin', 'prescriber', 'interpreter', 'ecg_technician', 'clinician']	7db2f70f-8790-46e0-9c1f-bd5376a1411b	87aac878-96ff-467c-96a1-fab40e461165
user_id	SAM3DIWCO	f1eaab0f-de5e-4084-a61d-3064d9c35b61	95e70d8a-1b7b-4d1b-b1d8-a0295e77d59b
sp_role	['sp_interpreter']	c3c6c636-1a60-4491-9feb-92959e1a3c6c	7a2e1ac1-6a9c-41a7-925d-a80132edb923
service_provider_id	SP_LBNJ	c3c6c636-1a60-4491-9feb-92959e1a3c6c	7988d20d-f504-4fa5-a3ac-732ee1aaff30
user_id	USR8ZHLCW	c3c6c636-1a60-4491-9feb-92959e1a3c6c	68dca8b1-0c7e-4c5b-b9f0-b82dddef67df
sa_role	['saa']	01550362-ec22-4b11-81d7-607eaf197b51	772c3b31-be9f-4df2-a6ca-47e0a40a031c
user_id	SAMRWU6MN	01550362-ec22-4b11-81d7-607eaf197b51	d45574e0-79ca-45ca-915a-5de8b68fb97a
sa_role	['sa']	bc2824c9-0dcb-4f59-a67a-e7d0f5168f5c	37d54051-0499-486c-9720-cc693f6a49ec
user_id	SAMK3U2O7	bc2824c9-0dcb-4f59-a67a-e7d0f5168f5c	d30c0663-de9d-4cff-a029-85e4eae92d90
sp_role	['spa_default']	809406ce-c1fc-47a8-9eed-3393a41ad9e5	cedf439d-1666-426a-a7e7-96f20452e0d0
service_provider_id	SP_9E53	809406ce-c1fc-47a8-9eed-3393a41ad9e5	a23b7897-c004-4dd6-a37a-a688fb76a5ec
user_id	USR9G6K3Y	809406ce-c1fc-47a8-9eed-3393a41ad9e5	36e81ec8-d16c-4236-be35-44c84b3284b9
sp_role	['spa']	1f09e5a2-94a8-4c5d-b0e5-3aa5fdeb6690	8043de7b-4808-41d0-a821-215c94a9f6d5
service_provider_id	SP_9E53	1f09e5a2-94a8-4c5d-b0e5-3aa5fdeb6690	6b563ae5-4f02-473b-96c3-98fcedf3fe86
user_id	USR9JOASD	1f09e5a2-94a8-4c5d-b0e5-3aa5fdeb6690	d9f5e365-8edf-4a94-9a04-f11b4b4b4d8f
sp_role	['ref_physician']	e0f3a790-bdec-4773-a6f8-74ff99974379	8cbe8b69-86ed-472b-9d4b-1f4c889ab70b
service_provider_id	SP_9E53	e0f3a790-bdec-4773-a6f8-74ff99974379	5a406bb1-9a99-44e7-9856-46944c031401
user_id	USRWR41W8	e0f3a790-bdec-4773-a6f8-74ff99974379	1fab1c23-86e9-4a59-aa24-fc8378005cd6
sp_role	['sp_ecg_technician']	510e5ac0-a790-4c85-b9df-31834fe775e6	fe4cb9d7-0439-4a43-9a0f-a499a2d96a9f
service_provider_id	SP_9E53	510e5ac0-a790-4c85-b9df-31834fe775e6	3f200a47-4676-4947-bf0a-9468613ee52e
user_id	USRLZJXHE	510e5ac0-a790-4c85-b9df-31834fe775e6	4b59879b-f845-4eaa-ae85-d7f25ce7d59e
sp_role	['sp_interpreter']	3085d08d-0bf2-4682-9ee6-8f45d86bbfc9	6bec2b55-ac71-48e5-a976-8530a063686c
service_provider_id	SP_9E53	3085d08d-0bf2-4682-9ee6-8f45d86bbfc9	5cbb2630-57ab-4d74-932a-f8b942d4eeca
user_id	USRK8U2I5	3085d08d-0bf2-4682-9ee6-8f45d86bbfc9	368adf30-0bff-4880-9d2f-ab60d510a360
cfid	CFIHDD	f738e3d2-d3a5-4eca-b9d2-95654d648536	a83b3cdb-3cb9-42c0-aded-fa50fc1455eb
sp_role	['cfa']	f738e3d2-d3a5-4eca-b9d2-95654d648536	9899ed75-4a15-49ee-91c9-f86d1f169f5a
service_provider_id	SP_9E53	f738e3d2-d3a5-4eca-b9d2-95654d648536	975c8502-72c0-4b23-a48f-5044474194bc
user_id	USR05TVPP	f738e3d2-d3a5-4eca-b9d2-95654d648536	55f4530a-1168-4a13-8cdb-46adb2340f81
cfid	CFIHDD	ae31e892-465d-478e-b580-7c50c7bedd21	14ea416d-e827-4e1d-ae33-685085aa2362
service_provider_id	SP_9E53	ae31e892-465d-478e-b580-7c50c7bedd21	7f06e2ec-c203-4056-8151-03ba8d06d418
user_id	USR65JRTE	ae31e892-465d-478e-b580-7c50c7bedd21	470fb3ca-1fb1-4096-bd08-544a3d1fd7b6
roles	['admin', 'prescriber', 'interpreter', 'ecg_technician', 'clinician']	ae31e892-465d-478e-b580-7c50c7bedd21	c005f4b5-6d58-4d85-a14d-3fa6c18d22ee
sa_role	['saa']	5fb5d325-8e17-4b62-9cfd-520f3aa6f586	b2d08b0a-5cca-4827-ac3f-ba72b1d6987e
user_id	SAMFEKI3J	5fb5d325-8e17-4b62-9cfd-520f3aa6f586	cda6902a-4984-4b7f-8532-7cece9dcef28
sa_role	['sa']	b374dddc-4626-4d3e-b1bf-e445e2de1897	cf89a570-2cf8-451a-97e6-bcb52e680f6a
user_id	SAM4BEHPQ	b374dddc-4626-4d3e-b1bf-e445e2de1897	7b3952b5-021c-451e-9147-fc7f15666f64
sp_role	['spa_default']	1693758e-4aaf-4b3c-9201-53dff25bb796	71037747-0097-4f68-b979-51da7bacd605
service_provider_id	SP_BA1S	1693758e-4aaf-4b3c-9201-53dff25bb796	7ac4fff9-3268-40c4-a8a5-697a0976efe7
user_id	USRH9IRJQ	1693758e-4aaf-4b3c-9201-53dff25bb796	2b0f831d-7db9-4656-8cc7-fa3d0b0d4f53
sp_role	['spa']	e31ebbb6-ada7-42d1-938b-57f196235347	d3417fc2-1b2b-4c53-9278-31bd82e6da0d
service_provider_id	SP_BA1S	e31ebbb6-ada7-42d1-938b-57f196235347	cb944aa8-4bfe-4a70-bee0-b318a0f59817
user_id	USR6KTFIB	e31ebbb6-ada7-42d1-938b-57f196235347	066065ff-72e9-49e9-86d1-9f56891a0bd3
sp_role	['ref_physician']	8356010a-f011-4ad7-83b8-680e96d0311d	9e2cd4b0-e8a6-415b-ac55-ba978e637795
service_provider_id	SP_BA1S	8356010a-f011-4ad7-83b8-680e96d0311d	26bf3727-e3e6-48b6-b3cb-0d3bf2802404
user_id	USRMEVQ88	8356010a-f011-4ad7-83b8-680e96d0311d	15066d3e-c98a-4236-8694-108a73efe348
sp_role	['sp_ecg_technician']	a7bc6f61-dc81-4b1f-9e4d-22f4fc6261c5	81be71fa-9a22-442d-8dfd-a4b58109065e
service_provider_id	SP_BA1S	a7bc6f61-dc81-4b1f-9e4d-22f4fc6261c5	d7b8693c-efc2-47ee-915e-2a5de1cbe135
user_id	USRWWDF5I	a7bc6f61-dc81-4b1f-9e4d-22f4fc6261c5	03f49db5-f7cb-4533-a021-d799baaaf493
sp_role	['sp_interpreter']	91db1cb1-5c5e-4480-83b1-ee0e064e7a2a	01d89bf5-265c-4661-88ac-e8be300d6660
service_provider_id	SP_BA1S	91db1cb1-5c5e-4480-83b1-ee0e064e7a2a	c0230283-4581-4313-a0e6-5b631954b820
user_id	USRIVFNAW	91db1cb1-5c5e-4480-83b1-ee0e064e7a2a	0f8209c1-4fb8-4bf3-b44e-d2ba6a844394
cfid	CFWXAN	950150f9-b0a0-45be-b53e-510a70c018e5	faf51191-702d-49f9-9664-310ad60cfa04
sp_role	['cfa']	950150f9-b0a0-45be-b53e-510a70c018e5	fd97e01d-e50c-4f5b-b824-4909d6a3661f
service_provider_id	SP_BA1S	950150f9-b0a0-45be-b53e-510a70c018e5	e0e19a08-be48-4ea1-83f8-dbf06f428fad
user_id	USRX3PAD8	950150f9-b0a0-45be-b53e-510a70c018e5	bcd04177-62f7-4120-8a44-a28701853e0d
cfid	CFWXAN	03a8aef9-fc64-474b-9adc-90a4c1ff2d4c	b17bb773-d1af-4891-a9d5-99f0530b205f
service_provider_id	SP_BA1S	03a8aef9-fc64-474b-9adc-90a4c1ff2d4c	e717f4f8-0985-4744-b377-62f72d766c78
user_id	USRVDHFGS	03a8aef9-fc64-474b-9adc-90a4c1ff2d4c	f83db0e1-e923-4214-87b5-b51db11eebc7
roles	['admin', 'prescriber', 'interpreter', 'ecg_technician', 'clinician']	03a8aef9-fc64-474b-9adc-90a4c1ff2d4c	29369fb0-2b71-4a43-9a18-8dc5d9b349cb
cfid	CFUUXZ	cefaa241-12d7-431d-bc52-89a6fd17a2e6	e5f01171-b493-4b1f-b970-10a0f03cd236
service_provider_id	SP_LBNJ	cefaa241-12d7-431d-bc52-89a6fd17a2e6	1e9cdbd7-53a5-4358-8607-88d81b494e74
user_id	USRLV0GOM	cefaa241-12d7-431d-bc52-89a6fd17a2e6	7d5c7c96-a982-472f-859d-9d2067802f83
cfid	CFUUXZ	53b07ec8-73d9-4ffd-8071-f9a73b20f330	44e0a368-3d45-4a63-91f8-ee2c4478d22e
service_provider_id	SP_LBNJ	53b07ec8-73d9-4ffd-8071-f9a73b20f330	7e6a1f01-70f1-42e5-9294-640f53df1b47
user_id	USR5YZRGV	53b07ec8-73d9-4ffd-8071-f9a73b20f330	4d60a438-9418-40e6-97bf-5f2e5c68da35
roles	['prescriber', 'interpreter', 'clinician']	53b07ec8-73d9-4ffd-8071-f9a73b20f330	e2f8c08e-b504-4240-9ffa-66c9834c9f8e
cfid	CFUUXZ	94610168-c5a1-44f1-be05-bf7a09e98ab1	7708e8fd-383e-4cb6-ae85-a5ff5881a46c
service_provider_id	SP_LBNJ	94610168-c5a1-44f1-be05-bf7a09e98ab1	a64330ff-e766-4238-a477-30eac5a9bb28
user_id	USRUHS8PB	94610168-c5a1-44f1-be05-bf7a09e98ab1	e617f346-aa7a-47fb-a51f-173497ac4ef5
roles	['admin', 'prescriber', 'ecg_technician', 'clinician']	94610168-c5a1-44f1-be05-bf7a09e98ab1	a3133e34-13de-4b4c-bc44-c8e331943677
cfid	CFUUXZ	b50fceb3-d68f-45af-a95e-ef39768d7be0	6fad3f33-216a-4fbc-99e8-0083314d43aa
service_provider_id	SP_LBNJ	b50fceb3-d68f-45af-a95e-ef39768d7be0	861947a8-9bd2-4d9a-a049-97371aa81886
user_id	USRFB5YYO	b50fceb3-d68f-45af-a95e-ef39768d7be0	212774fc-b1cb-45d9-932a-41690e70860a
roles	['admin', 'interpreter', 'ecg_technician']	b50fceb3-d68f-45af-a95e-ef39768d7be0	5316ac83-4f66-40b1-ada3-fd7f6f96a045
cfid	CFUUXZ	6fa2fc79-3a21-4947-9ede-a850288e7764	3fe1fbbb-8778-4b40-930a-2c2d0e3b9a10
service_provider_id	SP_LBNJ	6fa2fc79-3a21-4947-9ede-a850288e7764	592669e5-45e4-45b7-ba57-5238282075fc
user_id	USRDLK8DE	6fa2fc79-3a21-4947-9ede-a850288e7764	04d2846a-f95f-4f83-a65f-aa1dc5dfe350
roles	['admin', 'interpreter', 'ecg_technician', 'clinician']	6fa2fc79-3a21-4947-9ede-a850288e7764	28ee85e4-34bd-440e-89e5-c3099fc14077
cfid	CFUUXZ	c50a0b33-8455-4c81-816c-19aefba992d4	bf7e4244-ab1d-4a6d-9ac0-e81e58fef598
service_provider_id	SP_LBNJ	c50a0b33-8455-4c81-816c-19aefba992d4	0b898f05-4fbb-472f-9475-f6416fa48255
user_id	USR6B7CFL	c50a0b33-8455-4c81-816c-19aefba992d4	b3404a9a-012f-4233-a644-780b6124c1ed
roles	['admin', 'prescriber', 'ecg_technician', 'clinician']	c50a0b33-8455-4c81-816c-19aefba992d4	3e6eccb6-dbe0-4457-b5a2-720ae504bcf5
roles	[]	cefaa241-12d7-431d-bc52-89a6fd17a2e6	377e8a74-a49c-4da9-bd92-1a47a44c6acd
roles	[]	6b7be798-7d17-49fe-9184-a05dd95b129a	b5df3a5e-deeb-49c6-979e-189b72f9a072
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
094ab296-50ae-4871-8c56-df05dc1c7f14	nicoleleon@example.net	nicoleleon@example.net	f	t	\N	Drew	Holder	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	1697199873	1692167049478	\N	0
1b3aa467-1bd5-4df1-8a6f-2a638e9e67fb	prescriber@gmail.com	prescriber@gmail.com	f	t	\N	Prescriber	Prescriber	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	prescriber@gmail.com	1692002831530	\N	0
d10fe7f6-88ec-438b-a2c4-947f0dd71f40	interpreter@gmail.com	interpreter@gmail.com	f	t	\N	Interpreter	Interpreter	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	interpreter@gmail.com	1692003079967	\N	0
240f2d38-c410-472f-93e9-60406577d2bb	\N	617aec50-7b4c-4952-914f-2bebb06080e0	f	t	\N	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	service-account-backend	1686652044914	dedf63b3-4d87-4515-b7d4-8ee882db4bd1	0
4a9a5a8b-422f-4731-85db-f34cd55634b2	deepakbaskar@outlook.com	deepakbaskar@outlook.com	t	t	\N		Deepak	a8377f26-42ad-4a76-b6e3-b36ebb04dbfe	user	1691995764323	\N	0
6b7be798-7d17-49fe-9184-a05dd95b129a	\N	bcfe121f-3bc1-4f07-8596-c34abb75c716	f	t	\N	Asfg	Ssf	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	6536536535	1692003369604	\N	0
465b18d5-a27c-47ba-b123-707dc46c5cdd	admin@gmail.com	admin@gmail.com	f	t	\N	Admin	Admin	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	1245134513	1692003231158	\N	0
72dc9077-39fc-4bc4-b7e1-6161ee42fc48	\N	b2a0a629-c374-40ef-b54f-e2d5579a3f40	f	t	\N	Asfasf	Asdfa	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	2452452452	1692003278123	\N	0
ae6377a3-9809-4c57-887e-39b74f1ab9be	\N	e0782cf4-b11e-4930-a8cc-6cd57a4b6273	f	t	\N	Edgfs	Asf	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	2542452452	1692003350963	\N	0
f1eaab0f-de5e-4084-a61d-3064d9c35b61	felicia98@example.net	felicia98@example.net	f	t	\N	Kelly	Marks	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	1030530840	1692167085586	\N	0
01550362-ec22-4b11-81d7-607eaf197b51	celliott@example.org	celliott@example.org	f	t	\N	Brian	Good	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	1879462209	1692168300748	\N	0
659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7	\N	1fefb868-fd91-4291-a364-105b674fa493	f	t	\N	\N	\N	aefd2657-49a5-49c5-8baf-3f385b695e4c	service-account-backend	1691220573764	896090fe-19fb-4c95-906e-e8ad3063bb35	0
a33b3d95-bd48-4056-804c-20236917e169	\N	205f2f34-c4a1-4acd-ae76-84e52acb4cec	f	f	\N	Test	user	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	9765776576	1692166528320	\N	0
8f77adc0-ee6f-4968-9aad-99f0ddfb8454	spadefault@gmail.com	spadefault@gmail.com	f	t	\N	David	Henry	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	9876543991	1691996372297	\N	0
bc2824c9-0dcb-4f59-a67a-e7d0f5168f5c	larsonaaron@example.org	larsonaaron@example.org	f	t	\N	Tiffany	Hall	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	4067925069	1692168300842	\N	0
75146597-f1ef-4cb6-9b8d-ae0d41d751e6	sp_interpreter@gmail.com	sp_interpreter@gmail.com	f	t	\N	Steven	Sanchez	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	2521932140	1691996372622	\N	0
b7910098-86d5-426a-acfe-4660ef67b383	cfa@gmail.com	cfa@gmail.com	f	t	\N	Anthony	Hill	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	9876543210	1691996372896	\N	0
c3c6c636-1a60-4491-9feb-92959e1a3c6c	\N	12081f4f-ba75-4c5d-b26f-ae7711dc048b	f	t	\N	Rajappan	KK	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	9787866665	1692167411109	\N	0
809406ce-c1fc-47a8-9eed-3393a41ad9e5	paigesullivan@example.com	paigesullivan@example.com	f	t	\N	Brianna	Buchanan	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	4369658105	1692168301190	\N	0
1f09e5a2-94a8-4c5d-b0e5-3aa5fdeb6690	michael69@example.org	michael69@example.org	f	t	\N	Donna	Sparks	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	7176052125	1692168301276	\N	0
e0f3a790-bdec-4773-a6f8-74ff99974379	padillamiguel@example.com	padillamiguel@example.com	f	t	\N	Karen	Smith	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	9293186373	1692168301360	\N	0
510e5ac0-a790-4c85-b9df-31834fe775e6	daniellewalker@example.com	daniellewalker@example.com	f	t	\N	Lisa	Gardner	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5639625914	1692168301469	\N	0
3085d08d-0bf2-4682-9ee6-8f45d86bbfc9	hmyers@example.net	hmyers@example.net	f	t	\N	Christopher	Gill	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	3992233198	1692168301571	\N	0
f738e3d2-d3a5-4eca-b9d2-95654d648536	qjohnston@example.org	qjohnston@example.org	f	t	\N	Sarah	Lopez	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5807987991	1692168301898	\N	0
ae31e892-465d-478e-b580-7c50c7bedd21	robert16@example.net	robert16@example.net	f	t	\N	Clarence	Lopez	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	4862545053	1692168302209	\N	0
5fb5d325-8e17-4b62-9cfd-520f3aa6f586	lindalewis@example.com	lindalewis@example.com	f	t	\N	Beverly	Deleon	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	8786774122	1692168432877	\N	0
b374dddc-4626-4d3e-b1bf-e445e2de1897	sfisher@example.com	sfisher@example.com	f	t	\N	Mario	Alexander	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	8036180066	1692168432974	\N	0
86ce729a-390c-445d-a60b-be12b139d434	\N	731063b9-287c-4bfa-851c-9a8535050205	f	f	\N	sfgasf	asfasf	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	4524525252	1692003805133	\N	0
1de09fb6-cc86-4db0-88e4-c0e3f31fa42f	saa@gmail.com	saa@gmail.com	f	t	\N	Kaylee	Richard	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	4097559447	1691996371875	\N	0
0ca09762-e817-4e1d-aa47-d2f33fff3c66	sa@gmail.com	sa@gmail.com	f	t	\N	Alexis	Strickland	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	9876543123	1691996371987	\N	0
c55138b1-f10b-4bc5-8042-9da8e7e7f9fb	spa@gmail.com	spa@gmail.com	f	t	\N	Jonathan	Price	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	9876548817	1691996372377	\N	0
62333f60-9be1-4703-b80b-59ad49039485	ref_physician@gmail.com	ref_physician@gmail.com	f	t	\N	Nicole	Rhodes	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	7898567285	1691996372455	\N	0
9d37a8e6-1057-4d51-a8bc-b1fa894d5a43	sp_ecg_technician@gmail.com	sp_ecg_technician@gmail.com	f	t	\N	Julia	Phillips	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	7488459142	1691996372540	\N	0
7db2f70f-8790-46e0-9c1f-bd5376a1411b	deepak@probeplus.in	deepak@probeplus.in	f	t	\N	Kimberly	Wilson	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	9876543211	1691996373133	\N	0
1693758e-4aaf-4b3c-9201-53dff25bb796	lisamcguire@example.org	lisamcguire@example.org	f	t	\N	Brianna	Reynolds	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	7611741649	1692168433281	\N	0
e31ebbb6-ada7-42d1-938b-57f196235347	chaneylevi@example.org	chaneylevi@example.org	f	t	\N	Kathleen	Boyd	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	8865205163	1692168433376	\N	0
8356010a-f011-4ad7-83b8-680e96d0311d	shannonjaime@example.com	shannonjaime@example.com	f	t	\N	Jesse	Duran	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	4643310392	1692168433462	\N	0
a7bc6f61-dc81-4b1f-9e4d-22f4fc6261c5	emilygentry@example.net	emilygentry@example.net	f	t	\N	Steven	Jones	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	4603638475	1692168433566	\N	0
91db1cb1-5c5e-4480-83b1-ee0e064e7a2a	thomasjames@example.com	thomasjames@example.com	f	t	\N	Stephanie	Strickland	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	2793485095	1692168433751	\N	0
950150f9-b0a0-45be-b53e-510a70c018e5	morganlucas@example.org	morganlucas@example.org	f	t	\N	Anthony	Dudley	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	9854859346	1692168434103	\N	0
03a8aef9-fc64-474b-9adc-90a4c1ff2d4c	rachel30@example.net	rachel30@example.net	f	t	\N	Christopher	Gonzalez	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	0377000490	1692168434411	\N	0
cefaa241-12d7-431d-bc52-89a6fd17a2e6	\N	34f3e31f-4447-4dac-b315-348e37eab96e	f	t	\N	Safd	Adf	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	3456345634	1692181657040	\N	0
53b07ec8-73d9-4ffd-8071-f9a73b20f330	hdouglas@example.com	hdouglas@example.com	f	t	\N	James	Singleton	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	9542419771	1692185840507	\N	0
94610168-c5a1-44f1-be05-bf7a09e98ab1	michael62@example.com	michael62@example.com	f	t	\N	Emma	Johnson	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5709411795	1692185873271	\N	0
b50fceb3-d68f-45af-a95e-ef39768d7be0	danielwang@example.net	danielwang@example.net	f	t	\N	Steven	Harrison	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	6015607834	1692185877195	\N	0
6fa2fc79-3a21-4947-9ede-a850288e7764	lori77@example.net	lori77@example.net	f	t	\N	Gail	Koch	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	lori77@example.net	1692185880982	\N	0
c50a0b33-8455-4c81-816c-19aefba992d4	\N	a7911d8f-7e2a-424a-a199-077c33b01d9a	f	t	\N	Connie	Good	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	2456107389	1692185884598	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
a630d05f-8f0f-4315-a09f-908b56dbdd92	4a9a5a8b-422f-4731-85db-f34cd55634b2
4d54e18d-778d-4a9d-9f06-e0cb65c45bfb	4a9a5a8b-422f-4731-85db-f34cd55634b2
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	240f2d38-c410-472f-93e9-60406577d2bb
55cb1aec-8703-45c4-9825-6c2c61ad4a50	4a9a5a8b-422f-4731-85db-f34cd55634b2
abf3eb56-8fb7-4e4e-8e87-0714f953655c	4a9a5a8b-422f-4731-85db-f34cd55634b2
073d8f3b-fe2c-456a-8703-c68f6c468902	4a9a5a8b-422f-4731-85db-f34cd55634b2
8c08bf36-9abd-4b1d-9da7-300b424a3155	4a9a5a8b-422f-4731-85db-f34cd55634b2
777853a3-53cc-445f-8ac5-b1c8e17fc826	4a9a5a8b-422f-4731-85db-f34cd55634b2
8f1e85dc-186d-4939-b345-67879ca63a8f	4a9a5a8b-422f-4731-85db-f34cd55634b2
1b6f3ef4-e180-487e-8ff9-e223beac3143	4a9a5a8b-422f-4731-85db-f34cd55634b2
9f730877-6614-4819-b441-036ffdc3e7db	4a9a5a8b-422f-4731-85db-f34cd55634b2
aaa13251-8f0d-4943-a197-72b038b572de	4a9a5a8b-422f-4731-85db-f34cd55634b2
5338ae18-f027-4ec8-be88-456cca1f95f0	4a9a5a8b-422f-4731-85db-f34cd55634b2
ab66d46b-555c-4b25-9f01-0b73f56499d6	4a9a5a8b-422f-4731-85db-f34cd55634b2
bd44d109-908d-43ea-9b72-244f2ea39649	4a9a5a8b-422f-4731-85db-f34cd55634b2
e419e201-505e-425c-8306-4d597af43df7	4a9a5a8b-422f-4731-85db-f34cd55634b2
b5e59694-37f0-4211-945c-f2d07e55d54e	4a9a5a8b-422f-4731-85db-f34cd55634b2
b679f682-fbcd-446b-a2d8-1e44a14ce9b2	4a9a5a8b-422f-4731-85db-f34cd55634b2
cebff73d-43f3-4808-a269-487a99405f45	4a9a5a8b-422f-4731-85db-f34cd55634b2
49cf21a1-b0c6-4f07-8a7a-7e72e3cbfe8b	4a9a5a8b-422f-4731-85db-f34cd55634b2
65aa1435-eb72-4925-94ee-737c65c93089	1b3aa467-1bd5-4df1-8a6f-2a638e9e67fb
65aa1435-eb72-4925-94ee-737c65c93089	d10fe7f6-88ec-438b-a2c4-947f0dd71f40
65aa1435-eb72-4925-94ee-737c65c93089	465b18d5-a27c-47ba-b123-707dc46c5cdd
65aa1435-eb72-4925-94ee-737c65c93089	72dc9077-39fc-4bc4-b7e1-6161ee42fc48
65aa1435-eb72-4925-94ee-737c65c93089	ae6377a3-9809-4c57-887e-39b74f1ab9be
65aa1435-eb72-4925-94ee-737c65c93089	6b7be798-7d17-49fe-9184-a05dd95b129a
65aa1435-eb72-4925-94ee-737c65c93089	86ce729a-390c-445d-a60b-be12b139d434
e47d854c-12bf-42d7-b7ac-3a09def24036	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
4a02475d-1ae5-47ea-b83b-5fbafc13ace6	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
c709960d-4255-4db8-8348-98de6038789c	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
81224b77-7e5f-4ce9-9581-d861e9cd0ebd	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
3d82b5ba-65b3-47b5-a8ef-f2f99f78ee5b	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
020f3aa3-1eb3-4700-9b05-898c78f23fbf	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
842b2522-848f-4cec-b223-7a3cd3503b49	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
77bb1e7a-aa48-4e1c-a4c6-9eb7d2ddccff	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
ff7fe238-ae1f-4f31-8d90-aaa259e147f7	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
45680771-5407-4510-a5eb-8d08e7922847	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
89ae04e8-5830-401a-ad8f-ed9a561c9b06	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
42ecc68d-0fe0-43b8-9f3b-20d1e8a7b44c	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
99eb8e46-70eb-44c7-8578-02cd22ffa09b	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
0c3d8bd8-047d-460a-9280-b50b641ba02a	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
6133bf7e-4935-4fc3-89bf-7bab9a5babe2	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
3b2f46cb-5f15-46b4-9f3f-a290714dad8c	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
7535da06-2c06-4986-975f-ffd93d0390c2	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
bb2f0e61-7e0b-444e-a09b-c6756fa496ce	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
c11cc104-7d90-438d-9a55-2a02b6d59718	659c0a96-deb3-4ab4-9cc3-7a6e1f5274e7
aed2e846-2cb1-4c30-b7d9-7d63048bc322	4a9a5a8b-422f-4731-85db-f34cd55634b2
b459fe70-743f-4fe2-b9d5-6d1ee7b4b825	4a9a5a8b-422f-4731-85db-f34cd55634b2
1e4809f6-8326-4029-849f-065b6cbe6b09	4a9a5a8b-422f-4731-85db-f34cd55634b2
d9ddf0d7-1ac8-4834-8cfc-381bf7f468ef	4a9a5a8b-422f-4731-85db-f34cd55634b2
beaf38c1-e820-4f83-8eed-eeb1a607f9a8	4a9a5a8b-422f-4731-85db-f34cd55634b2
8a17f193-190e-4b7b-80f6-bdd686b244f4	4a9a5a8b-422f-4731-85db-f34cd55634b2
67197180-8ad8-43f6-8c8c-622982cc9aa6	4a9a5a8b-422f-4731-85db-f34cd55634b2
595574fd-93f7-49ac-989f-c79ff49cbd98	4a9a5a8b-422f-4731-85db-f34cd55634b2
478c5117-1e0b-4c87-9fc6-070767964046	4a9a5a8b-422f-4731-85db-f34cd55634b2
0cffcabb-0440-47d0-8e9e-2f7544ebc33f	4a9a5a8b-422f-4731-85db-f34cd55634b2
061af8a7-9bed-4fe8-afa6-bac04653faf5	4a9a5a8b-422f-4731-85db-f34cd55634b2
ca6dc41a-a6ec-4c41-ab6b-950bf681c711	4a9a5a8b-422f-4731-85db-f34cd55634b2
0ac59f32-04c1-43a3-883c-a4bf393a332f	4a9a5a8b-422f-4731-85db-f34cd55634b2
63003fd9-8db8-4a0c-8c2e-279951ea0224	4a9a5a8b-422f-4731-85db-f34cd55634b2
ff452031-aea2-4d24-9eb7-0129684b6dd8	4a9a5a8b-422f-4731-85db-f34cd55634b2
569f7a2b-7602-40ba-b13a-b1ee1141931f	4a9a5a8b-422f-4731-85db-f34cd55634b2
01745345-bde6-4563-bed0-454ee5a98a4f	4a9a5a8b-422f-4731-85db-f34cd55634b2
65aa1435-eb72-4925-94ee-737c65c93089	a33b3d95-bd48-4056-804c-20236917e169
65aa1435-eb72-4925-94ee-737c65c93089	094ab296-50ae-4871-8c56-df05dc1c7f14
65aa1435-eb72-4925-94ee-737c65c93089	1de09fb6-cc86-4db0-88e4-c0e3f31fa42f
65aa1435-eb72-4925-94ee-737c65c93089	0ca09762-e817-4e1d-aa47-d2f33fff3c66
65aa1435-eb72-4925-94ee-737c65c93089	8f77adc0-ee6f-4968-9aad-99f0ddfb8454
65aa1435-eb72-4925-94ee-737c65c93089	c55138b1-f10b-4bc5-8042-9da8e7e7f9fb
65aa1435-eb72-4925-94ee-737c65c93089	62333f60-9be1-4703-b80b-59ad49039485
65aa1435-eb72-4925-94ee-737c65c93089	9d37a8e6-1057-4d51-a8bc-b1fa894d5a43
65aa1435-eb72-4925-94ee-737c65c93089	75146597-f1ef-4cb6-9b8d-ae0d41d751e6
65aa1435-eb72-4925-94ee-737c65c93089	b7910098-86d5-426a-acfe-4660ef67b383
65aa1435-eb72-4925-94ee-737c65c93089	7db2f70f-8790-46e0-9c1f-bd5376a1411b
65aa1435-eb72-4925-94ee-737c65c93089	f1eaab0f-de5e-4084-a61d-3064d9c35b61
65aa1435-eb72-4925-94ee-737c65c93089	c3c6c636-1a60-4491-9feb-92959e1a3c6c
65aa1435-eb72-4925-94ee-737c65c93089	01550362-ec22-4b11-81d7-607eaf197b51
65aa1435-eb72-4925-94ee-737c65c93089	bc2824c9-0dcb-4f59-a67a-e7d0f5168f5c
65aa1435-eb72-4925-94ee-737c65c93089	809406ce-c1fc-47a8-9eed-3393a41ad9e5
65aa1435-eb72-4925-94ee-737c65c93089	1f09e5a2-94a8-4c5d-b0e5-3aa5fdeb6690
65aa1435-eb72-4925-94ee-737c65c93089	e0f3a790-bdec-4773-a6f8-74ff99974379
65aa1435-eb72-4925-94ee-737c65c93089	510e5ac0-a790-4c85-b9df-31834fe775e6
65aa1435-eb72-4925-94ee-737c65c93089	3085d08d-0bf2-4682-9ee6-8f45d86bbfc9
65aa1435-eb72-4925-94ee-737c65c93089	f738e3d2-d3a5-4eca-b9d2-95654d648536
65aa1435-eb72-4925-94ee-737c65c93089	ae31e892-465d-478e-b580-7c50c7bedd21
65aa1435-eb72-4925-94ee-737c65c93089	5fb5d325-8e17-4b62-9cfd-520f3aa6f586
65aa1435-eb72-4925-94ee-737c65c93089	b374dddc-4626-4d3e-b1bf-e445e2de1897
65aa1435-eb72-4925-94ee-737c65c93089	1693758e-4aaf-4b3c-9201-53dff25bb796
65aa1435-eb72-4925-94ee-737c65c93089	e31ebbb6-ada7-42d1-938b-57f196235347
65aa1435-eb72-4925-94ee-737c65c93089	8356010a-f011-4ad7-83b8-680e96d0311d
65aa1435-eb72-4925-94ee-737c65c93089	a7bc6f61-dc81-4b1f-9e4d-22f4fc6261c5
65aa1435-eb72-4925-94ee-737c65c93089	91db1cb1-5c5e-4480-83b1-ee0e064e7a2a
65aa1435-eb72-4925-94ee-737c65c93089	950150f9-b0a0-45be-b53e-510a70c018e5
65aa1435-eb72-4925-94ee-737c65c93089	03a8aef9-fc64-474b-9adc-90a4c1ff2d4c
65aa1435-eb72-4925-94ee-737c65c93089	cefaa241-12d7-431d-bc52-89a6fd17a2e6
65aa1435-eb72-4925-94ee-737c65c93089	53b07ec8-73d9-4ffd-8071-f9a73b20f330
65aa1435-eb72-4925-94ee-737c65c93089	94610168-c5a1-44f1-be05-bf7a09e98ab1
65aa1435-eb72-4925-94ee-737c65c93089	b50fceb3-d68f-45af-a95e-ef39768d7be0
65aa1435-eb72-4925-94ee-737c65c93089	6fa2fc79-3a21-4947-9ede-a850288e7764
65aa1435-eb72-4925-94ee-737c65c93089	c50a0b33-8455-4c81-816c-19aefba992d4
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
8f81c007-8bed-4f25-9009-2bbcb098c5f3	+
098636cc-5794-485f-ba91-8128deafe934	+
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	/*
e03a9c44-332a-48cd-8777-d544fd7d3feb	http://10.10.2.146:4200
e03a9c44-332a-48cd-8777-d544fd7d3feb	https://www.ecgvue.site
e03a9c44-332a-48cd-8777-d544fd7d3feb	http://localhost:4200
896090fe-19fb-4c95-906e-e8ad3063bb35	
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	http://10.10.2.146:4200
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	https://www.ecgvue.site
1c1db8b0-d806-4f7d-9f15-b0e2c61a9d91	http://localhost:4200
5a232f16-784b-45d3-8184-f5293fbea17e	+
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: bn_keycloak
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO bn_keycloak;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

