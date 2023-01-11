
# Integrating JS into HTML
- reference: <https://sebhastian.com/display-javascript-variable-html/>


# HTML
----------------------------------------------------------

**Reference:** <https://html.com/#What_is_HTML>

stands for **Hyper Text Markup Language**. It is made up of Tags and attributes.

**HTML Tags** are used mark up the start of an HTML element and are enclosed in angle brackets. example
```html
<h1>
```

For tags it is important to closed in the order in which they were opened

**HTML Attributes** contain pieces of information. they take the form of an opening tag
```html
<img src="mydog.jpg" alt="A photo of my dog.">
```
above `alt` and `src` are attributes of the `img` tag

For **Comments** use `<!-- comments -->`. this can also be used for multiple lines

## Contructing an HTML Page

Here is how 

1. `<!DOCTYPE html>` This tag specifies the language you will write on the page. In this case, the language is HTML 5.

2. `<html>` This tag signals that from here on we are going to write in HTML code.

3. `<head>` This is where all the metadata for the page goes — stuff mostly meant for search engines and other computer programs. Here you can have these tags
    - `<title>` This is where we insert the page name as it will appear at the top of the browser window or tab.

    - `<meta>` This is where information about the document is stored: character encoding, name (page context), description.

4. `<body>` This is where the content of the page goes.
    - `<h1>` or `<h2>` these are headings. You can do for example: `<h1>Welcome to My Page</h1>` 

    - More elements you can use:
        - `<b>`: bold
        - `<strong>`: strong, similar to bold
        - `<i>`: italic
        - `<em>`: emphasised text, usually used under images
        - `<mark>`: mark, highlight the background of text
        - `<small>`: to shrink text
        - `<strike>`: to strike throught text
        - `<u>`: to underline text
        - `<ins>`: inserted text
        - `<sub>`: subscript text
        - `<sup>`: superscript text

5. Close with `</body>` and `</html>`


## More features of HTML

**Adding Links:** for this use:
```html
<a href="https://blogging.com/how-to-start-a-blog/">Your Link Text Here </a>
```
Example:
```html
<a href="http://www.google.com">Google</a>
```

**Adding Images:** for this use:
```html
<img src="yourimage.jpg" alt="Describe the image" height="X" width="X">
```
Example:
```html
<img src="testpic.jpg" alt="This is a test image" height="42" width="42">
```

**For Lists:** use `<ol>` for *ordered lists* and `<ul>` for *unordered lists* example is:
```html
<ol>
<li>An item </li>
<li>Another item </li>
<li>Another goes here </li>
</ol>

<ul>
<li>This is </li>
<li>An Unordered </li>
<li>List </li>
</ul>
```

**For Tables:** start with the `<table>` tag and then use `<tr>` for rows and `<td>` for cells
```html
<table>
<tr>
<td>Row 1 - Column 1</td>
<td>Row 1 - Colunm 2 </td>
<td>Row 1 - Column 3 </td>
</tr>
<tr>
<td>Row 2 - Column 1</td>
<td>Row 2 - Column 2</td>
<td>Row 2 - Column 3</td>
</tr>
</table>
```

More on tables [here](https://html.com/tables/)

**Some Cool example Here:**
```html
<!DOCTYPE html>
<html>
<head>
<title>My First Webpage</title>
<meta charset="UTF-8">
<meta name="description" content="This is my first website. It includes lots of information about my life.">
</head>
<body>
<h1>Welcome to my webpage</h1>
<p>Welcome to <em>my</em> brand new website.</p>
<p>This site will be my <strong>new</strong> home on the web.</p>
<a href="/page2.html">Page2</a>
<img src="testpic.jpg" alt="This is a test image" height="42" width="42">
<p>This website will have the following benefits for my business:</p>
<ul>
<li>Increased traffic </li>
<li>Global Reach</li>
<li>Promotional Opportunities</li>
</ul>
<table>
<tr>
<td>Row 1 - Column 1</td>
<td>Row 1 - Column 2 </td>
</tr>
<tr>
<td>Row 2 - Column 1</td>
<td>Row 2 - Column 2</td>
</tr>
</table>
</body>
</html>
```


  
# CSS
----------------------------------------------------------

**Reference for CSS:** <https://www.w3schools.com/css/default.asp>

CSS stands for **cascading style sheets**. It describes how HTML elements are to be displayed on a screen

In CSS there is a selector and the declaration block. The *selector* point to the HTML element you want to style. the *declaration block* contains declarations. Declarations include a CSS property and a value, separate by a colon. Declarations are then separate by semicolons.

In the example below, the selector points to `<p>` elements and `color` and `text-aling` are properties.

```css
p {
  color: red;
  text-align: center;
}
```

For **Comments** use `/* comments */`. this can also be used for multiple lines

## Insert CSS into HTML

There are 3 ways to insert CSS:
1. **External CSS:** can be saved as a another file with `.css` file type. Using the `<link>` element inside the `<head>` section

    Example:
    ```html
    <!DOCTYPE html>
    <html>
    <head>
    <link rel="stylesheet" href="mystyle.css">
    </head>
    <body>

    <h1>This is a heading</h1>
    <p>This is a paragraph.</p>

    </body>
    </html>
    ```
    and the inside the `mystyle.css` file:
    ```css
    body {
      background-color: lightblue;
    }

    h1 {
      color: navy;
      margin-left: 20px;
    }
    ```

2. **Internal CSS:** the CSS code can be contained inside the `<style>` element on the `<head>` section.

    Example below:
    ```html
    <!DOCTYPE html>
    <html>
    <head>
    <style>
    body {
      background-color: linen;
    }

    h1 {
      color: maroon;
      margin-left: 40px;
    }
    </style>
    </head>
    <body>

    <h1>This is a heading</h1>
    <p>This is a paragraph.</p>

    </body>
    </html>
    ```

3. **Inline CSS:** to apply a unique style for a single element. To use inline styles, add the style attribute to the relevant element. The style attribute can contain any CSS property. This one is te highest priority and will override external and internal styles.

    Example: 
    ```html
    <!DOCTYPE html>
    <html>
    <body>

    <h1 style="color:blue;text-align:center;">This is a heading</h1>
    <p style="color:red;">This is a paragraph.</p>

    </body>
    </html>
    ```

## Selectors

**CSS id Selector:**  
The id selector uses the id attribute to select an specific element. To use the id selector, use the hash character `#` before the id. below the id selector is `#para1`

```css
#para1 {
  text-align: center;
  color: red;
}
```
> note: the id selector can't start with a number.

**CSS class Selector:**  
to select elements with an specific class write period, followed by the class name. below `.center`

```css
.center {
  text-align: center;
  color: red;
}
```
to specify specific html elements. below only `<p>` with class `center`
```css
p.center {
  text-align: center;
  color: red;
}
```
html elements can also refer to more than one class
```html
<p class="center large">This paragraph refers to two classes.</p>
```

You can also group selectors together.
```css
h1, h2, p {
  text-align: center;
  color: red;
}
```

**CSS Universal Selector:**  
the universal selector selects all html elements. use `*`

```css
* {
  text-align: center;
  color: blue;
}
```

## Other Formatting Properties of CSS
For these features, go to the reference: <https://www.w3schools.com/css/default.asp>
- Backgrounds 
- Borders, Margins
- Height and Width
- Text, Fonts, Links
- Tables
- Math functions
- Animations
- Buttons

> Note: some of these such as animations and buttons, are better done with JavaScript

