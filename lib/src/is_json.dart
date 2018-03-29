import 'package:json_matcher/src/json.dart';
import 'package:matcher/matcher.dart';

import 'processing_matcher.dart';

Matcher isJson(val, [int limit = 100]) =>
    new ProcessingMatcher(equals(val, limit), (v) => json.decode(v));
