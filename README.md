## JSON Matchers for unit tests

Provides:
 - `encodesToJson()` matcher which checks if the value encodes to expected JSON
 - `isJson()` matcher which checks if the string is expected JSON

```dart
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
```
