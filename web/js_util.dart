// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:js_util/js_util.dart';

void main() {
  final jsObj = toJS({
    'people': [
      {'firstName': 'Kwang Yul', 'lastName': 'Seo'},
      {'firstName': 'DoHyung', 'lastName': 'Kim'},
      {'firstName': 'Kyusun', 'lastName': 'Kim'}
    ]
  });

  final people = getValue(jsObj, 'people');
  final firstPerson = people[0];
  final text =
      '${getValue(firstPerson, "firstName")} ${getValue(firstPerson, "lastName")}';
  document.querySelector('#container').innerHtml = text;
}
