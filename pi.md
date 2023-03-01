
## Setup a Pi

Get software from: [https://www.raspberrypi.org/software/operating-systems/]

- add a button to turn off and on: <https://dronebotworkshop.com/pi-10-standby-switch/>

### Set up network connections

**Enable Wifi and Other Connections**  
* Use `sudo raspi-config` and go the location settings. Select your country
* the go the interface settings and enable I2C, SPI, SSH, etc
* To enable wifi edit the file in`/etc/wpa_supplicant/wpa_supplicant.conf` and add
    ```sh
    network = {
        ssid="network_name"
        psk="network_password"
    }
    ```
    - You can test the connection by `ping google.com`
    - [More info in here][https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md]
* You can use `ifconfig` and `hostname -I` to get the MAC and IP addresses of the raspberry pi

**Set up a Static IP Address for the raspberry pi**  
[Step 1] [https://www.ionos.com/digitalguide/server/configuration/provide-raspberry-pi-with-a-static-ip-address/#:~:text=To%20assign%20an%20IP%20address,with%20the%20IPv4%20address%20192.168.]  

[Step 2] [https://pimylifeup.com/raspberry-pi-static-ip-address/]  

**Change the Password, Username, and Hostname**  
[More instructions here][https://www.raspberrypi.org/documentation/linux/usage/users.md]  
* To change the password type: `sudo passwd pi` and follow intructions
* To change the hostname of the pi edit the following files
    - `sudo nano /etc/hosts` and in the last line change `raspberrypi` to your new hostname
    - `sudo nano /etc/hostname` and change the hostname to the new one
    - Now reboot for the changes to take effect
* To create a new user use the command `sudo adduser user` and follow instructions. You can leave all question empty
* To give the new user *root* privilages use the command `sudo adduser user sudo`
* More Commands:
    - to logout from an user: `exit`
    - to switch users: `su - user`
    - To delete an user, use the command ` sudo userdel -r user`


## RPi.GPIO Library

always import this library first
```py
import RPi.GPIO
```

```py
import RPi.GPIO as GPIO

# define your pins
LED = 16
BUTTON = 17

GPIO.setmode(GPIO.BOARD)        # need to see wwhat difference between BOARD and BCM is
GPIO.setmode(GPIO.BCM)
GPIO.setup(BUTTON, GPIO.IN)     # defines as input

# GPIO.setup(BUTTON, GPIO.IN, pull_up_down = GPIO.PUD_DOWN) 
GPIO.setup(LED, GPIO.OUT)       # defines as output

GPIO.output(LED, TRUE)          # outputs true. note: might be 
state = GPIO.input(BUTTON)      # variable with input

finally:
    GPIO.cleanup() 
```


