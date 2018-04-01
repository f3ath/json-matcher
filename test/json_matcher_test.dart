import 'package:json_matcher/json_matcher.dart';
import 'package:test/test.dart';

class Foo {
  final String key;
  final String val;

  Foo(String this.key, String this.val);

  Map<String, String> toJson() => {key: val};
}

void main() {
  test('JSON encoding is performed', () {
    final foo = new Foo('hello', 'world');
    final json = {'hello': 'world'};
    expect(foo, encodesToJson(json));
  });

  test('Strings can be matched, key order does not matter', () {
    final string = '{"foo": "bar", "hello": "world"}';
    final json = {'hello': 'world', 'foo': 'bar'};
    expect(string, isJson(json));
  });
}
