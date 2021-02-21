import 'dart:core';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:logical_app/lang/AppLanguage.dart';
import 'package:logical_app/lang/AppLanguages.dart';
import 'package:logical_app/settings/AppSettingsStatus.dart';

class AppLanguageSwitch extends StatefulWidget {
  final Function updateSettingsScreen;

  AppLanguageSwitch({@required this.updateSettingsScreen}) : super();

  @override
  _AppLanguageSwitchState createState() => _AppLanguageSwitchState();
}

class _AppLanguageSwitchState extends State<AppLanguageSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppSettingStatus.currentLanguage.settingsGui["choose_language"] + ": ",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        DropdownButton<AppLanguage>(
          onChanged: (lang) {
            AppSettingStatus.currentLanguage = lang;
            widget.updateSettingsScreen();
          },
          items: AppLanguages.languages
              .map(
                (AppLanguage lang) => DropdownMenuItem<AppLanguage>(
                  child: Text(
                    lang.short,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  value: lang,
                ),
              )
              .toList(),
          value: AppSettingStatus.currentLanguage,
        ),
      ],
    );
  }
}
