import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/constants/AppColors.dart';
import 'package:logical_app/level/AppLevel.dart';
import 'package:logical_app/settings/AppSettingsStatus.dart';

class AppPlaygroundInformationButton extends StatelessWidget {
  final AppLevel level;

  AppPlaygroundInformationButton({required this.level}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.guiBackgroundColor,
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext buildContext) {
              return AlertDialog(
                title: Text(level.name),
                content: Text(level.introductionText),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Close"),
                  ),
                ],
              );
            },
          );
        },
        icon: Icon(
          Icons.info,
          size: MediaQuery.of(context).size.width / 8,
        ),
        tooltip: AppSettingStatus.currentLanguage.level.introductionTextButtonTooltip,
      ),
    );
  }
}
