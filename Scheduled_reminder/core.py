from os import system
import os
from pipes import quote
import time
from turtle import width

from webbrowser import open

from pyautogui import Size, hotkey, moveTo, press, size, typewrite , click
from pyscreeze import locateOnScreen

WIDTH, HEIGHT = size()


def check_number(number: str) -> bool:
    """Checks the Number to see if contains the Country Code"""

    return "+" in number or "_" in number


def close_tab(wait_time: int = 2) -> None:
    """Closes the Currently Opened Browser Tab"""

    time.sleep(wait_time)
    _system = system().lower()
    if _system in ("windows", "linux"):
        hotkey("ctrl", "w")
    elif _system == "darwin":
        hotkey("command", "w")
    else:
        raise Warning(f"{_system} not supported!")
    press("enter")
    
 
def _web(receiver: str, message: str) -> None:
    """Opens WhatsApp Web based on the Receiver"""
    if check_number(number=receiver):
        open(
            "https://web.whatsapp.com/send?phone="
            + receiver
            + "&text="
            + quote(message)
        )
    else:
        open("https://web.whatsapp.com/accept?code=" + receiver)
 


def findtextbox() -> None:
    """click on text box"""
    dir_path = os.path.dirname(os.path.realpath(__file__))
    location = locateOnScreen(f"{dir_path}/data/pywhatkit_smile1.png")
#     location = locateOnScreen(f"/home/ishika/Desktop/TeleCallerAssistant/pywhatkit_smile1.png")
    try:
        moveTo(location[0] + 150, location[1] + 5)
        click()
    except Exception:
        location = locateOnScreen(f"{dir_path}/data/pywhatkit_smile.png")
        # location = locateOnScreen(f"/home/ishika/Desktop/TeleCallerAssistant/pywhatkit_smile.png")
        moveTo(location[0] + 150, location[1] + 5)
        click()

    
def send_message(message: str, receiver: str, wait_time: int) -> None:
    """Parses and Sends the Message"""

    _web(receiver=receiver, message=message)
    time.sleep(7)
    click(WIDTH / 2, HEIGHT / 2 + 15)
    time.sleep(wait_time - 7)
    if not check_number(number=receiver):
        index = 0
        length = len(message)
        while index < length:
            letter = message[index]
            if letter == ":":    
                typewrite(letter)
                index += 1
                while index < length:
                    letter = message[index]
                    if letter == ":":
                        press("enter")
                        break
                    typewrite(letter)
                    index += 1
            elif letter == "\n":
                hotkey("shift", "enter")
            else:
                typewrite(letter)
            index += 1
        press("enter")
        
    findtextbox()
    press("enter")


def send_message_list(message: list, receiver: str, wait_time: int) -> None:
    """Parse and send multiple messages to a number"""

    _web(receiver=receiver, message='')
    time.sleep(7)
    click(WIDTH / 2, HEIGHT / 2 + 15)
    time.sleep(wait_time - 7)
    for msg in message:
        typewrite(msg)
        press("enter")
