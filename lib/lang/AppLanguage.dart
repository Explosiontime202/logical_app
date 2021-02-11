import 'dart:core';

import 'package:flutter/cupertino.dart';

class AppLanguage {
  final String short;
  final String full;

  // Todo: Add more language features.

  AppLanguage({@required this.short, @required this.full}) : super();

  @override
  String toString() {
    return "{$short:$full}";
  }
}
