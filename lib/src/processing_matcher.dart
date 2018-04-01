import 'package:matcher/matcher.dart';

typedef dynamic Processor(dynamic val);

class ProcessingMatcher implements Matcher {
  final Matcher _matcher;
  final Processor _fn;

  ProcessingMatcher(Matcher this._matcher, dynamic this._fn(dynamic item));

  @override
  Description describe(Description description) {
    return _matcher.describe(description);
  }

  @override
  Description describeMismatch(dynamic item, Description mismatchDescription,
          Map matchState, bool verbose) =>
      _matcher.describeMismatch(
          _fn(item), mismatchDescription, matchState, verbose);

  @override
  bool matches(dynamic item, Map matchState) => _matcher.matches(_fn(item), matchState);
}
