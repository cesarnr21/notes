
# General Programming Skills

-------------------------------------------------------------------

- c++: <https://www.learncpp.com/>
- [path for embedded](https://apollolabsblog.hashnode.dev/7-step-learning-path-for-embedded-iot-beyond-arduino)
- what is a buffer?
- a program to split strings into individual characters and prints them individually
    - an addition to this is to create dynamic memory if needed
- Pointers in C and C++
- Open-Drain Topology I2C
- [Function Overriding](https://www.programiz.com/cpp-programming/function-overriding)
- State Machine
    - [article](https://aticleworld.com/state-machine-using-c/)
    - [article](https://www.codeproject.com/Articles/1275479/State-Machine-Design-in-C)
- Linux Programming. <https://digital.com/best-website-builders/linux/>
- python automation: <https://www.reddit.com/r/IAmA/comments/xcp6jv/im_al_sweigart_author_of_several_free_programming/>
    - <https://inventwithpython.com/>
- **python list comprehensions**

- **namespace** in C++
- **C++ Template Functions and Classes**

- what is a memory leak

### Practice
- these problems: <https://cses.fi/problemset/>
- [Facebook coding challenges](https://www.facebookrecruiting.com/portal/coding_puzzles)

## Experiments you can peform:

- **Feeback loop** with a motor. Use the STM32. Maybe buy a motor with an encoder
[example](https://www.youtube.com/watch?v=3ozgxPi_tl0)
(https://www.youtube.com/watch?v=dTGITLnYAY0)
    - Try to do the same with a raspberry and save data to a csv file, then plot it

- Look at some projects of implenting RTOS:
    - [reddit](https://www.reddit.com/r/embedded/comments/oib5m6/what_would_be_a_good_preferrably_simple_project/)

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






