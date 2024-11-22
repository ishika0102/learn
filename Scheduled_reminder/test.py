import os
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

# # Replace 'path/to/chromedriver' with the actual path to your ChromeDriver executable
# driver_path = '/home/ishika/Downloads/chromedriver_linux64/chromedriver'
# driver = webdriver.Chrome(executable_path=driver_path)


# Set the PATH environment variable to include the directory containing chromedriver
chrome_driver_path = '/home/ishika/Downloads/chromedriver_linux64/'
os.environ["PATH"] += os.pathsep + chrome_driver_path

driver = webdriver.Chrome()

def open_whatsapp_web():
    driver.get("https://web.whatsapp.com/")
    input("Scan the QR code, and press Enter when ready...")

def forward_message(contact, message):
    # Search for the contact
    search_box = driver.find_element("xpath", '//div[@contenteditable="true"][@data-tab="3"]')
    search_box.clear()
    search_box.send_keys(contact)
    time.sleep(2)  # Wait for search results to load

    # Click on the contact
    driver.find_element("xpath", f'//span[@title="{contact}"]').click()
    time.sleep(2)  # Wait for the chat to open

    # Forward the message
    message_box = driver.find_element("xpath", '//div[@contenteditable="true"][@data-tab="6"]')
    message_box.send_keys(message)
    message_box.send_keys(Keys.CONTROL, Keys.RETURN)
    time.sleep(2)  # Wait for the message to be sent

def main():
    open_whatsapp_web()

    contacts = ["9188410565", "9304558728", "8861253184"]  # Add your contact names here
    message_to_forward = "Hello, this is a test message send by my code! IGNOREEEEEEEE IT...."

    for contact in contacts:
        forward_message(contact, message_to_forward)

if __name__ == "__main__":
    main()






# import asyncio
# from fastapi import FastAPI, HTTPException, BackgroundTasks
# from pydantic import BaseModel
# import pywhatkit
# from datetime import datetime

# import uvicorn

# app = FastAPI()

# class Person(BaseModel):
#     name: str
#     phone: str
#     message: str
#     scheduled_time: datetime

# def send_scheduled_message(person: Person):
#     pywhatkit.sendwhatmsg(person.phone, person.message, person.scheduled_time.hour, person.scheduled_time.minute)

# @app.post("/schedule-message/")
# async def schedule_message(person: Person, background_tasks: BackgroundTasks):
#     try:
#         now = datetime.now()

#         if now >= person.scheduled_time:
#             raise HTTPException(status_code=400, detail="Scheduled time must be in the future.")

#         delay_seconds = (person.scheduled_time - now).total_seconds()  # calculate in seconds the time left before sending the msg

#         # Schedule the background task to send the message
#         background_tasks.add_task(send_scheduled_message, person)

#         return {"message": f"WhatsApp message scheduled for {person.scheduled_time} to {person.phone}. Scheduling done."}

#     except Exception as e:
#         # Handle any unexpected exceptions
#         return {"error": f"An error occurred: {str(e)}"}

# if __name__ == "__main__":
#     uvicorn.run(app, host="0.0.0.0", port=8000)




# errors
# import asyncio
# from fastapi import FastAPI, HTTPException
# from pydantic import BaseModel
# import pywhatkit
# from datetime import datetime

# import uvicorn

# app = FastAPI()
    
# class Person(BaseModel):
#     name: str
#     phone: str
#     message: str
#     scheduled_time: datetime

# @app.post("/schedule-message/")
# async def schedule_message(person: Person):
#     try:
#         now = datetime.now()

#         if now >= person.scheduled_time:
#             raise HTTPException(status_code=400, detail="Scheduled time must be in the future.")

#         delay_seconds = (person.scheduled_time - now).total_seconds() # calculate in sec the time left before sending the msg

        
#         # Makes sure that the delay occures before sending the whatsapp msg. later use celery for task schedulting logic instead of this line 
#         await asyncio.sleep(delay_seconds) 

#         # Send the scheduled message
#         pywhatkit.sendwhatmsg(person.phone, person.message, person.scheduled_time.hour, person.scheduled_time.minute) # sends the msg 
#         return {"message": f"WhatsApp message scheduled for {person.scheduled_time} to {person.phone}"}
    
#     except Exception as e:
#         # Handle any unexpected exceptions
#         return {"error": f"An error occurred: {str(e)}"} 
    
    
# if __name__ == "__main__":
#     uvicorn.run(app, host="0.0.0.0", port=8000)
    
    
    
    
    
    
    
# import pywhatkit
# from datetime import datetime, timedelta
# import time

# # Dynamic list of persons with their phone numbers, message, and scheduled time
# persons = [
#     {"name": "Person 1", "phone": "+8795885888", "message": "Hello Person 1!", "scheduled_time": "2023-11-21 14:45:00"},
#     {"name": "Person 2", "phone": "+9876543210", "message": "Hi Person 2!", "scheduled_time": "2023-12-02 15:30:00"},
#     # Add more persons as needed
# ]

# def send_scheduled_messages():
#     now = datetime.now()
#     for person in persons:
#         scheduled_time = datetime.strptime(person["scheduled_time"], "%Y-%m-%d %H:%M:%S")
#         if now >= scheduled_time:
#             pywhatkit.sendwhatmsg(person["phone"], person["message"], now.hour, now.minute + 1)
#             print(f"WhatsApp message sent to {person['phone']} at {now}")
#         else:
#             # Calculate the delay in seconds
#             delay_seconds = (scheduled_time - now).total_seconds()
#             time.sleep(delay_seconds)
#             pywhatkit.sendwhatmsg(person["phone"], person["message"], scheduled_time.hour, scheduled_time.minute)
#             print(f"WhatsApp message sent to {person['phone']} at {scheduled_time}")

# if __name__ == "__main__":
#     send_scheduled_messages()