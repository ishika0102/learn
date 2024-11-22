from pymongo import MongoClient, InsertOne, ASCENDING
from datetime import datetime
import time
import multiprocessing
import pymongo.errors
import random
import string
import datetime
from datetime import timezone
import datetime as dt_ns
 
def generate_random_string(length):
    letters = string.ascii_letters
    return ''.join(random.choice(letters) for _ in range(length))
# Function to generate documents
def generate_documents(start, end):
    documents = []
    for i in range(start, end):
        document = {
            # Add other fields as needed
            "TimeStamp": datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            "SequenceNumber": i,
            "DeviceId": "DEV_" +str(time.time_ns()),
            "DeviceName": generate_random_string(6),
            "DeviceStatus": random.choice(["enable", "disable"]),
            "DeviceModelName": generate_random_string(8),
            "BelongToPriOrgId": random.choice(["ORG_800283","ORG_326409","ORG_855323","ORG_579092","ORG_150992"]),
            "BelongToSubOrgId": random.choice(["ORG_552136","ORG_113417","ORG_299467","ORG_810755","ORG_107709"]),
            "GroupId": random.choice(["GRP_810755","GRP_107709","GRP_299467","GRP_113417","GRP_552136"]),                                                                           
            "PolicyId":random.choice(["POL_810755","POL_107709","POL_299467","POL_113417","POL_552136"]),                                                                           
            "NonCompilant": random.choice([True, False]),
            "Battery": random.randint(0, 100),
            "SignalStrength": random.choice(["Strong", "Medium", "Weak", "VeryWeak", "NoSignal"]),
            "AuditDetails": {
                "CreatedOn" : datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                "CreatedBy" : random.choice(["USR_800283","USR_326409","USR_855323","USR_579092","USR_150992"]),
                "ModifiedOn" : datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                "ModifiedBy" : random.choice(["USR_800283","USR_326409","USR_855323","USR_579092","USR_150992"]),
            },
            "NetworkType": random.choice(["4G","3G","Wi-Fi"]),
        }
        documents.append(document)
    return documents
 
# Function to insert documents into MongoDB
def insert_documents(start, end):
    client = MongoClient("mongodb://localhost:27017/")
    db = client["data_dump"]
    collection = db["test_collection_one"]
 
    # Create indexes for the unique fields
    collection.create_index([("DeviceId", ASCENDING)], unique=True)
    collection.create_index([("SequenceNumber", ASCENDING)], unique=True)
    
 
    documents = generate_documents(start, end)
    requests = [InsertOne(doc) for doc in documents]
    
    try:
        collection.bulk_write(requests)
    except pymongo.errors.BulkWriteError as e:
        for error in e.details['writeErrors']:
            if error['code'] == 11000:  # Duplicate key error
                print(f"Skipping document with duplicate key: {error['errmsg']}")
            else:
                raise  # Re-raise other errors
 
if __name__ == "__main__":
    start_time = time.time()
 
    num_docs = 15
    batch_size = 5  # Adjust the batch size as needed for performance
 
    # Calculate the number of batches and start/end indices for multiprocessing
    num_batches = num_docs // batch_size
    start_indices = [i * batch_size for i in range(num_batches)]
    end_indices = [(i + 1) * batch_size for i in range(num_batches)]
    end_indices[-1] = num_docs  # Adjust the end index of the last batch
 
    # Create and start multiprocessing pool
    pool = multiprocessing.Pool()
    pool.starmap(insert_documents, zip(start_indices, end_indices))
    pool.close()
    pool.join()
 
    end_time = time.time()
    print(f"Inserted {num_docs} documents in {end_time - start_time:.2f} seconds")
 