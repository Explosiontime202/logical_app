import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'dart:developer' as dev;
import 'package:flutter/services.dart';

import 'AppLanguage.dart';

class AppLanguages {
  AppLanguages._() : super();
  static const String _PREFIX = "data/lang/";
  static List<AppLanguage> _languages;

  static Future<void> init() async {

    Map<String, dynamic> common = await _loadAndDecode("common.json");
    List<String> langFilesStrings = List.castFrom<dynamic, String>(common["lang_files"]);
    List<Map<String, dynamic>> langFiles = List<Map<String, dynamic>>();
    for (String file in langFilesStrings) langFiles.add(await _loadAndDecode(file));
    for (Map<String, dynamic> file in langFiles) dev.log(file.toString());
    _languages = await Stream.fromIterable(langFiles)
        .map((lang) => AppLanguage(full: lang["name"], short: lang["short"]))
        .toList();
    dev.log(_languages.toString());
  }

  static Future<Map<String, dynamic>> _loadAndDecode(String file) async =>
      jsonDecode(await rootBundle.loadString(_PREFIX + file));
}
