import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:developer' as dev;

import 'package:flutter/services.dart';
import 'package:logical_app/settings/AppSettingsStatus.dart';

import 'AppLanguage.dart';

class AppLanguages {
  AppLanguages._() : super();
  static const String _PREFIX = "data/lang/";
  static late List<AppLanguage> _languages;
  static bool isLoaded = false;
  static Function update = () {};

  static Future<void> init() async {
    Map<String, dynamic> common = await _loadAndDecode("common.json");
    List<String> langFilesStrings = List.castFrom<dynamic, String>(common["lang_files"]);
    List<Map<String, dynamic>> langFiles = [];
    for (String file in langFilesStrings) langFiles.add(await _loadAndDecode(file));
    for (Map<String, dynamic> file in langFiles) dev.log(file.toString());
    _languages = await Stream.fromIterable(langFiles)
        .map((lang) => AppLanguage(full: lang["name"], short: lang["short"], gui: lang["gui"]))
        .toList();
    dev.log(_languages.toString());

    AppSettingStatus.currentLanguage = _languages[0];
    isLoaded = true;
    update();
  }

  static Future<Map<String, dynamic>> _loadAndDecode(String file) async =>
      jsonDecode(await rootBundle.loadString(_PREFIX + file));

  static List<AppLanguage> get languages => _languages;
}
