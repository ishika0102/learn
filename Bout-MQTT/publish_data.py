

# NOTE: below code sends data continuously with a delay but not parallely
import random
import json
import time

import paho.mqtt.client as mqtt

broker = "127.0.0.1"
port = 1883

# Define a callback function to handle successful publishing of data
def on_publish(client, userdata, mid):
    print(f"Data published with mid: {mid}")

# Define a function to publish data to MQTT broker with a given topic and payload
def publish_data(client, topic, payload):
    ret = client.publish(topic, payload,qos=2)
    if ret.rc != 0:
        print("Failed to publish data")
    else:
        print(f"Published data to topic: {topic}")

# Define a function to generate random device IDs
def generate_device_ids(num_devices: int):
    return [f"DEV_{random.randint(100000, 999999)}" for _ in range(num_devices)]

# Define a function to simulate device activity
def simulate_device_activity(device_ids, num_pri_org_ids, num_sub_org_ids, publishes_per_device):
    client = mqtt.Client("publisher-test.py")
    client.on_publish = on_publish
    client.connect(broker, port)
    client.loop_start()

    pri_org_ids = [f"pri_org_{i}" for i in range(num_pri_org_ids)]
    sub_org_ids = [f"sub_org_{i}" for i in range(num_sub_org_ids)]

    for device_id in device_ids:
        for _ in range(publishes_per_device):   
            pri_org_id = random.choice(pri_org_ids)
            sub_org_id = random.choice(sub_org_ids)
            topic = f"/bout/{pri_org_id}/{sub_org_id}/{device_id}"
            payload = json.dumps({
                "DeviceId": device_id,
                "Time": time.time(),
                "cpu_pct": "{:.2f}".format(random.random() * 100),
                "Battery": "{:.2f}".format(random.random() * 100),
                "SignalStrength": random.choice(["Strong", "Medium", "Weak", "VeryWeak", "NoSignal"]),
            })
            publish_data(client, topic, payload)
            time.sleep(0.1)  # Adjust the delay as needed

# Generate random device IDs
device_ids = generate_device_ids(num_devices=10000)

# Simulate device activity with specified parameters
simulate_device_activity(device_ids=device_ids, num_pri_org_ids=1, num_sub_org_ids=1, publishes_per_device=5)



