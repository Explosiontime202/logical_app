import 'package:flutter/material.dart';
import 'package:logical_app/constants/AppColors.dart';

import 'AppColorModeSwitch.dart';
import 'AppLanguageSwitch.dart';

class AppSettings extends StatefulWidget {
  AppSettings() : super();

  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Settings")),
      ),
      body: Center(
        child: Column(
          children: [
            AppColorModeSwitch(),
            AppLanguageSwitch()
          ],
        ),
      ),
    );
  }
}
