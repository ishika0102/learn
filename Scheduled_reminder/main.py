
from ctypes import Union
from re import fullmatch
import time
from fastapi import FastAPI, HTTPException, BackgroundTasks
from pydantic import BaseModel
import pywhatkit
from datetime import datetime

import core , log , exceptions

# from message_scheduler import Person

import uvicorn

app = FastAPI()

# message_scheduler = Person()


class Person(BaseModel):
    name: str
    phone: str
    message: str
    scheduled_time: datetime
    
def sendwhatmsg(
        phone_no: str,
        # message: Union[list, str],
        message : str,
        time_hour: int,
        time_min: int,
        wait_time: int = 15,
        tab_close: bool = False,
        close_time: int = 3,
) -> None:
    """Send a WhatsApp Message at a Certain Time"""
    if not core.check_number(number=phone_no):
        raise exceptions.CountryCodeException("Country Code Missing in Phone Number!")

    # phone_no = phone_no.replace(" ", "")
    # if not fullmatch(r'^\+?[0-9]{2,4}\s?[0-9]{9,15}', phone_no):
    #     raise exceptions.InvalidPhoneNumber("Invalid Phone Number.")

    if time_hour not in range(25) or time_min not in range(60):
        raise Warning("Invalid Time Format!")

    current_time = time.localtime()
    left_time = datetime.strptime(
        f"{time_hour}:{time_min}:0", "%H:%M:%S"
    ) - datetime.strptime(
        f"{current_time.tm_hour}:{current_time.tm_min}:{current_time.tm_sec}",
        "%H:%M:%S",
    )

    if left_time.seconds < wait_time:
        raise exceptions.CallTimeException(
            "Call Time must be Greater than Wait Time as WhatsApp Web takes some Time to Load!"
        )

    sleep_time = left_time.seconds - wait_time
    print(
        f"In {sleep_time} Seconds WhatsApp will open and after {wait_time} Seconds Message will be Delivered!"
    )
    time.sleep(sleep_time)
    if isinstance(message, list):
        core.send_message_list(message=message, receiver=phone_no, wait_time=wait_time)
    else:
        core.send_message(message=message, receiver=phone_no, wait_time=wait_time)
        log.log_message(_time=current_time, receiver=phone_no, message=message)

    if tab_close:
        core.close_tab(wait_time=close_time)
        
        
        
        
        

# def send_scheduled_message(person: Person):
#     pywhatkit.sendwhatmsg(person.phone, person.message, person.scheduled_time.hour, person.scheduled_time.minute)
    
    
@app.post("/schedule-message/")
async def schedule_message(person: Person, background_tasks: BackgroundTasks):
    try:
        now = datetime.now()

        if now >= person.scheduled_time:
            raise HTTPException(status_code=400, detail="Scheduled time must be in the future.")

        delay_seconds = (person.scheduled_time - now).total_seconds()  # calculate in seconds the time left before sending the msg

        # Schedule the background task to send the message
        background_tasks.add_task(sendwhatmsg, person.phone, person.message, person.scheduled_time.hour, person.scheduled_time.minute)

        return {"message": f"WhatsApp message scheduled for {person.scheduled_time} to {person.phone}. Scheduling done."}

    except Exception as e:
        # Handle any unexpected exceptions
        return {"error": f"An error occurred: {str(e)}"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
