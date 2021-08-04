import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logical_app/level/AppLevel.dart';
import 'package:logical_app/level/AppLevelRestarter.dart';
import 'package:logical_app/settings/AppSettingsStatus.dart';

class AppRestartButton extends StatelessWidget {
  final AppLevel level;
  final AppLevelRestarter restarter;

  AppRestartButton({required this.restarter, required this.level}) : super();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(CupertinoIcons.restart),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Are you sure?"),
              content: Text(
                  "Are you sure that you want to restart the level? This will delete all your progress in this level so far."),
              actions: [
                TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("No")),
                TextButton(
                    onPressed: () {
                      restarter.restart();
                      Navigator.of(context).pop();
                    },
                    child: Text("Yes"))
              ],
            );
          },
        );
      },
      tooltip: AppSettingStatus.currentLanguage.level.restartButtonToolTip,
    );
  }
}
