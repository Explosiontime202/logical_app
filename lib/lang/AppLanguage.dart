import 'dart:core';
import 'package:flutter/cupertino.dart';

class AppLanguage {
  final String short;
  final String full;
  final Map<String, dynamic> gui;
  final Map<String, String> settingsGui;
  final Map<String, String> homeGui;
  final Map<String, String> levelGui;
  final Map<String, String> notesGui;
  LevelGuiStrings _levelGuiStrings;
  NotesGuiStrings _notesGuiStrings;
  HomeGuiStrings _homeGuiStrings;
  SettingsGuiStrings _settingsGuiStrings;

  // Todo: Add more language features.

  AppLanguage({@required this.short, @required this.full, @required this.gui})
      : settingsGui = _castGui(gui["settings"]),
        homeGui = _castGui(gui["home"]),
        levelGui = _castGui(gui["level"]),
        notesGui = _castGui(gui["notes"]),
        super() {
    _levelGuiStrings = LevelGuiStrings._(levelGui: levelGui);
    _notesGuiStrings = NotesGuiStrings._(notesGui: notesGui);
    _homeGuiStrings = HomeGuiStrings._(homeGui: homeGui);
    _settingsGuiStrings = SettingsGuiStrings._(settingsGui: settingsGui);
  }

  @override
  String toString() {
    return "{$short:$full}";
  }

  LevelGuiStrings get level => _levelGuiStrings;

  NotesGuiStrings get notes => _notesGuiStrings;

  HomeGuiStrings get home => _homeGuiStrings;

  SettingsGuiStrings get settings => _settingsGuiStrings;

  static Map<String, String> _castGui(dynamic input) {
    return Map.castFrom(input).cast<String, String>();
  }
}

class LevelGuiStrings {
  final Map<String, String> levelGui;

  LevelGuiStrings._({@required this.levelGui});

  String get correctButtonTooltip => levelGui["correct_button"];

  String get undoButtonTooltip => levelGui["undo_button"];

  String get notesButtonTooltip => levelGui["notes_button"];

  String get restartButtonToolTip => levelGui["restart_button"];

  String get introductionTextButtonTooltip => levelGui["introduction_button"];

  String get ruleListInfoText => levelGui["rule_list_info_text"];
}

class NotesGuiStrings {
  final Map<String, String> notesGui;

  NotesGuiStrings._({@required this.notesGui});

  String get spaceForNotes => notesGui["space_for_notes"];

  String get title => notesGui["title"];

  String get hintText => notesGui["hintText"];
}

class HomeGuiStrings {
  final Map<String, String> homeGui;

  HomeGuiStrings._({@required this.homeGui});

  String get title => homeGui["title"];
}

class SettingsGuiStrings {
  final Map<String, String> settingsGui;

  SettingsGuiStrings._({@required this.settingsGui});

  String get title => settingsGui["title"];

  String get chooseLanguage => settingsGui["choose_language"];
}
