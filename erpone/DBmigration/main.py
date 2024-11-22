import pymysql
import pymongo
import json
from datetime import datetime

# Load the schema mapping from the JSON file
with open('mapping.json', 'r') as file:
    schema_mapping = json.load(file)

# MySQL connection setup
mysql_conn = pymysql.connect(host='localhost',
                             user='root',
                             password='password',
                             db='erponedata')
mysql_cursor = mysql_conn.cursor(pymysql.cursors.DictCursor)

# MongoDB connection setup
mongo_client = pymongo.MongoClient("mongodb://localhost:27017/")
mongo_db = mongo_client["erponetest"]


# Function to handle type conversion
def convert_type(value, field_type):
    if field_type == "int":
        return int(value) if value is not None else None
    elif field_type == "string":
        return str(value) if value is not None else None
    elif field_type == "boolean":
        return bool(value) if value is not None else None
    elif field_type == "float":
        return float(value) if value is not None else None
    elif field_type == "datetime":
        if isinstance(value, datetime):
            return value
        return datetime.strptime(
            value, '%Y-%m-%d %H:%M:%S') if value is not None else None
    return value


def migrate_table(table_name, mapping):
    mysql_table = mapping["mysql_table"]
    mongodb_collection = mongo_db[mapping["mongodb_collection"]]

    # Fetch all data from the main MySQL table
    mysql_cursor.execute(f"SELECT * FROM {mysql_table}")
    records = mysql_cursor.fetchall()

    for record in records:
        mongo_document = {}

        # Map fields from MySQL to MongoDB according to the mapping schema
        for mysql_field, field_info in mapping["fields"].items():
            mongo_field = field_info["mongo_field"]
            field_type = field_info["type"]
            mongo_document[mongo_field] = convert_type(record[mysql_field],
                                                       field_type)

        # Handle additional fields
        if "additional_fields" in mapping:
            for additional_field, additional_info in mapping[
                    "additional_fields"].items():
                if "value" in additional_info:
                    mongo_document[additional_field] = additional_info["value"]
                elif "mysql_table" in additional_info and "foreign_key" in additional_info and "reference_field" in additional_info:
                    # Extract necessary information
                    reference_table = additional_info["mysql_table"]
                    foreign_key = additional_info["foreign_key"]
                    reference_field = additional_info["reference_field"]

                    # Fetch the foreign key value from the record
                    foreign_key_value = record.get(foreign_key)
                    if foreign_key_value is not None:
                        # Query to fetch the related category name
                        sql_query = f"SELECT {reference_field} FROM {reference_table} WHERE id = %s"
                        mysql_cursor.execute(sql_query, (foreign_key_value, ))
                        related_record = mysql_cursor.fetchone()

                        if related_record:
                            mongo_document[additional_field] = related_record[
                                reference_field]
                        else:
                            print(
                                f"No record found in {reference_table} for {foreign_key_value}"
                            )
                    else:
                        print(f"Foreign key {foreign_key} not found in record")
                else:
                    print(
                        f"Invalid configuration for additional field {additional_field}"
                    )

        # Handle embedded documents as object (not array)
        if "embedded" in mapping:
            for embed_key, embed_info in mapping["embedded"].items():
                embed_mysql_table = embed_info["mysql_table"]
                embed_mongo_field = embed_info["mongo_field"]

                # Fetch data from the embedded MySQL table
                mysql_cursor.execute(f"SELECT * FROM {embed_mysql_table}")
                embed_record = mysql_cursor.fetchone(
                )  # Get only the first embedded document

                if embed_record:
                    embed_document = {}
                    for embed_mysql_field, embed_field_info in embed_info[
                            "fields"].items():
                        embed_mongo_field_inner = embed_field_info[
                            "mongo_field"]
                        embed_field_type = embed_field_info["type"]
                        embed_document[embed_mongo_field_inner] = convert_type(
                            embed_record[embed_mysql_field], embed_field_type)

                    # Embed as an object (not an array)
                    mongo_document[embed_mongo_field] = embed_document

        # Insert the constructed MongoDB document
        mongodb_collection.insert_one(mongo_document)


# def migrate_table(table_name, mapping):
#     mysql_table = mapping["mysql_table"]
#     mongodb_collection = mongo_db[mapping["mongodb_collection"]]

#     # Fetch all data from the main MySQL table
#     mysql_cursor.execute(f"SELECT * FROM {mysql_table}")
#     records = mysql_cursor.fetchall()

#     for record in records:
#         mongo_document = {}

#         # Map fields from MySQL to MongoDB according to the mapping schema
#         for mysql_field, field_info in mapping["fields"].items():
#             mongo_field = field_info["mongo_field"]
#             field_type = field_info["type"]

#             # Check if the field is hardcoded
#             if "value" in field_info:
#                 mongo_document[mongo_field] = field_info[
#                     "value"]  # Hardcoded value
#             elif "mysql_query" in field_info:
#                 # Execute additional query to fetch the parent from MySQL
#                 parent_id = record[
#                     mysql_field]  # Assuming the parent_id is in the current record
#                 query = field_info["mysql_query"].format(parent_id=parent_id)
#                 mysql_cursor.execute(query)
#                 parent_record = mysql_cursor.fetchone()
#                 if parent_record:
#                     mongo_document[mongo_field] = parent_record[0]
#             else:
#                 mongo_document[mongo_field] = convert_type(
#                     record[mysql_field], field_type)

#         # Handle embedded documents as object (not array)
#         if "embedded" in mapping:
#             for embed_key, embed_info in mapping["embedded"].items():
#                 embed_mysql_table = embed_info["mysql_table"]
#                 embed_mongo_field = embed_info["mongo_field"]

#                 # Fetch data from the embedded MySQL table
#                 mysql_cursor.execute(f"SELECT * FROM {embed_mysql_table}")
#                 embed_record = mysql_cursor.fetchone(
#                 )  # Get only the first embedded document

#                 if embed_record:
#                     embed_document = {}
#                     for embed_mysql_field, embed_field_info in embed_info[
#                             "fields"].items():
#                         embed_mongo_field_inner = embed_field_info[
#                             "mongo_field"]
#                         embed_field_type = embed_field_info["type"]
#                         embed_document[embed_mongo_field_inner] = convert_type(
#                             embed_record[embed_mysql_field], embed_field_type)

#                     # Embed as an object (not an array)
#                     mongo_document[embed_mongo_field] = embed_document

#         # Insert the constructed MongoDB document
#         mongodb_collection.insert_one(mongo_document)

# def migrate_table(table_name, mapping):
#     mysql_table = mapping["mysql_table"]
#     mongodb_collection = mongo_db[mapping["mongodb_collection"]]

#     # Fetch all data from the main MySQL table
#     mysql_cursor.execute(f"SELECT * FROM {mysql_table}")
#     records = mysql_cursor.fetchall()

#     for record in records:
#         mongo_document = {}

#         # Map fields from MySQL to MongoDB according to the mapping schema
#         for mysql_field, field_info in mapping["fields"].items():
#             mongo_field = field_info["mongo_field"]
#             field_type = field_info["type"]
#             mongo_document[mongo_field] = convert_type(record[mysql_field],
#                                                        field_type)

#         # Handle embedded documents as object (not array)
#         if "embedded" in mapping:
#             for embed_key, embed_info in mapping["embedded"].items():
#                 embed_mysql_table = embed_info["mysql_table"]
#                 embed_mongo_field = embed_info["mongo_field"]

#                 # Fetch data from the embedded MySQL table
#                 mysql_cursor.execute(f"SELECT * FROM {embed_mysql_table}")
#                 embed_record = mysql_cursor.fetchone(
#                 )  # Get only the first embedded document

#                 if embed_record:
#                     embed_document = {}
#                     for embed_mysql_field, embed_field_info in embed_info[
#                             "fields"].items():
#                         embed_mongo_field_inner = embed_field_info[
#                             "mongo_field"]
#                         embed_field_type = embed_field_info["type"]
#                         embed_document[embed_mongo_field_inner] = convert_type(
#                             embed_record[embed_mysql_field], embed_field_type)

#                     # Embed as an object (not an array)
#                     mongo_document[embed_mongo_field] = embed_document

#         # Insert the constructed MongoDB document
#         mongodb_collection.insert_one(mongo_document)

# Loop through each table in the schema mapping and migrate
for table, mapping in schema_mapping.items():
    migrate_table(table, mapping)

# Close connections
mysql_cursor.close()
mysql_conn.close()
mongo_client.close()
