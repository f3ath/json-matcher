import 'package:json_matcher/src/json.dart';
import 'package:matcher/matcher.dart';

import 'processing_matcher.dart';

/// Matches if the given string json-decodes to [object]
Matcher isJson(object, [int limit = 100]) =>
    ProcessingMatcher(equals(object, limit), (v) => json.decode(v));
