import 'package:flutter/material.dart';
import 'package:logical_app/settings/AppSettingsStatus.dart';

import 'AppColorModeSwitch.dart';
import 'AppLanguageSwitch.dart';
import 'AppSettingsContainer.dart';

class AppSettings extends StatefulWidget {
  final Function updateParentPage;

  AppSettings({required this.updateParentPage}) : super();

  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppSettingStatus.currentLanguage.settings.title)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            widget.updateParentPage();
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            AppSettingsContainer(child: AppColorModeSwitch()),
            AppSettingsContainer(child: AppLanguageSwitch(updateSettingsScreen: _update)),
          ],
        ),
      ),
    );
  }

  void _update() {
    setState(() {});
  }
}
