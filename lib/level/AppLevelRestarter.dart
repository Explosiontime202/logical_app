import 'dart:core';

import 'package:flutter/cupertino.dart';

import 'package:logical_app/level/AppLevel.dart';
import 'package:logical_app/level/AppLevelStatus.dart';

class AppLevelRestarter {
  final Function updateLevelScreen;
  final AppLevel level;

  AppLevelRestarter({@required this.level, @required this.updateLevelScreen}) : super();


  void restart() {
    updateLevelScreen();
    AppLevelStatus.of(level).restart();
  }
}
