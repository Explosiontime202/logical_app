import 'dart:core';

class AppLanguage {
  final String short;
  final String full;
  final Map<String, dynamic> gui;
  final Map<String, String> settingsGui;
  final Map<String, String> homeGui;
  final Map<String, String> levelGui;
  final Map<String, String> notesGui;
  LevelGuiStrings? _levelGuiStrings;
  NotesGuiStrings? _notesGuiStrings;
  HomeGuiStrings? _homeGuiStrings;
  SettingsGuiStrings? _settingsGuiStrings;

  // Todo: Add more language features.

  AppLanguage({required this.short, required this.full, required this.gui})
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

  LevelGuiStrings get level => _levelGuiStrings!;

  NotesGuiStrings get notes => _notesGuiStrings!;

  HomeGuiStrings get home => _homeGuiStrings!;

  SettingsGuiStrings get settings => _settingsGuiStrings!;

  static Map<String, String> _castGui(dynamic input) {
    return Map.castFrom(input).cast<String, String>();
  }
}

class LevelGuiStrings {
  final Map<String, String> levelGui;

  LevelGuiStrings._({required this.levelGui});

  String get correctButtonTooltip {
    String? correctButton = levelGui["correct_button"];
    assert(correctButton != null);
    return correctButton!;
  }

  String get undoButtonTooltip {
    String? undoButton = levelGui["undo_button"];
    assert(undoButton != null);
    return undoButton!;
  }

  String get notesButtonTooltip {
    String? notesButton = levelGui["notes_button"];
    assert(notesButton != null);
    return notesButton!;
  }

  String get restartButtonToolTip {
    String? restartButton = levelGui["restart_button"];
    assert(restartButton != null);
    return restartButton!;
  }

  String get introductionTextButtonTooltip {
    String? introductionButton = levelGui["introduction_button"];
    assert(introductionButton != null);
    return introductionButton!;
  }

  String get ruleListInfoText {
    String? ruleListInfoText = levelGui["rule_list_info_text"];
    assert(ruleListInfoText != null);
    return ruleListInfoText!;
  }
}

class NotesGuiStrings {
  final Map<String, String> notesGui;

  NotesGuiStrings._({required this.notesGui});

  String get spaceForNotes {
    String? spaceForNotes = notesGui["space_for_notes"];
    assert(spaceForNotes != null);
    return spaceForNotes!;
  }

  String get title {
    String? title = notesGui["title"];
    assert(title != null);
    return title!;
  }

  String get hintText {
    String? hintText = notesGui["hintText"];
    assert(hintText != null);
    return hintText!;
  }
}

class HomeGuiStrings {
  final Map<String, String> homeGui;

  HomeGuiStrings._({required this.homeGui});

  String get title {
    String? title = homeGui["title"];
    assert(title != null);
    return title!;
  }
}

class SettingsGuiStrings {
  final Map<String, String> settingsGui;

  SettingsGuiStrings._({required this.settingsGui});

  String get title {
    String? title = settingsGui["title"];
    assert(title != null);
    return title!;
  }

  String get chooseLanguage {
    String? chooseLanguage = settingsGui["choose_language"];
    assert(chooseLanguage != null);
    return chooseLanguage!;
  }
}
