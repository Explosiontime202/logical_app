import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/constants/AppColors.dart';
import 'package:logical_app/level/AppLevel.dart';
import 'package:logical_app/level/AppLevelStatus.dart';
import 'package:logical_app/settings/AppSettingsStatus.dart';

class AppUndoButton extends StatelessWidget {
  final AppLevel level;
  final Function updatePlayground;

  AppUndoButton({@required this.level, @required this.updatePlayground}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.guiBackgroundColor,
      child: IconButton(
        icon: Icon(Icons.undo, size: Theme.of(context).iconTheme.size),
        onPressed: () {
          AppLevelStatus.of(level).undoMove();
          updatePlayground();
        },
        tooltip: AppSettingStatus.currentLanguage.level.undoButtonTooltip,
      ),
    );
  }
}
