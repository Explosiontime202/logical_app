import 'package:flutter/material.dart';
import 'AppColorMode.dart';

class AppColors {
  static ThemeMode get currentTheme {
    if (_colorMode == AppColorMode.DARK)
      return ThemeMode.dark;
    else
      return ThemeMode.light;
  }

  static late AppColorMode _colorMode;

  static Color get titleBackground => _getColor("title_background");

  static Color get background => _getColor("background");

  static Color get text => _getColor("text");

  static Color get accent => _getColor("accent");

  static Color get icon => text;

  static Color get dividerColor => _getColor("divider");

  static Color get iconColor => _getColor("icon");

  static const Color checkColor = Colors.green;

  static const Color x = Colors.red;

  static const Color kreis = Colors.blue;

  static Color get guiBackgroundColor => _getColor("guiBackground");

  static const Color highlightedBlock = Colors.orange;

  static Color _getColor(String name) {
    return _colorMode == AppColorMode.DARK ? _darkColors[name]! : _lightColors[name]!;
  }

  static Map<String, Color> _darkColors = {
    "background": Colors.blueGrey.shade900,
    "title_background": Colors.grey.shade800,
    "text": Colors.grey.shade300,
    "accent": Colors.blue,
    "divider": Colors.grey.shade300,
    "icon": Colors.grey.shade300,
    "guiBackground": Colors.blueGrey.shade800,
  };

  static Map<String, Color> _lightColors = {
    "background": Colors.grey.shade200,
    "title_background": Colors.grey.shade300,
    "text": Colors.grey.shade800,
    "accent": Colors.blue,
    "divider": Colors.grey.shade800,
    "icon": Colors.grey.shade800,
    "guiBackground": Colors.grey.shade300,
  };

  static ThemeData get darkTheme {
    AppColorMode mode = _colorMode;
    _colorMode = AppColorMode.DARK;
    ThemeData data = _themeData;
    _colorMode = mode;
    return data;
  }

  static ThemeData get lightTheme {
    AppColorMode mode = _colorMode;
    _colorMode = AppColorMode.LIGHT;
    ThemeData data = _themeData;
    _colorMode = mode;
    return data;
  }

  static ThemeData get _themeData => ThemeData(
        primaryColor: titleBackground,
        accentColor: accent,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: text),
          headline6: TextStyle(color: text),

          // For ListTile Text-Element
          caption: TextStyle(color: text),
          subtitle1: TextStyle(color: text),
        ),
        scaffoldBackgroundColor: background,
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.accent,
        ),
        popupMenuTheme: PopupMenuThemeData(
          color: titleBackground,
          textStyle: TextStyle(color: text),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: titleBackground,
          titleTextStyle: TextStyle(color: text),
          contentTextStyle: TextStyle(color: text),
        ),
        iconTheme: IconThemeData(color: iconColor, size: 65),
        primaryIconTheme: IconThemeData(color: icon),
        accentIconTheme: IconThemeData(color: Colors.blue),
        dividerColor: dividerColor,
        canvasColor: background,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: text),
          contentPadding: EdgeInsets.all(5),
        ),
      );

  static late Function _updateTheme;

  static setUpdateThemeFunction(Function updateTheme) => _updateTheme = updateTheme;

  static void toggleTheme() {
    _colorMode = _colorMode.other;
    _updateTheme();
  }

  static void init() {
    _colorMode = AppColorMode.DARK;
  }
}
