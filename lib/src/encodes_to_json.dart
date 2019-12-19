import 'package:json_matcher/src/json.dart';
import 'package:matcher/matcher.dart';

import 'processing_matcher.dart';

/// Matches if the value json-encodes to [object]
Matcher encodesToJson(object, [int limit = 100]) => ProcessingMatcher(
    equals(object, limit), (v) => json.decode(json.encode(v)));
