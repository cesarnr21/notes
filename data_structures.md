# Data Structures Fundamentals

From edx. Taught by a Computer Science Professor from UC San Diego
**[Course Link](https://learning.edx.org/course/course-v1:UCSanDiegoX+ALGS201x+1T2019/home)**

------------

## Section 1: Basic Data Structures 


### Array
- Continuous chunk of data
- each element is of the same size
- The address on an element in the array can be found using the formula:
    `element_address = array_address + element_size * (i - first_index)`
    so for an array whose address is 1000, element size is 8, and the first index is 0
    the address of the element at index 6 is:`1000 + 8(6 - 0) = 1048`

> Note: It is less expensive/time-consuming/easier for a program to remove/add an element at the end because it only entails one step. To insert/remove an element at the beginning of the array, the rest of the elements need to either be moved or down.

### Linked List
- Linear collection of data elements
- There is a head pointer that points to a node that has key and the next pointer
- some disadvantageous of using arrays that are not applicable to Linked Lists:
    - adding a new element means that the array must be reallocated in memory(this why if you will add new elements to an array in the future, it is important to allocate more space than you need)
    - removing an element in the array leaves wasted space or requires an allocation
    - inserting elements anywhere involves reallocation and copy a lot of data.

### Stacks
- it is an abstract data type that can be part of the following operations
    - push(key): adds key to collection
    - key top(): returns the most recently added key
    - key pop(): removes and returns the most recent added key
    - boolean empty(): are there any elements
- you can implement a stack with an array to add(using the push() operation) an element, remove the last elements, or tell you the last element. It can also check if the array is empty.

### Queues
- It is an abstract data type with the following operations
    - enqueue(key): adds key to collection
    - key dequeue(): remove and returns the least recently-added key
    - boolean empty(): are there any elemenets
- Think about it like a line, the longest waiting person in line is served next.

> Note:  Stacks are LIFO(last-in, first-out), and Queues are FIFO(first-in, first-out)

- It is better to implement Queues with Linked list
    - you enqueue() an element at the end of the line, and when you dequeue, it will remove the element at the front
    - because dequeue() removes the element at the front, it would not be a good idea to use this with an array, since then, all the elements in the array would need be reallocated

### Trees
- A **Binary Search Tree** can be used to look for data quickly. It is binary because each node can only have two elements coming from it. 
    - Another property of binary search trees is that the value of the root node is greater than or equal to all the nodes(elements) in the **left**
    - And less than the nodes in the **right**
- A **tree** has key and children. The key is the value of the element and the children are the elements that form from the node. A tree can also be empty, meaning that it has a key but no children
    - the **root** is the top node of the tree
    - the **children** have to be directly related to their root node(they share the same parent)
    - there are also decendants and ancestors
    - a **leaf** is a node with no children
    - a **interior node** is a node with children
- A **forest** is a collection of trees

------------

## Section 2 Dynamic Arrays 

- Once a static array have been declared, they are static and you can't change their size. their size is determined at compilation
- On the other hand, **dynamic-allocated arrays** are allocated at run-time but just like static arrays, their size is static

A **Dynamic Array** has a dynamic size, meaning that its size changes. They work by creating dynamic-allocated arrays and once full, copy the elements to a new and bigger dynamic-allocated array and then deleting the old array. They use these components: 
- arr: pointer of the dynamically-allocated array
- capacity: size of the dynamically-allocated array
- size: the number of elements currently in the array

### Operations of a Dynamic array:

- Get(i): return the element at location i*
```py
if i < 0 or i >= size:				# check if the element i is inside the range of the array
    error: index out of range				
return arr[i]						# return the location of element i
```
- Set(i, val): set the element to val*
```py
if i < 0 or i >= size:				# check if the element i is inside the range of the array
    error: index out of range
arr[i] = val						# return the value of element i
```
- PushBack(val): adds val at the end
```py
if size = capcity: 					# check if the array is full
    allocate new_arr[2*capcity]		# create a new array twice the size of the old one
    for i from 0 to size - 1:       # copy over the elements of the old arrays to the new
        new_arr[i] = arr[i]
    free new_arr					# delete/clear/free up the old array
    arr = new_arr					# update the array to the pointer of the new array
    capacity = 2*capcity     		# update the capacity to the capacity of the new array
arr[size] = val						# finally, add the element to the end of the array
size = size + 1						# update the number of elements
```
- Remove(i): removes the element at location i
```py
if i < 0 or i >= size:				# checks if the element if i is inside the range
    error: index out of range
for j from i to size - 2:			# a loop to move over each element
    arr[j] = arr[j + i]
size = size - 1						# updates the number of elemtents
```
- Size(): returns the number of elements. Simply: 
```py
return size
```

> Note: Some implementations are vectors in c++ and lists in python

------------

## Section 3 Priority Queues amd Disjoint sets

**Priority Queues** Unlike regular queues, where the first-in comes first-out, and elements are added to the back, for a **Priority Queue** when an element is added, it is assigned a priority, and elements come out in order by the bigger priority. the operations are 
- Insert(p): adds a new element with priority p
- ExtractMax(): which extracts an element with maximun priority

------------
# More

## Section 4 Hashing
- direct addressing and chaining
- has functions
- search substring

## Section 5 Binary search trees
- 

From Programiz Website
[Course Link](https://www.programiz.com/dsa)

**Semaphores**
