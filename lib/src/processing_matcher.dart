import 'package:matcher/matcher.dart';

typedef dynamic Process(item);

class ProcessingMatcher implements Matcher {
  final Matcher _matcher;
  final Process _process;

  ProcessingMatcher(Matcher matcher, Process process)
      : _matcher = matcher,
        _process = process;

  @override
  Description describe(Description description) {
    return _matcher.describe(description);
  }

  @override
  Description describeMismatch(item, Description mismatchDescription,
      Map matchState, bool verbose) =>
      _matcher.describeMismatch(
          _process(item), mismatchDescription, matchState, verbose);

  @override
  bool matches(item, Map matchState) =>
      _matcher.matches(_process(item), matchState);
}