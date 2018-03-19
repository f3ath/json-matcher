import 'package:json_matcher/json_matcher.dart';
import 'package:test/test.dart';

class Foo {
  final String key;
  final String val;

  Foo(String this.key, String this.val);

  toJson() => {key: val};
}

class Bar {
  final Foo foo;

  Bar(Foo this.foo);

  toJson() => {'my_foo': foo};
}

void main() {
  test('JSON encoding is performed', () {
    final foo = new Foo('hello', 'world');
    final json = {'hello': 'world'};
    expect(foo, encodesToJson(json));
  });

  test('JSON encoding is performed for the value under test', () {
    final bar = new Bar(new Foo('hello', 'world'));
    final json = {
      'my_foo': {'hello': 'world'}
    };
    expect(bar, encodesToJson(json));
  });

  test('Matching works for strings', () {
    final string = '{"my_foo": {"hello": "world"}}";
    final json = {
      'my_foo': {'hello': 'world'}
    };
    expect(bar, encodesToJson(json));
  });
}
