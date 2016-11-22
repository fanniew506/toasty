# Toasty

A light-weight library to manage core DOM manipulation functionality, AJAX requests, and event handling. Implemented using the native DOM API to ensure cross-browser compatibility.

## How To Use

Download `./toasty/lib/` and include it in project directory. Wherever toasty is used, include the following line at the top of the file:
```javascript
const $t = require('./../toasty/lib/main');
```

### Methods

#### `$t(selector)`
* Creates an HTML element with the selector and returns a ToastyNodeCollection object
```javascript
const $li = $t('<li>');
```

* `$t('tag')` and `$t('.class')` will collect all matching nodes from the page and return a ToastyNodeCollection object
```javascript
const tagCollection = $t('li');
const classCollection = $t('.class-name');
```

* `$t(HTMLElement)`
  * If argument is an instance of HTMLElement, function returns native HTMLElement wrapped in toasty, returning a ToastyNodeCollection

* `$t(func)`
  * If argument is a function, will push function into a queue to be executed on `document` `ready`

#### AJAX Requests

#### `$t.ajax(options);`
* Uses native Javascript API to send ajax requests using an XMLHttpRequest object
* Receives an options object as an argument and can include the following:
 * `success` and `error` callback functions
 * `url`
 * `method`
 * `data`
 * `contentType`

* Example:
```javascript
$t.ajax({
  method: "GET",
  url:  "http://api.openweathermap.org/data/2.5/weather",
  data: { appid: "6593357a84983f34982acc13f791e08d", q: "NY,NY" },
  success(data) {
    const node = document.createElement("p");
    $t(node).append(data);
    $t('li').append(node);
  }
})
```

#### `ToastyNodeCollection.prototype` Methods

##### `html`
* `html` receives an optional string as an argument
* With argument: the string will be the `innerHTML` of each node
* Without argument: returns `innerHTML` of the first node

##### `empty`
* Clears all nodes in the internal array

##### `append`
* Accepts a toasty wrapped collection, an HTML element, or a string
* Appends the `outerHTML` of each element in the argument to the `innerHTML` of each element in the `ToastyNodeCollection`

##### `attr`
* Getter method for values of an attribute for the first element from array of matched elements
* Acts as a setter method if a second argument of value is passed in

##### `addClass`
* Takes a class as an argument and adds it to HTML elements in the node collection
* Can accept multiple classes

##### `removeClass`
* Takes a single class as an argument and removes it from the HTML elements in the node collection

##### `children`
* Returns a `ToastyNodeCollection` of all children of all nodes in the collection

##### `parent`
* Returns a `ToastyNodeCollection` collection of the `parent`s of each of the nodes

##### `find`
* Accepts a selector as an argument and returns a matching `ToastyNodeCollection`

##### `remove`
* Removes the html of all the nodes in the collection from the DOM

##### `text`
* Accepts a string and adds it to the HTML element text content

##### `get`
* Takes in an index and fetches the HTML element at that index from the node collection

#### Event handling

##### `on`
* Accepts an event and a callback and adds the event handler to every element in the node array
```javascript
$("ul").on("click", () => {...})
```

##### `off`
* Accepts an event and a callback and removes the event handler from every element in the node array
