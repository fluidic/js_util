# js_util

[![Build Status](https://travis-ci.org/fluidic/js_util.svg?branch=master)](https://travis-ci.org/fluidic/js_util)

Utilities to access JavaScript from Dart.

* toJS(o): Converts a Dart object to a JavaScript object.
* newObject(): Creates a new JavaScript object.
* defineProperty(o, String prop, PropertyDescription desc): A wrapper for [Object.defineProperty][defineProperty]
* getValue(o, String prop): Returns `o[prop]`.
* setValue(o, String prop, value): Performs `o[prop] = value`.

These utilities are of great help if a JavaScript API takes a JavaScript object
with keys that are not fixed because [js][js] package does not let you create a
JavaScript object without declaring a Dart class with `@JS()` and `@anonymous`.

[defineProperty]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty
[js]: https://pub.dartlang.org/packages/js

## Getting Started

Include `js_util.js` in index.html to use js_util functions.

```html
<html>
  <head>
    <script async src="packages/js_util/dist/js_util.js"></script>
    <script async src="packages/browser/dart.js"></script>
  </head>
</html>
```

## Usage

A simple usage example:

```dart
final obj = newObject();
defineProperty(obj, 'foo', new PropertyDescription(enumerable: true, value: 1));
defineProperty(obj, 'bar', new PropertyDescription(enumerable: false, value: 2));
```

```dart
final obj = newObject();
setValue(obj, 'foo', 1);
setValue(obj, 'bar', 2);

print(getValue(obj, 'foo')); // 1
print(getValue(obj, 'bar')); // 2
```

```dart
final jsObj = toJS({
  'people': [
    {'firstName': 'Kwang Yul', 'lastName': 'Seo'},
    {'firstName': 'DoHyung', 'lastName': 'Kim'},
    {'firstName': 'Kyusun', 'lastName': 'Kim'}
  ]
});

final people = getValue(jsObj, 'people');
print(getValue(people[0], 'firstName')); // 'Kwang Yul'
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/ProtoCatTeam/js_util/issues
