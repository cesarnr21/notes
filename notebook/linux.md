
# Using Linux
* [Using Linux](#using-linux)
  * [Terminal Commands](#terminal-commands)
    * [Expand Commands](#expand-commands)
  * [Other Utilities](#other-utilities)
      * [dpkg](#dpkg)
    * [find and locate](#find-and-locate)
    * [SSH and SCP](#ssh-and-scp)
    * [VNC Server](#vnc-server)
      * [Usage](#usage)
      * [Establish Secure Connection Using SSH](#establish-secure-connection-using-ssh)
  * [Vim](#vim)
    * [Useful Commands](#useful-commands)
      * [Visual Modes](#visual-modes)
      * [Find and Replace](#find-and-replace)
        * [quickest way](#quickest-way)
        * [advanced](#advanced)
    * [Configuring Vim](#configuring-vim)
  * [Bash and Shell](#bash-and-shell)
    * [Create Executable Files](#create-executable-files)
    * [Source vs execting bash scripts](#source-vs-execting-bash-scripts)
  * [Cron Jobs](#cron-jobs)
    * [Systax/Commands](#systaxcommands)
* [Linux Notes](#linux-notes)
  * [Users and User groups](#users-and-user-groups)
  * [Daemons and Services](#daemons-and-services)

## Terminal Commands
* To open the terminal shortcut `CTRL` + `ALT` + `T`
* To suspend a command use `CTRL` + `Z`
* to kill command use `CTRL` + `C`
* To reverse search and search previous commands: `CTRL` + `R` 
    - To cycle throught the commands, keep using `CTRL` + `R` 
* To clear terminal line `CTRL` + `U` and use `CTRL` to `Y` to paste
* To list the running jobs/commands use `jobs`
* To kill an ongoing job/command use `kill %#` with the '#' number you got from `jobs`
* To delete a file `rm filename.filetype`
* To make a copy of a file use `cp filename.filetype newname.type`
* To delete a file or a directory `rm -r directory`
* To make a copy of a directory use `cp directory new_directory_name`
* To print current directory `pwd`
* To rename or move a file or directory use `mv old_name new_name`
* To move a directory you can do `mv old/path new/path`
* To create a new directory use 'mkdir' `mkdir new_directory_name`
* To move to the previous directory use `cd -`

* To open a file with a default application `xdg-open filename.filetype`
* To open a folder/directory with the file manager use `xdg
* open directory`
* To open the current directory in the file manage use `xdg-open .`
* Print IP addressess `hostname -I`

### Expand Commands
- save command output to file: 
    ```sh
    $ [ command ] > [ filename ]
    ```
    creates file and if it already exits overwrites it. To append instead of overwriting, use `>>`

- output to terminal and also save to file, use `tee` syntax:
    ```sh
    $ [ command ] | tee [ file_name1 file_name2 ]
    ```
    - option `-a` to append
    - to discard terminal output: 
    ```sh
    $ [ command ] | tee [ file_name ] >/dev/null
    ```
    - to save output to file owned by root, use `sudo` before `tee`
    ```sh
    $ [ command ] | sudo tee [ file_name1 ]
    ```

## Other Utilities
- `grep`
- `systemctl`
- `wget`
- `curl`
- `ldconfig` and how it's used for building and linking 

#### dpkg
- To see where a package is intalled `dpkg -L [ package_name ]`
- To install a package in a `.deb`  file, use `sudo dpkg -i [ file_path/file.deb ]`

### find and locate
**find syntax:**
```sh
$ find [ start_dir ] [ options ] [ search term ]
```
- **star dir** can be either
    - `/` for whole system
    - `.` for current
    - `~` for home
- To find a file by name in current `find . -name filename` (case sensitive)
  - not case sensitive: `find . -iname filename`
- to remove files, use `-delete` option at the end
**locate sysntax: `locate [ option ] filename`**
`locate` is faster than `find` but will scan the entire file system
can use `locate -c filename` to count all instances

### SSH and SCP
delete fingerprint from `known_hosts`
```
ssh-keygen -R [ ip_address ]
```

> How is ssh secure and how do the private and public keys work?


### VNC Server
**[setup instructions](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-20-04)** for TightVNC server

#### Usage
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

#### Establish Secure Connection Using SSH
examples command:
```
$ ssh -L 5900:localhost:5900 -C -N -l USER [ ip_address ] -v
```

Then, on Mac open **Screen Sharing** and connect to: `vnc://localhost:5900`
> Linux and Windows alternatives?


## Vim
### Useful Commands
To enter commands, it is imporant to be in command mode
* Press `ESC` to enter **command mode**
* `i` or `a`: enter **editing mode**. `a` to append
* `:q` close file
* `:wq`: save and close a file
* `:q!` close and discard changes
* `y` to copy and `p` to paste
* `d` or `x` to cut and `p` to paste
* `delete` to just delete
* `u` to undo changes
* `CRTL` + `r` to reapply changes
* To search use `/[ word ]` and then either `n` or `N` to keep searching for the next instance of the pattern
* To go to line use `:[ line# ]`. example to go line 124, use: `:124`
    - Or `[ line# ]G`. example to go line 124, use: `124G`
* To move foward use `w` and to move backward use `b`

#### Visual Modes
* `v` to enter **visual mode**. be able to select multiple lines of text.
    - `SHIFT` + `v` to enter visual line (selects entire lines/rows)
    - `CTRL` + `v` to enter visual block (selects rows and columns independently)
* To **comment multiple lines**, enter visual block and select all lines, then `SHIFT` + `i` to enter insert mode, add `#` from the first line, then `ESC` and after a moment, the change will take place.
    - To uncomment, select the `#` and the spaces colums, then just delete.
* To **indent multiple lines**, enter visual block, select lines, then insert mode with `SHIFT` + `i`, add indentation, then `ESC`.

#### Find and Replace
##### quickest way
1. search for word using `/[ word ]`
2. type in `cgn` which will delete the searched word, and enter `insert mode`, replace with `[new word]`
3. then `esc` and keep navigating through the searched word, using `n`/`N`.
    - pressing `.` will automatically replace the current searched word with the `[new word]`

##### advanced
syntax: `:s/[ search_word ]/[ replacement ]/[ options ]`
* to replace all occurances in one line use `g` option
    `:s/[ search_word ]/[ replacement ]/g`
* entire file: `:%s/[ search_word ]/[ replacement ]/g`
* within lines: `:[start_line][end_lind]s/[ search_word ]/[ replacement ]/g`

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
```bash
#!/bin/bash

OS="$(uname)"

if [ $OS == "Darwin" ]; then
    printf "OS = $OS, this is a macos sytem \n"
elif [ $OS == "Linux" ]; then
    printf "OS = $OS, tis is a linux system \n"
fi
```

```bash
# get location of script

DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# or 
DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
```

there is more to learn about shell files and what you can do with them.

**[More examples here](https://stackabuse.com/how-to-write-a-makefile-automating-python-setup-compilation-and-testing/)**

### Create Executable Files
what does this entail, difference between `bash file.sh` and `./file.sh`?
**<https://stackoverflow.com/questions/27494758/how-do-i-make-a-python-script-executable>**

- to make a file an executetable: `sudo chmod +x [ file_name ]`
- to remove executetable profile from file: `sudo chmod -x [ file_name ]`

### Source vs execting bash scripts
<https://superuser.com/questions/176783/what-is-the-difference-between-executing-a-bash-script-vs-sourcing-it>

## Cron Jobs
nice overview: <https://serverfault.com/questions/449651/why-is-my-crontab-not-working-and-how-can-i-troubleshoot-it?newreg=fbdb96de785143f1a1ca0290d42c4e4e>
- **cron** is the daemon that executed schedule commands
    check service status with:
    ```sh
    $ sudo systemctl status cron.service
    ```
- **crontab** is the program used to modify the user's contrab file
- **crontab file** is user specific and contains the intruction for **cron**

### Systax/Commands
Cron jobs are saved as crontab files: to use do `crontab -[ option ]`

- `-a [ file_name ]` creates a new crontab file
- `-e` edit crontab file and creates it if it doesn't exits
- `-l` shows the crontab file
- `-r` deletes the crontab file
- `-v` shows the last time the file was edited

once inside the crontab file the systax goes like:
```sh
[ minute ] [ hour ] [ day ] [ month ] [ weekday ] command
```

the symbol `*` in any of the timing fields stands for any. to write a cron job to be executed every minute, do:
```sh
* * * * * [ commands]

# could look like this
* * * * * /bin/bash /full/path/script.sh >> /path/log.out
```

To help with timing setup, use this website: **<https://crontab.guru/>**

> **Keep in Mind**
> Cron does not load `.bashrc` so it may be useful to source if the scripts require env variables set there

# Linux Notes
## Users and User groups

## Daemons and Services


