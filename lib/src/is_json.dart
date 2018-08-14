import 'package:json_matcher/src/json.dart';
import 'package:matcher/matcher.dart';

import 'processing_matcher.dart';

Matcher isJson(string, [int limit = 100]) =>
    new ProcessingMatcher(equals(string, limit), (v) => json.decode(v));
