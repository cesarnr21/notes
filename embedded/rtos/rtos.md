
## Some sources

[UNC Charlotte](https://webpages.uncc.edu/~jmconrad/ECGR6185-2009-01/notes/Intro_to_MicroCOS-II.pdf)

[Book by Jean J. Labrosse](http://gr.xjtu.edu.cn/c/document_library/get_file?folderId=988018&name=DLFE-22901.pdf)

[Hanel](https://webpages.uncc.edu/~jmconrad/ECGR6185-2006-01/notes/Introduction_To_MicroC_OS-II.pdf)

[a book](https://www.amazon.com/MicroC-OS-II-Kernel-CD-ROM/dp/1578201039)

# Real Time Operating Systems

these notes here: (https://www.highintegritysystems.com/rtos/what-is-an-rtos/)



benefits of rtos:
- the ability to separate time sensitive tasks from non time sensitive
- the ability to reuse code
- maintainability 
- modularity, modular development and modular testing

---------------------------------------------------------------------------

## FreeRTOS






---------------------------------------------------------------------------

## MicroCOS-II

[MicroC rtos](https://www.techrepublic.com/index.php/resource-library/whitepapers/application-with-mucos-rtos-on-embedded-systems/)

real time kernel, can run in over 90 processors  

there are five states for a task to be in:
- Dormant: not yet visible by the OS, it is no longer shceduled, and is removed from all data structures. 
- ready: tasks that are ready to run but its priority is less than the current running task
- running: tasks that is currently running
- waiting: a task that requires the occurance of an event
- ISR(Interrup Service Routine):


### Task Scheduling
- The scheduler runs the highest priority task
- **OSRdy** has a set bit for each ready task
- **OS_TASK_SW** is a macro that swithces task switch.
	- It is implemented at as a software interrupt
	- Saves the registers of the task that is being switched out
	- restores register of task being switch in
- **Scheduler locking** can prevent other task from running (except for ISRs)
- There are Idle tasks which run when nothing else is ready. they have the lowest priority

### To write an application:
1. configure `os_cfg.h` to match the application, 
	- verify there are enough resources for the number of events, tasks, other features
2. Define a stack for each tasks
3. write tasks
4. write ISRs
5. Write main() to initialize and start up the OS



