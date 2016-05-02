@JS()
library js_util.test;

import 'package:js/js.dart';
import 'package:js_util/js_util.dart';
import 'package:test/test.dart';

@JS('JSON.stringify')
external String stringify(Object json);

void main() {
  group('js_util tests', () {
    test('defineProperty test', () {
      final obj = newObject();
      defineProperty(
          obj, 'foo', new PropertyDescription(enumerable: true, value: 1));
      defineProperty(
          obj, 'bar', new PropertyDescription(enumerable: false, value: 2));

      expect(stringify(obj), '{"foo":1}');
    });

    test('newObject/setValue/getValue test', () {
      final obj = newObject();
      setValue(obj, 'foo', 1);
      setValue(obj, 'bar', 2);

      expect(getValue(obj, 'foo'), equals(1));
      expect(getValue(obj, 'bar'), equals(2));
    });

    test('toJS test', () {
      final jsObj = toJS({
        'people': [
          {'firstName': 'Kwang Yul', 'lastName': 'Seo'},
          {'firstName': 'DoHyung', 'lastName': 'Kim'},
          {'firstName': 'Kyusun', 'lastName': 'Kim'}
        ]
      });

      final people = getValue(jsObj, 'people');
      expect(getValue(people[0], 'firstName'), equals('Kwang Yul'));
      expect(getValue(people[0], 'lastName'), equals('Seo'));
      expect(getValue(people[1], 'firstName'), equals('DoHyung'));
      expect(getValue(people[1], 'lastName'), equals('Kim'));
      expect(getValue(people[2], 'firstName'), equals('Kyusun'));
      expect(getValue(people[2], 'lastName'), equals('Kim'));
    });
  });
}
