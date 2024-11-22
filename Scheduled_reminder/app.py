import asyncio
from datetime import datetime
import uuid
from bson import ObjectId
from fastapi import BackgroundTasks, FastAPI, Form, HTTPException
from pydantic import BaseModel
from pymongo import MongoClient
import uvicorn


app = FastAPI()

# Connect to MongoDB
uri = "mongodb+srv://ishika:asiddfg98hj87kl@cluster0.u3ipuxe.mongodb.net/your_database?retryWrites=true&w=majority"
client = MongoClient(uri)
database = client['Reminder_DB']
collection = database['Reminder_collection']


class Reminder(BaseModel):
    user_id : str
    name: str
    channel: str
    recipient: str
    message: str
    scheduled_time: datetime
    status: str = "Pending"
    
    
# Pydantic model for request payload
class UpdateReminderRequest(BaseModel):
    reminder_id: str
    name: str = None
    channel: str = None
    schedule_time: datetime = None
    status: str = None
    recipient: str = None
    
    


# api to schedule a rerminder and create entry in database
@app.post("/scheduled-message/")
async def schedule_reminder(reminder: Reminder):
    try:
        now = datetime.now()

        if now >= reminder.scheduled_time:
            return {"message": "Scheduled time must be in the future."}
            # raise HTTPException(status_code=400, detail="Scheduled time must be in the future.")

        # reminder_data = reminder.model_dict()
        # reminder_data = dict(reminder)
        # Generate a unique reminder_id using uuid
        reminder_id = str(uuid.uuid4())

        # Add the generated reminder_id to the reminder object
        reminder_dict = reminder.dict()
        reminder_dict["reminder_id"] = reminder_id

        # Add the reminder to the database
        result = collection.insert_one(reminder_dict )
        print(f"Inserted document with user_id: {result.inserted_id}")

        return {"message": f"Reminder scheduled for {reminder.name} at {reminder.scheduled_time} via {reminder.channel} and schedule id { reminder_dict['reminder_id'] }. Scheduling done."}

    except Exception as e:
        # Handle any unexpected exceptions
        return {"error": f"An error occurred: {str(e)}"}
 
 # API endpoint for retrieving a reminder by ID
@app.get("/get-reminder")
async def get_reminder(reminder_id: str = Form(...)):
    # Retrieve the document from MongoDB
    reminder = collection.find_one({'reminder_id': reminder_id})
    

    # Check if the reminder_id exists
    if reminder is None:
        raise HTTPException(status_code=404, detail=f"Reminder with id {reminder_id} not found.")

     # Convert ObjectId to string for serialization
    reminder['_id'] = str(reminder['_id'])
    
    # Return the reminder document
    return reminder


# API endpoint for deleting a reminder by ID
@app.delete("/delete-reminder/")
async def delete_reminder(reminder_id: str = Form(...)):
    # Delete the document from MongoDB
    result = collection.delete_one({'reminder_id': reminder_id})

    # Check if the reminder_id exists
    if result.deleted_count == 0:
        raise HTTPException(status_code=404, detail=f"Reminder with id {reminder_id} not found.")

    # Return the result
    return {"deleted_count": result.deleted_count}
 
 # API endpoint for updating reminders
@app.put("/update-reminder")
async def update_reminder(request: UpdateReminderRequest):
    # Ensure that at least one field is provided for update
    updated_fields = {}
    for k, v in request.model_dump().items():
        if v is not None:
            updated_fields[k] = v

    if not updated_fields:
        raise HTTPException(status_code=400, detail="At least one field for update must be provided.")

    # Update the document in MongoDB
    result = collection.update_one({'reminder_id': request.reminder_id}, {'$set': updated_fields})

    # Check if the reminder_id exists
    if result.matched_count == 0:
        raise HTTPException(status_code=404, detail=f"Reminder with id {request.reminder_id} not found.")

    # Return the result
    return {"matched_count": result.matched_count, "modified_count": result.modified_count}




























# FastAPI Background Task to Process Reminders
def process_reminders(background_tasks: BackgroundTasks):
    current_time = datetime.utcnow()

    # Find reminders with scheduled_time in the past
    reminders = collection.find({"scheduled_time": {"$lte": current_time}})
    import pdb; pdb.set_trace()
    for reminder in reminders:
        # Background task to process reminders asynchronously
        background_tasks.add_task(send_message, reminder)
        
   

# Function to send message based on channel
def send_message(reminder: dict):
    channel = reminder["channel"]
    recipient = reminder["recipient"]
    message = reminder["message"]

    if channel == "sms":
        send_sms(recipient, message)
    elif channel == "whatsapp":
        send_whatsapp_message(recipient, message)
    elif channel == "email":
        print("inside send_message email channel")
        send_email(recipient, message)
    # Add more channels as needed

# Function to send SMS
def send_sms(recipient: str, message: str):
    # Implement SMS sending logic
    print(f"Sending SMS to {recipient}: {message}")

# Function to send WhatsApp message
def send_whatsapp_message(recipient: str, message: str):
    # Implement WhatsApp message sending logic
    print(f"Sending WhatsApp message to {recipient}: {message}")

# Function to send Email
def send_email(recipient: str, message: str):
    
    # Implement email sending logic
    print(f"Sending Email to {recipient}: {message}")

# Lifespan event handler for startup
def startup_event():
    import asyncio
    loop = asyncio.get_event_loop()
    
    loop.create_task(schedule_reminder_processing())

# Schedule the background task to run every minute (adjust as needed)
async def schedule_reminder_processing():
    while True:
        # Schedule the background task to run every minute
        await asyncio.sleep(60) # ERROR : asyncio.exceptions.CancelledError
        # Execute the background task to process reminders
        process_reminders(BackgroundTasks())




# Add the lifespan event handler for startup
app.add_event_handler("startup", startup_event)


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000, log_level="info", lifespan="on")





























# #  reference

# # Schedule the background task to run every minute (adjust as needed)
# @app.on_event("startup")
# async def startup_event():
#     loop = asyncio.get_event_loop()
#     loop.create_task(schedule_reminder_processing())

# async def schedule_reminder_processing():
#     while True:
#         # Schedule the background task to run every minute
#         await asyncio.sleep(60)
#         # Get current time
#         current_time = datetime.utcnow()
#         # Find reminders with scheduled_time in the past
#         reminders = collection.find({"scheduled_time": {"$lte": current_time}, "status": "pending"})

#         for reminder in reminders:
#             # Update the status to "processing" to avoid duplicate processing
#             collection.update_one({"user_id": reminder["user_id"]}, {"$set": {"status": "processing"}})
#             # Execute the background task to process reminders
#             process_reminders(reminder)
#             # Update the status to "processed"
#             collection.update_one({"user_id": reminder["user_id"]}, {"$set": {"status": "processed"}})
# import asyncio
# from fastapi import FastAPI, BackgroundTasks
# from datetime import datetime, timedelta
# from pymongo import MongoClient
# import httpx

# app = FastAPI()

# # # MongoDB Connection
# # uri = "mongodb+srv://ishika:asiddfg98hj87kl@cluster0.u3ipuxe.mongodb.net/your_database?retryWrites=true&w=majority"
# # mongo_client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true })
# # db = mongo_client["your_database"]
# # collection = db["communication_requests"]  # Assuming you named your collection 'communication_requests'

# # Function to process reminders
# def process_reminders(reminder):
#     # Your reminder processing logic goes here
#     call_api(reminder["channel"], reminder["receiver"], reminder["message"])

# # Function to make API call
# async def call_api(channel: str, receiver: str, message: str):
#     # Your API call logic goes here
#     print(f"Sending {channel} to {receiver}: {message}")

# @app.post("/schedule-message/")
# async def schedule_message(reminder: Reminder, background_tasks: BackgroundTasks):
#     try:
#         now = datetime.now()

#         if now >= reminder.scheduled_time:
#             raise HTTPException(status_code=400, detail="Scheduled time must be in the future.")

#         delay_seconds = (reminder.scheduled_time - now).total_seconds()  # calculate in seconds the time left before sending the msg

#         # Schedule the background task to send the message
#         background_tasks.add_task(sendwhatmsg, reminder.phone, reminder.message, reminder.scheduled_time.hour, reminder.scheduled_time.minute)

#         return {"message": f"WhatsApp message scheduled for {reminder.scheduled_time} to {reminder.phone}. Scheduling done."}

#     except Exception as e:
#         # Handle any unexpected exceptions
#         return {"error": f"An error occurred: {str(e)}"}
    
    
# if __name__ == "__main__":
#     import uvicorn
#     uvicorn.run(app, host="127.0.0.1", port=8000)




# # import asyncio
# # from fastapi import FastAPI, BackgroundTasks
# # from datetime import datetime, timedelta
# # from pymongo import MongoClient
# # import httpx
# # from pymongo.mongo_client import MongoClient

# # app = FastAPI()

# # uri = "mongodb+srv://ishika:asiddfg98hj87kl@cluster0.u3ipuxe.mongodb.net/?retryWrites=true&w=majority"

# # # Create a new client and connect to the server
# # mongo_client = MongoClient(uri)

# # # Send a ping to confirm a successful connection
# # try:
# #     mongo_client.admin.command('ping')
# #     print("Pinged your deployment. You successfully connected to MongoDB!")
# # except Exception as e:
# #     print(e)

# # # # MongoDB Connection
# # # mongo_client = MongoClient("mongodb://localhost:27017/")
# # db = mongo_client["your_database"]
# # collection = db["reminders"]

# # # FastAPI Background Task to Process Reminders
# # def process_reminders(background_tasks: BackgroundTasks):
# #     current_time = datetime.utcnow()

# #     # Find reminders with scheduled_time in the past
# #     reminders = collection.find({"scheduled_time": {"$lte": current_time}})

# #     for reminder in reminders:
# #         # Background task to process reminders asynchronously
# #         background_tasks.add_task(call_api, reminder["api_url"], reminder["payload"])

# # # Function to make API call
# # async def call_api(api_url: str, payload: dict):
# #     async with httpx.AsyncClient() as client:
# #         # Modify headers, authentication, etc., as needed
# #         response = await client.post(api_url, json=payload)
# #         # Handle the API response, logging, error handling, etc.
# #         print(response.text)

# # # Schedule the background task to run every minute (adjust as needed)
# # @app.on_event("startup")
# # async def startup_event():
# #     import asyncio
# #     loop = asyncio.get_event_loop()
# #     loop.create_task(schedule_reminder_processing())

# # async def schedule_reminder_processing():
# #     while True:
# #         # Schedule the background task to run every minute
# #         await asyncio.sleep(60)
# #         # Execute the background task to process reminders
# #         process_reminders(BackgroundTasks())

# # if __name__ == "__main__":
# #     import uvicorn
# #     uvicorn.run(app, host="127.0.0.1", port=8000)
