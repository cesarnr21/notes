
# Server for laptop


install the following software:
```bash
sudo apt-get install mosquitto mosquitto-clients curl git openssh-server
```

- website: .io

-----------------------------------

# MQTT Server

a video on MQTT: <https://www.youtube.com/watch?v=4UIUC1YU_Sk> and 
essentials here: <https://www.hivemq.com/mqtt-essentials/>

MQTT stands for message queque telemetry transport. It is based on TCP/IP (Transmission Control Protocol/Internet Protocol) communications, so the broker and clients need to have a TCP/IP stack
- **Broker** is the server that distributes the information.
    - it is message queque, so it does not store the messages
    - sends the message to the topic subscribers

- **Client** is a device that connects to the broker

- the **publish/subscribe** model decouples the client that sends the message from the others. the clients in the network are not aware of each other, as the broker is what handles all the connections and messanging

- **Quality of Service (QoS) Level** is the agreement that defines the guaranmtee of delivery for a specific message. There are 3 levels:
    - QoS 0: is the minimal level, and there is no quarantee of delivery. the recipient does not acknowledge that it received the message, and the message is not stored and re-transmitted by the sender.
        - Use this level when you have a mostly stable connection, and it is not a big issue if some messanges are lost, and messages are sent at short interval. There is no need for message queuing
    
    - QoS 1: guarantees the message is delivered at least one time to the receiver.
        - Here the sender will store the message until it receives a `PUBACK` packet from the receiver and a receipt that it received the message
        - The sender uses the packet identifier to match with the `PUBLISH` packet.
        - if the sender does not receive a `PUBACK` packet within a reasonable amount of time, it will resend the publish packet.
        > note: if the sender resends a packege, it sets a DUP (duplicate flag) as True.

        - use QoS 1 when you need to get every message and you can handle duplicates. the one used most frequently. also this level is much faster than QoS 2

    - QoS 2: This is the highest and safes level, but also slowest. There t least two requests/responses (4 parts) between the sender and the receiver.
        1. the receiver gets a PUBLISH packet from the receiver and proccess it.
        2. Then the receiver sends `PUBREC` packet that aknowldeges the PUBLISH packet. if the sender does not a PUBREC packet, it resends the PUBLISH packet with a duplicate flag.
        3. Once the sender gets a PUBREC packet, it sends a `PUBREL` packet 
        4. after the receiver gets the PUBREL packetm it can discard all stored states and answer with a `PUBCOMP` packet
            - until the receiver sends the PUBCOMP packet, it keeps a reference of the original publish packet to make sure they aren't any duplicates.
        5. When the flow is complete, both parties know that the packagge has been delivered.

        - Use this level when it is critical to receive a message exactly once. There is overhead here and the interctions take more time to complete.

    - Using different levels of QoS.
        - The QoS levels of the messanges are determine by the client. So when a client sends a message to the broker, the clients sets the QoS. But also, if the broker where to deliver that message to other clients, the broker uses the QoS set by the receiving clients at the moment of subscription.

- **Queuing Messages** can be done if using QoS levels 1 and 2. If the client has a **persistent session** then the broker can stored messages for client while they are offline.


### Topics
Topics are what the messages are about
- clients can **publish** or subscribe to a topic. Also, a device can unsubcribe from a topic to stop receiving messages
- There are topic levels, separated by a slash, these work like file paths. `top_level_topic/second_level`

## Messages
- payload: the content of the message, can be in any datatype
- topic: the path to send the message
- server: the MQTT Server IP address
- client: the device that sent the message

### MQTT CONNET MESSAGE
This message is used to initiate a connection from a client to the broker.
- **ClientID** identifies each client. the ID should be unique per client and broker
- **Clean Session** is a flag that tells the broker whteter the client wants to establish a persistent session or not. In a persistent session, the broker stores all subsciptions for the client and all missed messages for the client t

-----------------------------------

# WebSocket
- WebSocket vs MQTT

-----------------------------------

# Other
- add password to server
- Zigbee2MQTT
- DNS vs NAS
- communications between devices
- VPN for travelling. example from reddit: `There are different types of VPNs. The type he's talking about is running a VPN server at home, so that you can tunnel into it while traveling. This encrypts your traffic while you're on public networks, decrypts it back at home, and it goes out to the internet from there.`
    - create a vpn server: <https://www.bennettbytes.io/linux/2016-12-07-create-a-vpn-server/>
    - more: <https://www.bennettbytes.io/linux/2015-05-09-create-your-own-personal-cloud-server/>
- learn some security
- home automation
- GNS3
- pi hole
- run a 3D printer
- mail and sms server/communications
- uses for virtual machines
- run programs/jobs and let you know if they are finished
- security cameras
- spotify everyday song recommendation
- Git repo: <https://github.com/awesome-selfhosted/awesome-selfhosted>

**More Notes:**
- from reddit: `Don't pull the battery, for starters. In an unlikely event of power loss, it can mean your data being rescued - just set up a script that polls power status and turns itself off if power loss is detected. Think of it like a built-in UPS.
Otherwise, yes, you can use it as a server - albeit it depends on the scenarios you want to run. I used an old HP EliteBook as a server for some time, replaced the CD drive with a 2.5" HDD bracket, and used a flash drive for OS root (so that the HDDs could go to sleep when not needed).`

- use [OpenVSCode Server](https://github.com/gitpod-io/openvscode-server).

### Task Scheduler
This simple script will let you hand them in by scheduling your tasks at a specific time or a specific date. let's say you want to run some Python functions every Tuesday then this script will do this for you.

It's a complete handy script for those who want to execute programs to function on specific DateTime.

```py
# Python Task Schedular
# pip install scheduler
from scheduler import Scheduler
import scheduler.trigger as trigger
import datetime as date


# Function to be executed
def func():
    print("Do Something Here...")


sch = Scheduler()

# Run in Cycles
sch.cyclic(func, date.timedelta(minutes=3))

# Run after Minutes
sch.minutely(func, date.timedelta(seconds=3))

# Run after hour
sch.hourly(func, date.timedelta(minutes=3))

# Run after day
sch.daily(func, date.timedelta(hours=3))

# Run after week
sch.weekly(func, date.timedelta(days=3))

# Run after month
sch.monthly(func, date.timedelta(weeks=3))

# Run only Once
sch.once(func, date.datetime(year=2022, month=7, day=23, minute=25))
```

-----------------------------------

# SQL Database
To access the SQL user use `mysql -u  root`

