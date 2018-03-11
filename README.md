## JSON Matcher for unit tests

Provides encodesToJson() matcher which checks if the value encodes to a certain JSON. 

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
    expect(foo, encodesToJson(json)); // Ensuring foo encodes to a proper JSON
  });
}
```