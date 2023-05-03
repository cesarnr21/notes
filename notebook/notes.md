# NOTES

# Networking

## Send data between python and javascript
- reference: <https://www.geeksforgeeks.org/how-to-communicate-json-data-between-python-and-node-js/>


## IPv4 vs IPv6
- reference: <https://www.juniper.net/documentation/us/en/software/junos/interfaces-security-devices/topics/topic-map/security-interface-ipv4-ipv6-protocol.html>

### IPv4
There are 32-bit numbers. two primary parts, the network prefix and the host number. All hosts within a single network share the same network address. 

### IPv6
These addresses consits of 128 bits.

## Unix Sockets
- python sockets: <https://zetcode.com/python/socket/>
- javascript socket: <https://zetcode.com/javascript/socket/>

A **socket** is an endpoint ofg a communication between two programs running on a network

TCP/IP (Transmission Control Protocol/Internet Protocol). Used by HTTP, SMTP, FTP, UDP.
There are address families for sockets. When creating a socket, you have to specify its address family, abnd only use addresses of that type that socket

- **AF_UNIX, AF_LOCAL**: Local communication
- **AF_INET**: IPv4 Internet protocols
- **AF_INET6**: IPv6 Internet protocols
- **AF_IPX - IPX**: Novell protocols
- **AF_BLUETOOTH**: Wireless bluetooth protocols
- **AF_PACKET**: Low level packet interface

## VLAN and WLAN
**Virtual Local Area Network (VLAN):** 

**Wireless Local Area Network (WLAN):**

- UDP
- FTP
- STMP

----------------------------------------------------------

Places to buy parts:
- Mouser
- Digikey
- Jameco electronic
- Amazon

[Circuit Simulator](https://www.falstad.com/circuit/)
>note: figure out how to download that and run it offline

[another circuit simulator option](https://alternativeto.net/software/qucs/about/])

### Embedded Systems course
[Utexas](http://users.ece.utexas.edu/~valvano/Volume1/E-Book/)


## Basic eletronics and Low level software & Embedded Software

- transistor types
- amplifiers
- go over circuits and analog electronics notes 
- crystal oscillator
- debouncing switches
- watchdog timer
- voltage dividers
- ADC and DAC
- Mutex and Semaphores
- zener diodes


**RTOS**
- synchronizing between taks using semaphores and interrupts
- 


### Transistor types

- transistor types
- amplifiers
- go over circuits and analog electronics notes 


### bit manipilation

Operation     | code
--------------|--------------
AND           | &
OR            | |
XOR           | ^
NOT           | ~
Shift Left    | <<
Shift Right   | >>

### registers and shift registers
**registers** are made up of flip flops: `a flip flop can store a single bit of data`. do to store a n-nit word, you will use an n-bit register with n represening the number of flip flops.

### Integrated Circuits
**Timers** 
*example: 555 timer*

**Occillators**

**Multiplexers**

(consult emebedded II class notes for others)


### Pull-Up and Pull-Down Resistors
<https://www.electronics-tutorials.ws/logic/pull-up-resistor.html>

These resistors are used to set the inputs of digital gates when there is no input condition.

**Pull-up Resistors** will connect the inputs to a postive voltage(maybe 5V). A resistor is needed because when the input is low, a short circuit can occur and result in high levels of current. Usually pull-up have resistance between 1k and 10kΩ. `Good starting point 4.7kΩ`

**Pull-down resistors** on the other hand connect inputs to ground. 

### Capacitor Uses
**Bypass capacitors** used to short AC signals to ground so that DC signals are cleaner and have less AC rippling  

**Decoupling Capacitors** are used to isolate AC signals



## Communication Protocols


### UART: Universal Asynchronous Receiver-Trasmitter

### I2C: Inter-Integrate Circuit

### SPI: Serial Peripheral Interface

### CAN: Controller Area Network




