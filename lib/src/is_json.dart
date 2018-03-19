import 'dart:convert';

import 'package:matcher/matcher.dart';

import 'processing_matcher.dart';

Matcher isJson(json, [int limit = 100]) =>
    new ProcessingMatcher(equals(json, limit), (v) => JSON.decode(v));
