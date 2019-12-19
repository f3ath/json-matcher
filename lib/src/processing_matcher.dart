import 'package:matcher/matcher.dart';

typedef Processor = dynamic Function(dynamic);

class ProcessingMatcher implements Matcher {
  final Matcher _matcher;
  final Processor _processor;

  ProcessingMatcher(this._matcher, this._processor);

  @override
  Description describe(Description description) {
    return _matcher.describe(description);
  }

  @override
  Description describeMismatch(item, Description mismatchDescription,
          Map matchState, bool verbose) =>
      _matcher.describeMismatch(
          _processor(item), mismatchDescription, matchState, verbose);

  @override
  bool matches(item, Map matchState) =>
      _matcher.matches(_processor(item), matchState);
}
