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

----------------------------------------------------------

## Linux

### Terminal Commands
- To open the terminal shortcut `ctrl+Alt+T`
- To suspend a command use `ctrl + Z`
- To list the running jobs/commands use `jobs`
- To kill an ongoing job/command use `kill %#` with the '#' number you got from `jobs`
- To delete a file `rm filename.filetype`
- To make a copy of a file use `cp filename.filetype newname.type`
- To delete a file or a directory `rm *r directory`
- To make a copy of a directory use `cp directory new_directory_name`
- To print current directory `pwd`
- To rename or move a file or directory use `mv old.name new.name`
- To move a directory you can do `mv old/path new/path`
- To create a new directory use 'mkdir' `mkdir new_directory_name`
- To move to the previous directory use `cd *`
- To find a file `sudo find / *iname filename`
- To open a file with a default application `xdg-open filename.filetype`
- To open a folder/directory with the file manager use `xdg-open directory`
- To open the current directory in the file manage use `xdg-open .`
- To open a file with sublime text `subl filename.filetype`
- To see where a package is intalled `dpkg -L packagename`
- If your up key isn't working then go to the home directory and run `xmodmap keymaptable`
- Print IP address `hostname -i`

### SSH and SCP
To use ssh `ssh username@ip.address`
**Using SCP to Transfer Files from current device to new device**
`scp -C -r /home/user/path user@ip.address:/home/user/path`

**Open SSH and Accessing file systems remotely**
Install Open SSH client and Open SSH Server
You can go to this website for info[https://ubuntu.com/server/docs/service*openssh] 

----------------------------------------------------------

## Shell Files and Makefiles

the extension of a Shell script is .sh
the script should always start with: `#!/bin/sh`

it looks like most terminal commands work with shell. it can be run using:`bash filename.sh`
```sh
#!/bin/sh
# the line above can be used
# these are comments 

# any command will work
ls 
pwd 

# to print something use 'echo'
echo "Hello Cesar, the Shell file is running"

# to read input use read
read name # the input will be stored in name

# variables
variable = "hello"
# print variable
echo $variable
```
there is more to learn about shell files and what you can do with them.

[more examples here] [https://stackabuse.com/how-to-write-a-makefile-automating-python-setup-compilation-and-testing/]


## Makefiles
[Reference:](https://opensource.com/article/18/8/what-how-makefile)

### Basics
Use makefiles to build/compile projects. the name of the makefile is always 'Makefile'. example file below:
```sh
say_hello: # target
  @echo "Hello World" #recipe 
  # use '@' at the beginning of the recipe to supress the command
```
Parts of a Makefile:
- Target: works like a function or declaring a function
- Prerequisites/Dependencies: 
- Recipe: The recipe use prerequisites to make a target
an example with multiple targets and prerequisites. examples:

```sh
# the prerequisites below are anther sub target 'sub_target' and a source c file
fina_target: sub_target final_target.c # our final target
  recipe_to_create_final_target

sub_target: sub_target.c
  recipe_to_create_sub_target
```
Multiple Targets: with mutliple targets, the first target will be assigned as the default target and it will be the only one executed.
```sh
say_hello: # default target
  @echo "Hello World"

generate: 
  @echo "Creating empty text files"
  touch file-{1..10}.txt

clean:
  @echo "Cleaning up.."
  rm *.txt
```
the output of the makefile above will only be: "Hello World"
to set the default target use
```sh
.DEFAULT_GOAL := target_name
```

Now let's run multiple targets. use 'all' as the default target and call as sub target as you want
```sh
all: say_hello generate # call sub targets say_hello and 

say_hello:
  @echo "Hello World"

generate:
  @echo "Creating empty text files..."
  @touch file-{1..10}.txt

clean:
  @echo "Cleaning up..."
  rm *.txt

.PHONY: all say_hello generate clean
```

### Variables and Patterns
declaring a variable for a makefile
```sh
cc := gcc
```

[example](https://opensource.com/article/18/8/what-how-makefile)
```sh
# Usage:
# make        # compile all binary
# make clean  # remove ALL binaries and objects

.PHONY = all clean

CC = gcc                        # compiler to use

LINKERFLAG = -lm

SRCS := foo.c
BINS := foo

all: foo

foo: foo.o
  @echo "Checking.."
   gcc -lm foo.o -o foo

foo.o: foo.c
  @echo "Creating object.."
  gcc -c foo.c

clean:
  @echo "Cleaning up..."
  rm -rvf foo.o foo
```
another use of a variable can be used to group multiple things together for example:
```sh
# variables
cc := gcc
objects := main.o kbd.o command.o display.o insert.o search.o files.o utils.o

# the target 'edit' will execute all the other targets
edit : $(objects)
  cc -o $(objects)
```



