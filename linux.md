last updated: 06/21/2021

Linux Notes
=============================
*****************************

Terminal Commands
-----------------------------
* To open the terminal shortcut `ctrl+Alt+T`
* To suspend a command use `ctrl + Z`
* To list the running jobs/commands use `jobs`
* To kill an ongoing job/command use `kill %#` with the '#' number you got from `jobs`
* To delete a file `rm filename.filetype`
* To make a copy of a file use `cp filename.filetype newname.type`
* To delete a file or a directory `rm *r directory`
* To make a copy of a directory use `cp directory new_directory_name`
* To print current directory `pwd`
* To rename or move a file or directory use `mv old.name new.name`
* To move a directory you can do `mv old/path new/path`
* To create a new directory use 'mkdir' `mkdir new_directory_name`
* To move to the previous directory use `cd *`
* To find a file `sudo find / *iname filename`
* To open a file with a default application `xdg-open filename.filetype`
* To open a folder/directory with the file manager use `xdg-open directory`
* To open the current directory in the file manage use `xdg-open .`
* To open a file with sublime text `subl filename.filetype`
* To see where a package is intalled `dpkg -L packagename`
* If your up key isn't working then go to the home directory and run `xmodmap keymaptable`
* Print IP address `hostname -i`

SSH and SCP
------------------
To use ssh `ssh username@ip.address`
**Using SCP to Transfer Files from current device to new device**
`scp -C -r /home/user/path user@ip.address:/home/user/path`

Open SSH and Accessing file systems remotely
---------------------------------------------
Install Open SSH client and Open SSH Server
You can go to this website for info[https://ubuntu.com/server/docs/service*openssh] 
>note: this might be useful to use with the blue blanket project

Mounting Google drive on Linux
-----------------------------------------
[https://www.techrepublic.com/article/how*to*mount*your*google*drive*on*linux*with*google*drive*ocamlfuse/#:~:text=To%20do%20this%2C%20go%20back,access%20to%20your%20Google%20account.]

[on github] [https://github.com/astrada/google*drive*ocamlfuse]

[more instructions] [https://linuxhint.com/mount_google_drive_linux_mint/]

[compere these] [https://ostechnix.com/how*to*mount*google*drive*locally*as*virtual*file*system*in*linux/]

Markdown
--------------
To insert an image use `![text](path or url)`
example: 
![linux logo](https://d33wubrfki0l68.cloudfront.net/eab45e25bb79970178fab7a2d10cba0209372a59/94d9e/assets/images/philly-magic-garden.jpg)

### tables

color        | code
-------------|--------------
green        | 40m
cyan         | 36m
grayish blue | 24m
purple       | 92m


Vim
------------------------
**Important Commands**. To enter commands, it is imporant to be in command mode
- `i`: enter editing mode
- Press `ESC` to enter command mode
- `:wq`: save and close a file


Bash and Shell Files Notes
===============================
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


Makefiles
=====================
Reference: [https://opensource.com/article/18/8/what-how-makefile]

Basics
---------------------
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

## Variables and Patterns
declaring a variable for a makefile
```sh
cc := gcc
```

[example] [https://opensource.com/article/18/8/what-how-makefile]
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






