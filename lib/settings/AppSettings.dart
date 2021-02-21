import 'package:flutter/material.dart';
import 'package:logical_app/constants/AppColors.dart';
import 'package:logical_app/settings/AppSettingsStatus.dart';

import 'AppColorModeSwitch.dart';
import 'AppLanguageSwitch.dart';
import 'AppSettingsContainer.dart';

class AppSettings extends StatefulWidget {
  final Function updateMainPage;

  AppSettings({@required this.updateMainPage}) : super();

  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppSettingStatus.currentLanguage.settingsGui["title"])),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            widget.updateMainPage();
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            AppSettingsContainer(child: AppColorModeSwitch()),
            AppSettingsContainer(child: AppLanguageSwitch(updateSettingsScreen: update)),
          ],
        ),
      ),
    );
  }

  void update() {
    setState(() {});
  }
}
