last updated: 06/28/2021

udemy email: cesar21@outlook.com
[https://www.udemy.com/course/embedded-systems-bare-metal-programming/]

## Other

Reddit with ideas:(https://www.reddit.com/r/embedded/comments/gzj59g/compile_from_scratch_without_ide/)

Also downloaded and will try stm32flash `sudo apt install stm32flash`

[youtube video](https://www.youtube.com/watch?v=Hffw-m9fuxc&list=PLNyfXcjhOAwO5HNTKpZPsqBhelLF2rWQx&index=2)

(https://www.e-tinkers.com/2020/01/getting-started-with-stm32-and-things-you-need-to-be-aware-of/)

- [Programming STM32 on Linux](https://olayiwolaayinde.medium.com/programming-stm32-on-linux-d6a6ee7a8d8d)

- [Another Example](https://blog.gypsyengineer.com/en/diy-electronics/a-template-project-for-stm32f103-on-linux.html)


# Notes on STM32 Platform: Notes from the Textbooks
 
### ST-Link V2 Programmer
to program the STM32, you caan use the ST-Link V2 programmer. to see 
Make the following connections: 
```
# note: use the pins at the button of the ST-Link V2 Programmer

SWDIO -> DIO
GND -> GND
SWCLK -> DCLK
3.3V -> 3.3V
```
After connecting the pins, plug in the st-link and the power LEDs on both the programmer and the stm32 should light up.  

To find the ST-Link and see information on the microcontroller, use the command `st-info --probe` and a message should pop up. something like this:
```
Found 1 stlink programmers
 serial: 52004100040000315037504e
openocd: "\x52\x00\x41\x00\x04\x00\x00\x31\x50\x37\x50\x4e"
  flash: 65536 (pagesize: 1024)
   sram: 20480
 chipid: 0x0410
  descr: F1 Medium-density device
```
The **st-flash** utility will allow to read, write, and save programs from the stm32.
- to save a program use `st-flash read ./saved.img 0x8000000 0x1000` which will save the program to a file named ./saved.img. the command below can be broke down into `st-flash read ./[filename.filetype] [starting address] [amount of data saved]`

- to write a hex program back into the stm. use `st-flash write ./saved.img 0x8000000`. for this command we do not need to use the size argumnet. also in the command we wrote the program back into the same 0x8000000 address

- to wipe the stm clean, simply use `st-flash erase`

### Using GPIO and the libopencm3 library

the following program blinks the onboard LED connected to GPIO PC13 on the Blue Pill
```c

#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>

static void
gpio_setup(void) {
	/* Enable GPIOC clock. */
	rcc_periph_clock_enable(RCC_GPIOC); 

	/* Set GPIO8 (in GPIO port C) to 'output push-pull'. */
	gpio_set_mode(GPIOC,GPIO_MODE_OUTPUT_2_MHZ,GPIO_CNF_OUTPUT_PUSHPULL,GPIO13); 	

}

int
main(void) {
	int i;

	gpio_setup();

	for (;;) {
		gpio_clear(GPIOC,GPIO13);	/* LED on */
		for (i = 0; i < 1500000; i++)	/* Wait a bit. */
			__asm__("nop");

		gpio_set(GPIOC,GPIO13);		/* LED off */
		for (i = 0; i < 500000; i++)	/* Wait a bit. */
			__asm__("nop");
	}

	return 0;
}

```

for the program above, to use the GPIO, we used two GPIO functions
```c
gpio_clear(GPIOC,GPIO13); // to turn on
gpio_set(GPIOC,GPIO13); // to turn off
```
see how each functions has a **port** name and a **pin** number





-------------------------------------------------------------------------------------------

# Beginning STM32 Textbook

## Flashing with Makefiles

Use the book called *Begining STM32* by Warren Gay

Got the book from:
[Springer Link](https://link.springer.com/book/10.1007/978-1-4842-3624-6)

**github with example code**
[github](https://github.com/Apress/Beg-STM32-Devel-FreeRTOS-libopencm3-GCC)

## Setting up Software

**Download Directory**
```bash
git clone https://github.com/ve3wwg/stm32f103c8t6.git
```
**Download libopencm3**
```bash
# inside stm32f103f8t6 directory
git clone https://github.com/libopencm3/libopencm3.git
```
**Download FreeRTOS**
got to [https://www.freertos.org/a00104.html] and download the zip file. Unzip the file inside the <stm32f103c8t6/rtos> directory

then edit the file <stm32f103c8t6/rtos/Project.mk> and change
```sh
FREERTOS ?= FreeRTOSv202012.01-LTS # you can copy the version from your Zip file
```

## Download an ARM Cross Compiler

got to [The ARM developer website](https://developer.arm.com/)
got to "Linux and Open Source"
Download "ARM GNU Embedded Toolchain"

Now go to the </opt> directory, create one if there isn't any. Login as 'root' and unzip the file downloaded from ARM.
```bash
tar xjf ~cesar/Downloads/file.zip
```
now you can rename the directory created in </opt> eg. 'gcc-arm'. now add the compiler's bin directory to PATH
```bash 
export PATH="/opt/gcc-arm/bin:$PATH"
```
Then you can test the compiler using:
```bash
arm-none-eabi-gcc --version
# and
type arm-none-eabi-gcc
```
if both commands work then go back to the <stm32f103c8t6> directory and use 'make'

Now is time to test the ST-Link Tool.
```bash
# first install 
sudo apt install stlink-tools
# then do
st-flash
```

if everything works okay, then you are done setting up the software








