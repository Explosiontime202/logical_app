import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:logical_app/level/AppLevel.dart';

class AppLevelExiter {
  final AppLevel level;

  AppLevelExiter({@required this.level}) : super();

  void exitLevel(BuildContext context) {
    Navigator.of(context).pop();
    // TODO: Either delete the LevelSate or delete it and safe the data for storage and information purposes.
  }
}
