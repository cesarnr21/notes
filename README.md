# Notes

#### some utilities
> To generate tables, use these: **[Markdown Table Generator](https://www.tablesgenerator.com/markdown_tables)** and **[HTML Table Generator](https://www.tablesgenerator.com/html_tables)**

> to write comments in markdown that won't render: `[//]: # (commet: simple graphic)`

> markdown supports LaTex for math equations, for a later generator: **<https://editor.codecogs.com/>**
> use single `$` for inline math equations and dual `$$` for math blocks, or also specify `math` syntax. use `\\` for new lines within blocks

## Contents

-----------------------------


## TO DO
- [ ] write a script to scan for files for contents and paste them up there.
    - something like the [markdown formattter](https://github.com/cesarnr21/vault/blob/main/vault/mkdwn.py) you wrote for individual files but for the entire repository
- [ ] start using git pre-commit hooks, to stop compiled jupyter cells from being uploaded to repo
- [ ] go throught and this and fill in any blanks: **[teach yourself computer science](https://teachyourselfcs.com/#networking)**
- [ ] add this game to javascritp folder: <https://play.elevatorsaga.com/>

#### New skills
**tiktok: <https://www.tiktok.com/@frankniu/video/7202811273690598661?_r=1&_t=8aBbxNXFOaU>**

- building complex python applications: <https://www.cosmicpython.com/>
    - free: <https://www.cosmicpython.com/book/preface.html>
    - github repo: <https://github.com/cosmicpython/book>
- tech inteview handbook: <https://www.techinterviewhandbook.org/>
- system design primer: <https://github.com/donnemartin/system-design-primer>
- the amazon star method: <https://www.amazon.jobs/es/landing_pages/in-person-interview>
- these problems: <https://cses.fi/problemset/>
- [Facebook coding challenges](https://www.facebookrecruiting.com/portal/coding_puzzles)
- Machine Learning Specialization Coursera repo: <https://github.com/greyhatguy007/Machine-Learning-Specialization-Coursera>
    - more: <https://github.com/SkalskiP/courses>
- Linux Programming. <https://digital.com/best-website-builders/linux/>
    - intro to linux: <https://support.ceci-hpc.be/doc/_contents/QuickStart/Linux/IntroLinux.html>
    - more: <https://www.reddit.com/r/learnmachinelearning/comments/11tfztk/alternatives_to_andrew_ngs_machine_learning/?utm_source=share&utm_medium=ios_app&utm_name=iossmf>
- Build Linux From Scratch: <https://www.linuxfromscratch.org/>
- go throught these: **[most popular FAANG Interview Questions](https://docs.google.com/spreadsheets/d/1hzP8j7matoUiJ15N-RhsL5Dmig8_E3aP/edit#gid=1377915986)**
- missing semester of cs class
    - [CLI (should be pretty quick)](https://missing.csail.mit.edu/2020/command-line/)
    - [Potpourri (Linux stuff, daemons, APIs, etc)](https://missing.csail.mit.edu/2020/potpourri/)
    - [metaprogramming](https://missing.csail.mit.edu/2020/metaprogramming/)
    - [Security](https://missing.csail.mit.edu/2020/security/)
- dynamic programming
    - look for `dynamic programming project based learning`
    - <https://medium.com/javarevisited/6-best-dynamic-programming-courses-for-coding-interviews-14744060923c>

- Data ETL (Extract, Transform, Load)

#### C++
- **namespaces** 
- **C++ Template Functions and Classes**
- what is a memory leak
- c++: <https://www.learncpp.com/>
- what is a buffer?
- Pointers in C and C++
- [Function Overriding](https://www.programiz.com/cpp-programming/function-overriding)
- Begin using Cmake and make

#### Software Development
- full git breakdown
- Conda Enviroments
- cmake and make
- PySDR (for signals proccessing)
- Developer roadmap
- data strucutes: array, linked list, tress, stacks, queque, graphs, hash maps (these are also found on the developer roadmap) and abstract syntax trees
- algorithms (might also be on the developer roadmap): search, sort, graphs traversals, dynamic programming, greddy algorithms3

#### Other Resources
- project based learning repo: <https://github.com/practical-tutorials/project-based-learning>
- some free course from MIT: <https://ocw.mit.edu/>


-------------------------------------------------------------------


# Stuff to get into
- Explore creating your own API
- Look into controlling a raspberry pi/linux boards throught wifi network, example, RACHEL PI
- TCP/IP Communications
- Unix Sockets vs IP Sockets: 
```txt
A UNIX socket, AKA Unix Domain Socket, is an inter-process communication mechanism that allows bidirectional data exchange between processes running on the same machine.
IP sockets (especially TCP/IP sockets) are a mechanism allowing communication between processes over the network. In some cases, you can use TCP/IP sockets to talk with processes running on the same computer (by using the loopback interface).
UNIX domain sockets know that they’re executing on the same system, so they can avoid some checks and operations (like routing); which makes them faster and lighter than IP sockets. So if you plan to communicate with processes on the same host, this is a better option than IP sockets.
```
from : <https://serverfault.com/questions/124517/what-is-the-difference-between-unix-sockets-and-tcp-ip-sockets>

- using unix sockets to integrate two languages
- Zigbee protocol (works with phillips hue)
- Tensorflow Lite
- PREEMPT_RT Kernel (Real Time Linux)
- embedded linux
    - [reddit post](https://www.reddit.com/r/embedded/comments/seke1y/can_you_suggest_ideas_for_sideprojects_using/)
    - intro: <https://www.linuxfoundation.org/blog/blog/intro-to-real-time-linux-for-embedded-developers>
    - yocto
    - <http://www.mosaic-industries.com/embedded-systems/_media/pdfs/white-papers/embedded-linux-primer.pdf>
    - real time linux: <https://rt.wiki.kernel.org/index.php/Main_Page>
    - preemopt_rt: <https://bootlin.com/doc/training/preempt-rt/preempt-rt-slides.pdf>
- zigbee
- send text message with raspberry pi:
    - [textbelt](https://textbelt.com/)
    - [textbelt git repo](https://github.com/typpo/textbelt)
    - What is a SMS gateway
- spotify player: <https://levelup.gitconnected.com/how-to-build-a-spotify-player-with-react-in-15-minutes-7e01991bc4b6>


-------------------------------------------------------------------


# Courses

### Machine Learning
- new Deep Learning AI: <https://www.deeplearning.ai/program/machine-learning-specialization/?utm_campaign=d>

- <https://www.coursera.org/learn/introduction-to-machine-learning-in-production?utm_source=recommendations&utm_medium=email&utm_campaign=14810&sfmc_id=100549529&sfmc_key=0038W00001WOS7cQAH> 
	
- [Tensorflow Tutorials - Youtube Playlist](https://www.youtube.com/playlist?list=PL9Hr9sNUjfsmEu1ZniY0XpHSzl5uihcXZ)
- [Udacity Course](https://www.udacity.com/course/intro-to-tensorflow-for-deep-learning--ud187)

- [Kaggle Courses](https://www.kaggle.com/learn)
- learn about LSTM

### OpenCV
- [Official Crash Course](https://opencv.org/opencv-free-course/)

### Filters
- [Kalman and Bayesian Filters GitHub](https://github.com/rlabbe/Kalman-and-Bayesian-Filters-in-Python/tree/ee586f5d84664383d079aa0bcb480fa78c8b0d2d)


### Digital Signal Proccessing
- Online Book: [The Scientist and Engineer's Guide to Digital Signal Processing](http://dspguide.com/pdfbook.htm)

- YouTube Series: [Phil's Lab DSP Playlist](https://www.youtube.com/playlist?list=PLXSyc11qLa1ZCn0JCnaaXOWN6Z46rK9jd)

### Python Automation
- [Automate the Boring Stuff](https://automatetheboringstuff.com/chapter0/)
- python automation: <https://www.reddit.com/r/IAmA/comments/xcp6jv/im_al_sweigart_author_of_several_free_programming/>
    - <https://inventwithpython.com/>

### Robotics
- [Fundamentals](https://automaticaddison.com/cpp-fundamentals-for-robotics/)
- [C++ for Robotics](https://app.theconstructsim.com/#/Course/59)
- [Linux for Robotics](https://app.theconstructsim.com/#/Course/40)
- ROS: <https://learning.edx.org/course/course-v1:DelftX+ROS1x+1T2021/home>


### Microcontrollers
- Udemy: Embedded Systems BareMetal: <https://www.udemy.com/course/embedded-systems-bare-metal-programming/>

- Embedded Systems - Shape The World: Microcontroller Input/Output: <https://www.edx.org/course/embedded-systems-shape-the-world-microcontroller-i>

- Embedded Systems - Shape The World: Multi-Threaded Interfacing] <https://www.edx.org/course/embedded-systems-shape-the-world-multi-threaded-in>

- Real-Time Bluetooth Networks - Shape the World: <https://www.edx.org/course/real-time-bluetooth-networks-shape-the-world>

- <https://learning.edx.org/course/course-v1:ArmEducation+EDARMXES1.6x+3T2020/home>
- <https://learning.edx.org/course/course-v1:ArmEducation+EDARMXES1.6x+3T2020/home>

- [path for embedded](https://apollolabsblog.hashnode.dev/7-step-learning-path-for-embedded-iot-beyond-arduino)
- Open-Drain Topology I2C
- State Machine
    - [article](https://aticleworld.com/state-machine-using-c/)
    - [article](https://www.codeproject.com/Articles/1275479/State-Machine-Design-in-C)

- **Feeback loop** with a motor. Use the STM32. Maybe buy a motor with an encoder
[example](https://www.youtube.com/watch?v=3ozgxPi_tl0)
(https://www.youtube.com/watch?v=dTGITLnYAY0)
    - Try to do the same with a raspberry and save data to a csv file, then plot it

- Look at some projects of implenting RTOS:
    - [reddit](https://www.reddit.com/r/embedded/comments/oib5m6/what_would_be_a_good_preferrably_simple_project/)

### Embeeded Linux

- get started: <https://www.thirtythreeforty.net/series/mastering-embedded-linux/>
- Linux from Scratch: <https://www.linuxfromscratch.org/lfs/view/stable/>

- operating system from scratch for raspberry pi: <https://s-matyukevich.github.io/raspberry-pi-os/>
- build an i2c drive for a raspberry pi




