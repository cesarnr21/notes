
# Course: Embedded Systems Bare-Metal Programming Ground Up (STM32)

Link: [Udemy: Embedded Systems BareMetal](https://www.udemy.com/course/embedded-systems-bare-metal-programming/)


Something else
[interrupt](https://interrupt.memfault.com/blog/zero-to-main-1)


>Note: these notes will work for AMR Cortex Microcontrollers/Microproccessors

### Documents needed for Bare Metal programming
- Datasheet for the microcontroller
- User manual for your board (if there is one available)
- Reference manual

Definitions
------------------------------------------------------
- RCC
- APB2 (periphiral clocks)
- What is the UL after the registers

Notes
------------------------------------------------------
- Microcontroller GPIO pins usually have at least two registers
	- direction register: sets whether a pin is an input or an ouput
	- data register: it is used to store the data received or to send data

> Note: modern microcontrollers may have more than just two register per pin




Main Steps
-----------------------------------------------------
- To find the addresses of the Ports and Pins, go on the **datasheet** for the microcontroller and look for **Memory Mapping**. you are interested in the **peripherals memory block**. there you can see the range of the adresses of the peripfitals

- On **memory mapping** you can also find the start and ending addresses for the GPIO ports and for the Clock Buses.

- Once you already know which ports and pins you want to access, again on the **Datasheet** you can look for the  **Perfromance Line Block Diagram** and see how the ports can access the clocks using which bus

- Before a port can access a Bus, busses need to be enabled using the `RCC` module, the rcc module can be used to enable the ports access to the clocks

- Now to see the what the registers of the RCC module mean, go to the **reference Manual** and look for rcc module for your specific bus. for example: if you want to enable bus `APB2` look for something like `RCC_APB2ENR`
	- Once here you will find the **address offset** which will allow you to find the address enable register
	- in the peripheral clock enable register for the Bus, you will find what every bit in the register means and does
	- now depending on the port that you want to enable or disable, you can set a bit in the register to 0 or 1.
	- for example: to enable Port C and the Bus that it's connected to, go to the rcc_module for the Bus connected to C. now if if bit 4 needs to be set 1 to enable port C you can:
	```c
	#define IOPCEN		(1 << 4) // shifts 1 to the 4th bit
	
	```
- To configure the pins now look for **GPIO MODER** (stands for GPIO mode registers) and look for the address offset
	- once here we can see with registers belong to which pins. to configure a pin, you usually need to configure both bits that corresspond to moder


