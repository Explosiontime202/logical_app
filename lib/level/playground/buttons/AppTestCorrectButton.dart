import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/level/AppLevelExiter.dart';
import 'package:logical_app/level/AppLevelStatus.dart';
import 'package:logical_app/level/AppLevel.dart';
import 'package:logical_app/constants/AppColors.dart';
import 'package:logical_app/level/AppLevelRestarter.dart';
import 'package:logical_app/settings/AppSettingsStatus.dart';
import 'package:logical_app/util/Pair.dart';

class AppTestCorrectButton extends StatelessWidget {
  final AppLevel level;
  final AppLevelRestarter restarter;
  final AppLevelExiter levelExiter;

  AppTestCorrectButton({@required this.level, @required this.restarter, @required this.levelExiter}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.guiBackgroundColor,
      child: IconButton(
        icon: Icon(
          Icons.check,
          color: AppColors.checkColor,
          size: Theme.of(context).iconTheme.size,
        ),
        onPressed: () {
          AppLevelStatus levelStatus = AppLevelStatus.of(level);
          Pair<bool, List<Map<String, int>>> testResult = levelStatus.testCorrect();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Test result"),
                content: Text(testResult.s
                    ? "You have successfully solved this leevl. Great job!"
                    : "That's not completly correct. Please try further to find the correct solution."),
                actions: _generateActionButtons(context, testResult.s, testResult.t),
              );
            },
          );
        },
        tooltip: AppSettingStatus.currentLanguage.level.correctButtonTooltip,
      ),
    );
  }

  List<Widget> _generateActionButtons(BuildContext context, bool test, List<Map<String, int>> falseBlocks) {
    if (test) {
      return <Widget>[
        TextButton(
            onPressed: () {
              restarter.restart();
              Navigator.of(context).pop();
            },
            child: Text("Replay")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              levelExiter.exitLevel(context);
            },
            child: Text("Exit"))
      ];
    } else {
      return [
        TextButton(
          onPressed: () {
            restarter.restart();
            Navigator.of(context).pop();
          },
          child: Text("Replay"),
        ),
        TextButton(
          onPressed: () {
            AppLevelStatus.of(level).highlightBlocks(falseBlocks);
            Navigator.of(context).pop();
          },
          child: Text("Continue"),
        ),
      ];
    }
  }
}
