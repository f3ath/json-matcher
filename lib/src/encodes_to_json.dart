import 'dart:convert';

import 'package:matcher/matcher.dart';

import 'processing_matcher.dart';

Matcher encodesToJson(object, [int limit = 100]) => new ProcessingMatcher(
    equals(object, limit), (v) => json.decode(json.encode(v)));
