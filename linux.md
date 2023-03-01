
# Linux Notes

## Terminal Commands
- To open the terminal shortcut `CTRL` + `ALT` + `T`
- To suspend a command use `CTRL` + `Z`
- to kill command use `CTRL` + `C`
- To list the running jobs/commands use `jobs`
- To kill an ongoing job/command use `kill %#` with the '#' number you got from `jobs`
- To delete a file `rm filename.filetype`
- To make a copy of a file use `cp filename.filetype newname.type`
- To delete a file or a directory `rm -r directory`
- To make a copy of a directory use `cp directory new_directory_name`
- To print current directory `pwd`
- To rename or move a file or directory use `mv old_name new_name`
- To move a directory you can do `mv old/path new/path`
- To create a new directory use 'mkdir' `mkdir new_directory_name`
- To move to the previous directory use `cd -`

- To open a file with a default application `xdg-open filename.filetype`
- To open a folder/directory with the file manager use `xdg-open directory`
- To open the current directory in the file manage use `xdg-open .`
- To open a file with sublime text `subl filename.filetype`
- To see where a package is intalled `dpkg -L packagename`
- Print IP addressess `hostname -I`

### Learn more about
- `grep`
- `systemctl`

### find and locate
**find syntax: `find <start_dir> <options> <search term>`**
- **star dir** can be either
    - `/` for whole system
    - `.` for current
    - `~` for home
- To find a file by name in current `find . -name filename` (case sensitive)
  - not case sensitive: `find . -iname filename`

**locate sysntax: `locate <option> filename`**
`locate` is faster than `find` but will scan the entire file system
can use `locate -c filename` to count all instances

## SSH and SCP

To use ssh `ssh username@ip.address`

Also, for computers in the same network:
```sh
$ ssh host_name.local       # or host_name.lan
```

if this doesn't work, then:
```sh
$ sudo apt-get install avahi-daemon avahi-discover avahi-utils libnss-mdns mdns-scan
$ sudo systemctl restart avahi-daemon
$ sudo systemctl enable avahi-daemon
```
**Using SCP to Transfer Files from current device to new device**
```sh
$ scp -C -r /home/user/path user@ip.address:/home/user/path
```


## VNC Server
**[setup instructions](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-20-04)** for TightVNC server

### Usage
- To create a new 'X' VNC Desktop
    ```sh
    $ vncserver
    ```
- To kill use 
    ```sh
    $ vncservr -kill :2.
    ```
- To check status use:
    ``` sh
    $ sudo systemctl status vncserver@2
    ```

connect directly using `vnc://remote_ip_address:port`

### Establish Secure Connection Using SSH
examples command:
```
$ ssh -L 5900:localhost:5900 -C -N -l USER <ip_address> -v
```

Then, on Mac open **Screen Sharing** and connect to: `vnc://localhost:5900`
> Linux and Windows alternatives?


## Vim
### Useful Commands
To enter commands, it is imporant to be in command mode
- Press `ESC` to enter **command mode**
- `i` or `a`: enter **editing mode**. `a` to append
- `:q` close file
- `:wq`: save and close a file
- `:q!` close and discard changes
- `y` to copy and `p` to paste
- `d` or `x` to cut and `p` to paste
- `delete` to just delete
- `u` to undo changes
- `CRTL` + `r` to reapply changes
- To search use `/<word>` and then either `n` or `N` to keep searching for the next instance of the pattern
- To move foward use `w` and to move backward use `b`

#### Visual Modes
- `v` to enter **visual mode**. be able to select multiple lines of text.
    - `SHIFT` + `v` to enter visual line (selects entire lines/rows)
    - `CTRL` + `v` to enter visual block (selects rows and columns independently)
- To **comment multiple lines**, enter visual block and select all lines, then `SHIFT` + `i` to enter insert mode, add `#` from the first line, then `ESC` and after a moment, the change will take place.
    - To uncomment, select the `#` and the spaces colums, then just delete.
- To **indent multiple lines**, enter visual block, select lines, then insert mode with `SHIFT` + `i`, add indentation, then `ESC`.

### Configuring Vim
Edits file in `~/.vimrc`
```vim
syntax on

" edits by cesar
" use spaces instead of tabs
set expandtab

" set 1 tab to 4 spaces
set shiftwidth=4
set tabstop=4

" show line number
set number
set numberwidth=2

" save file with priviliges
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
```

## Bash and Shell
the script should always start with: `#!/bin/sh`

can be run using:`bash filename.sh` or they can be made executables, using `$ sudo chmod +x file_name.sh` and then ran using `./file_name.sh`
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

example script
```sh
#!/bin/bash

OS="$(uname)"

if [ $OS == "Darwin" ]; then
    printf "OS = $OS, this is a macos sytem \n"
elif [ $OS == "Linux" ]; then
    printf "OS = $OS, tis is a linux system \n"
fi
```

there is more to learn about shell files and what you can do with them.

**[More examples here](https://stackabuse.com/how-to-write-a-makefile-automating-python-setup-compilation-and-testing/)**

### Create Executable Files
what does this entail, difference between `bash file.sh` and `./file.sh`?
**<https://stackoverflow.com/questions/27494758/how-do-i-make-a-python-script-executable>**

- to make a file an executetable: `sudo chmod +x <file_name>`
- to remove executetable profile from file: `sudo chmod -x <file_name>`

## Cron Jobs
These are used on Linux/Mac? to schedule tasks
check status with:
```sh
$ sudo systemctl status cron.service
```

### Systax/Commands
Cron jobs are saved as crontab files: to use do `crontab -<option>`

- `-a <file_name>` creates a new crontab file
- `-e` edit crontab file and creates it if it doesn't exits
- `-l` shows the crontab file
- `-r` deletes the crontab file
- `-v` shows the last time the file was edited

once inside the crontab file the systax goes like:
```sh
<minute> <hour> <day> <month> <weekday> command
```

the symbol `*` in any of the timing fields stands for any. to write a cron job to be executed every minute, do:
```sh
* * * * * /path/python3 /full/path/script.py >> /home/cesar/tmp/c-job/log.out

# or for bash
* * * * * /bin/bash /full/path/script.sh >> /path/log.out
```

To help with timing setup, use this website: **<https://crontab.guru/>**

> **Keep in Mind**
> Cron does not load `.bashrc` so it may be useful to source if the scripts require env variables set there


## Make & Makefiles

**Reference: <https://opensource.com/article/18/8/what-how-makefile>**

Use makefiles to build/compile projects. 
Parts of a Makefile:
- **Target:** works like a function or declaring a function
- **Prerequisites/Dependencies:** 
- **Recipe:** The recipe use prerequisites to make a target
an example with multiple targets and prerequisites.

  ```makefile
  # the prerequisites below are anther sub target 'sub_target' and a source c file
  fina_target: sub_target final_target.c # our final target
    recipe_to_create_final_target

  sub_target: sub_target.c
    recipe_to_create_sub_target
  ```
**Multiple Targets:** with mutliple targets, the first target will be assigned as the default target and it will be the only one executed.
```makefile
say_hello: # default target
  @echo "Hello World"

generate: 
  @echo "Creating empty text files"
  touch file-{1..10}.txt

clean:
  @echo "Cleaning up.."
  rm *.txt
```
the output of the makefile above will only be: `Hello World`
to set the default target use
```sh
.DEFAULT_GOAL := target_name
```

Now let's run multiple targets. use `all` as the default target and call as sub target as you want
```makefile
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
```makefile
cc := gcc
```

[example](https://opensource.com/article/18/8/what-how-makefile)
```makefile
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
```makefile
# variables
cc := gcc
objects := main.o kbd.o command.o display.o insert.o search.o files.o utils.o

# the target 'edit' will execute all the other targets
edit : $(objects)
  cc -o $(objects)
```


## CMake
**difference between Make and CMake?**  
CMake is higher level than make, and can actually be used to generate Makefiles. It is used more for cross-platform applications. Makefiles for Linux will often not work on MacOS and will not work on Windows, whereas CMake can be used to generated platform specfic Makefiles

