import requests
from datetime import datetime
import time

api_url = "http://127.0.0.1:8000/schedule-message/"  # Replace with the actual API endpoint

# List or dictionary containing information for each request
requests_data = [
    {"name": "ishika", "phone": "+8795885888", "message": "Hello, this is a test message send by my code! IGNOREEEEEEEE IT....", "scheduled_time" :"2023-11-22T10:44:00"},
    {"name": "claris", "phone": "+9188410565", "message": "Hello, this is a test message send by my code! IGNOREEEEEEEE IT....","scheduled_time" :"2023-11-22T10:44:00"},
     {"name": "glory", "phone": "+8861253184", "message": "Hello, this is a test message send by my code! IGNOREEEEEEEE IT....","scheduled_time" :"2023-11-22T10:44:00"},
    {"name": "siddharth", "phone": "+9304558728", "message": "Hello, this is a test message send by my code! IGNOREEEEEEEE IT....","scheduled_time" :"2023-11-22T10:44:00"},
    {"name": "adi", "phone": "+7899620153", "message": "Hello, this is a test message send by my code! IGNOREEEEEEEE IT....","scheduled_time" :"2023-11-22T10:44:00"},
    {"name": "maa", "phone": "+8601188880", "message": "Hello, this is a test message send by my code! IGNOREEEEEEEE IT....","scheduled_time" :"2023-11-22T10:44:00"},
    {"name": "papa", "phone": "+8601188881", "message": "Hello, this is a test message send by my code! IGNOREEEEEEEE IT....","scheduled_time" :"2023-11-22T10:44:00"},
    {"name": "ishank", "phone": "+7022260068", "message": "Hello, this is a test message send by my code! IGNOREEEEEEEE IT....","scheduled_time" :"2023-11-22T10:44:00"},
    # Add more entries as needed
]

def send_request(data):
    response = requests.post(api_url, json=data)
    print(f"Request sent for {data['name']}. Response: {response.text}")

def main():
    for request_data in requests_data:
        send_request(request_data)

if __name__ == "__main__":
    main()
