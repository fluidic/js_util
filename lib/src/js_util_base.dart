// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library js_util.base;

import 'package:js/js.dart';
import 'package:quiver_iterables/iterables.dart';

// js_util library uses the technique described in
// https://github.com/dart-lang/sdk/issues/25053
// because dart2js compiler does not support [] operator.

@JS()
@anonymous
class Description {
  external factory Description(
      {bool configurable, bool enumerable, value, bool writable});
}

/// A wrapper for https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty
@JS('Object.defineProperty')
external void defineProperty(o, String prop, Description description);

/// Returns `o[prop]`.
@JS('JsUtil.getProperty')
external void getProperty(o, String prop);

/// Creates a new JavaScript object.
@JS('JsUtil.newObject')
external dynamic newObject();

/// Returns `o[key]`.
getValue(o, String key) => getProperty(o, key);

/// Performs `o[key] = value`.
void setValue(o, String key, value) {
  defineProperty(o, key, new Description(value: value));
}

/// Converts a Dart object to a JavaScript object.
///
/// For example, you can convert a Dart [Map] to a JavaScript object.
///
///     final jsObj = toJS({
///       'people': [
///         {'firstName': 'Kwang Yul', 'lastName': 'Seo'},
///         {'firstName': 'DoHyung', 'lastName': 'Kim'},
///         {'firstName': 'Kyusun', 'lastName': 'Kim'}
///       ]
///     });
///
toJS(o) {
  if (o is Map) {
    final newObj = newObject();
    for (final keyValuePair in zip([o.keys, o.values])) {
      setValue(newObj, keyValuePair[0], toJS(keyValuePair[1]));
    }
    return newObj;
  } else if (o is List) {
    return o.map((e) => toJS(e)).toList();
  } else {
    return o;
  }
}
