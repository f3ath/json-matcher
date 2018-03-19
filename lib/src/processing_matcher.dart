import 'package:matcher/matcher.dart';

class ProcessingMatcher implements Matcher {
  final Matcher _matcher;
  final _fn;

  ProcessingMatcher(Matcher this._matcher, this._fn(item));

  @override
  Description describe(Description description) {
    return _matcher.describe(description);
  }

  @override
  Description describeMismatch(item, Description mismatchDescription,
          Map matchState, bool verbose) =>
      _matcher.describeMismatch(
          _fn(item), mismatchDescription, matchState, verbose);

  @override
  bool matches(item, Map matchState) =>
      _matcher.matches(_fn(item), matchState);
}
