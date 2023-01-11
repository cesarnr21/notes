# JavaScript and Node.js

Reference for JavaScript more web focused: <https://html.com/#What_is_HTML>

Reference for JavaScript more programming focused: <https://www.programiz.com/javascript>

**Node.js** is a back-end client that can run javascript outside of a broswer. Install in linux: `sudo apt-get install node` and for mac use `brew install node`

To run a .js file use `node filename.js`

## Basics of JavaScript
**Declaring Variables**  
To declare variables you can either use `let` or `var`. Differences are:
- `var` is older and it is recommended to use `let`. some browsers do not support `let`
- `var` is function scoped while `let` is block scoped
- examples:
    ```js
    var x; // declares x
    let y; // declares y
    // possible to declare multple variables in a single line
    let a = 1, b = 2, c = 3;
    ```
- for constant variable use `const`

> they can either start with a letter or an underscore, but not with numbers.

**JavaScript Symbols**  

**JavaScript Objects**  
An object is a data type that allows you to store mutliple collections of data into a single variable. 
> Unlike other Object Oriented Languages, to create an object there is no need to first create a class
Each member of the object has a key:value pair. You can access the value by calling the key either with a dot or a bracket
```js
const person = { 
    name: 'John', 
    age: 20, 
};

// accessing property with dot notation
console.log(person.name); // John

// accessing property with bracket
console.log(person[name]); // John

```
You can also have nested objects, or functions inside objects.
```js
// nested object
const student = { 
    name: 'John', 
    age: 20,
    marks: {
        science: 70,
        math: 75
    }
}

// accessing property of student object
console.log(student.marks); // {science: 70, math: 75}

// accessing property of marks object
console.log(student.marks.science); // 70
```
```js
// function inside object
const person = {
    name: 'Sam',
    age: 30,
    // using function as a value
    greet: function() { console.log('hello') }
}

person.greet(); // hello
```

An **object contruction** function is like a class. you can use it to create many objects. example:
```js
// constructor function
function Person () {
    this.name = 'John',
    this.age = 23,

     this.greet = function () {
        console.log('hello');
    }
}

// create objects
const person1 = new Person();
const person2 = new Person();

// access properties
console.log(person1.name);  // John
console.log(person2.name);  // John
```

**JS console.log**  
works like python's `print()`
```js
const greet = 'Hello';
const name = 'Jack';

console.log(greet + ' ' + name);
```

**Other things**  
In javascript values can be equal and be of different variable types

```js
// equal operator
console.log(2 == 2); // true
console.log(2 == '2'); // true

// not equal operator
console.log(3 != 2); // true
console.log('hello' != 'Hello'); // true

// strict equal operator
console.log(2 === 2); // true
console.log(2 === '2'); // false

// strict not equal operator
console.log(2 !== '2'); // true
console.log(2 !== 2); // false
````

If a variable is used without declaring it, it automatically becomes a *global variable*
> Using `let` to declare a variable will lock it to a block. For example if used inside n if statement, it can only be used then, example:
```js
// program showing block-scoped concept
// global variable
let a = 'Hello';

function greet() {

    // local variable
    let b = 'World';

    console.log(a + ' ' + b);

    if (b == 'World') {

        // block-scoped variable
        let c = 'hello';

        console.log(a + ' ' + b + ' ' + c);
    }

    // variable c cannot be accessed here
    console.log(a + ' ' + b + ' ' + c);
}

greet();
```
```
// Output for code above
Hello World
Hello World hello
Uncaught ReferenceError: c is not defined
```
> Another note about the scope: `var` is function scope and `let` is block-scoped, so if `c` above is declared as `var c = 'hello;`, the code above will work.

### Control Flow
`if.....else if...else` statements, `for(), while()` loops, and `switch()` statements work the same way the work in C/C++.

**Ternary Operator**  
Can be used to make a decision in binary choices. Here is the syntax: `condition ? expression1 : expression2`. If the condition is true, then `expression1` is executed.

Example

```js
let marks = prompt('Enter your marks :');

let result = (marks >= 40) ? 'pass' : 'fail';

console.log(`You ${result} the exam.`);
```

**Labeled Break and Continue**  
The regular `break` can be used to end the loop, and `continue` can be used to end the current iteration of the loop and begin the next one.

You can label loops. More information on that here: <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/label>

**Functions**  
To declare a function use the syntax:
```js
function name_function(parameter) {
    //body
}
```

#### For...in Loop
This loops works a bit like the python *for in loop*. Example:
```js
const string = 'code';

// using for...in loop
for (let i in string) {
    console.log(string[i]);
}

/*
Output below:
c
o
d
e
*/
```

### Data Structures (Arrays)
Use **`push()`** to add elements at the end of the array

Use **`unshift()`** to add elements at the beginning of the array

Use **`pop()`** to remove the last element of an array

Use **`shift()`** to remove the first element of an array and return that element

Examples:
```js
let activities = ['eat', 'sleep', 'walk']

// add element
activities.push('drive');

// add element in front
activities.unshift('work');

// remove last element
activities.pop()

// remove first elements
activities.shift()
```

adding an element by index value, inserts it between other elements example:
```js
let dailyActivities = [ 'eat', 'sleep'];

// this will add the new element 'exercise' at the 2 index
dailyActivities[2] = 'exercise';

console.log(dailyActivities); // ['eat', 'sleep', 'exercise']
```

**Multidimensional Arrays**
Ways of creating multidimensional arrays:
```js
let studentsData = [['Jack', 24], ['Sara', 23], ['Peter', 24]];

// or

let student1 = ['Jack', 24];
let student2 = ['Sara', 23];
let student3 = ['Peter', 24];

// multidimensional array
let studentsData = [student1, student2, student3];
```

#### Data Structures (Maps and Sets)

reference: <https://www.programiz.com/javascript/map-weakmap>

### Inputs from User
`prompt` only works in the browser. When using Node.js, use `readline` to get an input from the user.

### JS Hoisting
**Hoisting** is a behavior in which a function or variable can be used before declaration.
```js
// program to display value
a = 5;
console.log(a);
var a; // 5
```
> Note: `let` and `const` do not allow hoisting

example with a function:
```js
// program to display value
a = 5;
console.log(a);
var a; // 5
```

### Keywords
**This** can be used with the constructor function. 
```js
// constructor function
function Person (person_name, person_age, person_gender) {

   // assigning  parameter values to the calling object
    this.name = person_name,
    this.age = person_age,
    this.gender = person_gender,

    this.greet = function () {
        return ('Hi' + ' ' + this.name);
    }
}


// creating objects
const person1 = new Person('John', 23, 'male');
const person2 = new Person('Sam', 25, 'female');

// accessing properties
console.log(person1.name); // "John"
console.log(person2.name); // "Sam"
```

### Error Handling
In JS, use **try...catch...finally** to handle errors and exceptions. examples
```js
const numerator= 100, denominator = 'a';

try {
     console.log(numerator/denominator);
     console.log(a);
}
catch(error) {
    console.log('An error caught'); 
    console.log('Error message: ' + error);  
}
finally {
     console.log('Finally will execute every time');
}
```

JavaScript also features a **throw statement** which allow you to pass user defined exceptions. Example:
```js
const number = 40;
try {
    if(number > 50) {
        console.log('Success');
    }
    else {

        // user-defined throw statement
        throw new Error('The number is low');
    }

    // if throw executes, the below code does not execute
    console.log('hello');
}
catch(error) {
    console.log('An error caught'); 
    console.log('Error message: ' + error);  
}

/*
Output:
An Error caught
Error message: Error: The number is low
*/
```


## Other stuff
In JS you can pass a function as a parameter for another function. When this is done, the function that is passed as an argument is called a **CallBack Function**

### setTimeout() Function
This function executes a block of code after a speciefied amount of time. It only excutes once. the syntax is: **`setTimeout(function, milliseconds);`**

To stop the function call, use **`clearTimeout()`**. This is usally used to cancel the `setTimeout()` function before it happens. You can also pass function parameters to the `setTimeout()` function. syntax: `setTimeout(function, milliseconds, parameter1, ......., parameter)`

### Promise
promises are ways to handle asynchornous operations. a promise can have 1 of 3 states: 
- pending
- fulfilled
- rejected

The syntax uses the **`Promise()`** constructor as an argument, and it also features the **`resolve()`** function which is called is the promise returns successfully, and the **`reject()`** function which is executed if an error occurs.
```js
const count = true;

let countValue = new Promise(function(resolve, reject) {
    if (count) {
        resolve("There is a count value.");
    } else {
        reject("There is no count value");
    }
});

console.log(countValue);

// Output: Promise {<resolved>: "There is a count value."}
```

To handle multiple asynchronous tasks, you can chain promises. To make this work, use the **`then()`** keyword. example:
```js

// returns a promise
let countValue = new Promise(function (resolve, reject) {
     resolve("Promise resolved");
});

// executes when promise is resolved successfully
countValue
     .then(function successValue(result) {
         console.log(result);
     })

     .then(function successValue1() {
         console.log("You can call multiple functions this way.");
     });
```

In case the promise is rejected, use **catch()**
```js
// returns a promise
let countValue = new Promise(function (resolve, reject) {
    reject('Promise rejected'); 
});

// executes when promise is resolved successfully
countValue.then(
    function successValue(result) {
        console.log(result);
    },
 )

// executes if there is an error
.catch(
    function errorValue(result) {
        console.log(result);
    }
);
```

and just like with error handling, using **`finally()`** will execute code whether there is an error or not.


### async/await
using **`async`** with a function will declare it as an asynchronous function. the function will return a *promise*. syntax:
```js
// async function example
async function f() {
    console.log('Async function.');
    return Promise.resolve(1);
}

f();
```

```js
// a promise
let promise = new Promise(function (resolve, reject) {
    setTimeout(function () {
    resolve('Promise resolved')}, 4000); 
});

// async function
async function asyncFunc() {

    // wait until the promise resolves 
    let result = await promise; 

    console.log(result);
    console.log('hello');
}

// calling the async function
asyncFunc();
```
### setInterval()
this will execute a function at any given timing event. syntax: `setInterval(function, milliseconds);` example to print a string every second:
```js
// program to display a text using setInterval method
function greet() {
    console.log('Hello world');
}

setInterval(greet, 1000);
```

To stop the execution use **`clearInterval()`**. example:
```js
// program to stop the setInterval() method after five times

let count = 0;

// function creation
let interval = setInterval(function(){

    // increasing the count by 1
    count += 1;

    // when count equals to 5, stop the function
    if(count === 5){
        clearInterval(interval);
    }

    // display the current time
    let dateTime= new Date();
    let time = dateTime.toLocaleTimeString();
    console.log(time);

}, 2000);
```

### Arrow Function
Instead of writing:
```js
let x = function(x, y) {
   return x * y;
}
```
write
```js
let x = (x, y) => x * y;

// for functions with no argments use empty parenthesis
let greet = () => console.log('Hello');
greet(); // Hello
```

### For....of Loop
Very similar to the *For...in loop*
**For...of Loop**:
- The for...of loop is used to iterate through the values of an iterable.
- The for...of loop cannot be used to iterate over an object.

**For...in Loop**:
- The for...in loop is used to iterate through the keys of an object.
- You can use for...in to iterate over an iterable such arrays and strings but you should avoid using for...in for iterables.

## Other

### JSON files
- **JSON Object** is written inside *curly brackets {}*, they can contain multiple key/value pairs
- **JSON Arrays** are written inside *square brackets []*

```json
// JSON object
{ "name": "John", "age": 22 }

// JSON array
[ "apple", "mango", "banana"]

// JSON array containing objects
[
    { "name": "John", "age": 22 },
    { "name": "Peter", "age": 20 },
    { "name": "Mark", "age": 23 }
]
```

**Converting JSON to JavaScript Object**  
```js
// json object
const jsonData = '{ "name": "John", "age": 22 }';

// converting to JavaScript object
const obj = JSON.parse(jsonData);

// accessing the data
console.log(obj.name); // John
````

**Converting JavaScript Object to JSON**  
```js
// JavaScript object
const jsonData = { "name": "John", "age": 22 };

// converting to JSON
const obj = JSON.stringify(jsonData);

// accessing the data
console.log(obj); // "{"name":"John","age":22}"
```

## Make API Calls


## Modules and Import
Importing code in JS. Say we have a file `formulas.js` with function `area_circle()` and we need to import it to our main file.
1. Have a file `package.json` and add:
    ```js
    {
        "type": "module"
    }
    ```
2. To access functions, objects, variables from another module, they must be first exported using **export**. Example:
    ```js
    // file formulas.js
    // exporting the variable
    export const name = 'JavaScript Program';

    // exporting the function
    export function area_circle(radius) {
        return radius * 3.14;
    }
    ```
3. to import use `import {objects, ....objects} from 'path';`
    ```js
    import {area_circle, name} from './formulas.js';

    console.log(name);
    let radius_circle = 2;
    console.log("The area of the circle is " + area_circle(radius_circle));
    ```
4. If you need to rename the objects from the module, use:
    ```js
    import {area_circle, doc as area} from './formulas.js';
    ```

> Note: By default modeles are always in strict mode for better code

### More on packages in Node

To install a package, use `npm install <package_name>`. This however only installs the package for that individual project. 

To install globally use `npm intall -g <package_name>` and then use `npm link <package_name>` to use the global package






