import 'dart:core';
import 'dart:developer' as dev;
import 'package:flutter/cupertino.dart';

class AppLanguage {
  final String short;
  final String full;
  final Map<String, dynamic> gui;
  final Map<String, String> settingsGui;
  final Map<String, String> homeGui;

  // Todo: Add more language features.

  AppLanguage({@required this.short, @required this.full, @required this.gui})
      : settingsGui = Map.castFrom(gui["settings"]).cast<String, String>(),
        homeGui = Map.castFrom(gui["home"]).cast<String, String>(),
        super() {
    dev.log(settingsGui.toString());
    dev.log(homeGui.toString());
  }

  @override
  String toString() {
    return "{$short:$full}";
  }
}
