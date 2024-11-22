import random
import json
import time
import threading
from typing import List

import paho.mqtt.client as mqtt

broker = "127.0.0.1"
port = 1883

# Define a lock for stdout access
print_lock = threading.Lock()

# Define a callback function to handle successful publishing of data
def on_publish(client, userdata, mid):
    with print_lock:
        print(f"Data published with mid: {mid}")

# Define a function to publish data to MQTT broker with a given topic and payload
def publish_data(client, topic, payload, device_id, device_count):
    ret = client.publish(topic, payload, qos=2)
    with print_lock:
        if ret.rc != mqtt.MQTT_ERR_SUCCESS:
            print("Failed to publish data")
        else:
            print(f"Published data for Device {device_id} - Count: {device_count}")

# Define a function to generate random device IDs
def generate_device_ids(num_devices: int) -> List[str]:
    return [f"DEV_{random.randint(100000, 999999)}" for _ in range(num_devices)]

# Define a function to simulate device activity
def simulate_device_activity(device_ids: List[str], num_publishes: int, pri_org_ids: List[str], sub_org_ids: List[str]):
    client = mqtt.Client(client_id=f"publisher-{random.randint(1, 1000)}")  # Unique client ID
    client.on_publish = on_publish
    client.connect(broker, port)
    client.loop_start()

    device_count = {device_id: 0 for device_id in device_ids}
    devices_remaining = device_ids.copy()

    while devices_remaining:
        device_id = random.choice(devices_remaining)
        devices_remaining.remove(device_id)
        
        if device_count[device_id] < num_publishes:
            pri_org_id = random.choice(pri_org_ids)
            sub_org_id = random.choice(sub_org_ids)
            topic = f"/{pri_org_id}/{sub_org_id}/{device_id}"
            payload = json.dumps({
                "DeviceId": device_id,
                "Time": time.time(),
                "cpu_pct": "{:.2f}".format(random.random() * 100),
                "Battery": "{:.2f}".format(random.random() * 100),
                "SignalStrength": random.choice(["Strong", "Medium", "Weak", "VeryWeak", "NoSignal"]),
            })
            publish_data(client, topic, payload, device_id, device_count[device_id])
            device_count[device_id] += 1

    # Disconnect the client after all publishes finish
    client.disconnect()

# Generate random device IDs
device_ids = generate_device_ids(num_devices=10)  # Assuming 10 devices
num_pri_org_ids = 3  # Change as needed
num_sub_org_ids = 2  # Change as needed

pri_org_ids = [f"pri_org_{i}" for i in range(num_pri_org_ids)]
sub_org_ids = [f"sub_org_{i}" for i in range(num_sub_org_ids)]

# Simulate device activity with specified parameters
num_publishes_per_device = 5  # Change as needed

simulate_device_activity(device_ids=device_ids, num_publishes=num_publishes_per_device, pri_org_ids=pri_org_ids, sub_org_ids=sub_org_ids)
