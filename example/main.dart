import 'package:json_matcher/json_matcher.dart';
import 'package:test/test.dart';

class Foo {
  final String key;
  final String val;

  Foo(String this.key, String this.val);

  toJson() => {key: val}; // This object can be JSON-encoded
}

void main() {
  test('JSON encoding is performed', () {
    final foo = new Foo('hello', 'world');
    final json = {'hello': 'world'};
    expect(foo, encodesToJson(json)); // Ensuring foo encodes to proper JSON
  });

  test('Strings can be matched, key order does not matter', () {
    final string = '{"foo": "bar", "hello": "world"}';
    final json = {'hello': 'world', 'foo': 'bar'};
    expect(string, isJson(json));
  });
}
