import 'dart:convert';
import 'dart:core';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:logical_app/level/AppLevel.dart';

class AppLevelManager {
  static List<AppLevel> _levels;

  static Future<void> init(Function update) async {
    String inputString = await rootBundle.loadString("data/LevelData.json");
    Map<String, dynamic> input = jsonDecode(inputString);
    List<Map<String, dynamic>> levelsData = List.castFrom<dynamic, Map<String, dynamic>>(input["levels"]);
    _levels = List.generate(levelsData.length, (index) => AppLevel.of(levelsData[index]));
    update();
  }

  static int get size => _levels != null ? _levels.length : 0;

  static AppLevel getLevel(int index) => _levels[index];
}
