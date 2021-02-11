import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/level/AppHighlighter.dart';
import 'package:logical_app/level/AppLevelExiter.dart';
import 'package:logical_app/level/AppLevelStatus.dart';
import 'package:logical_app/level/AppLevel.dart';
import 'package:logical_app/constants/AppColors.dart';
import 'package:logical_app/level/AppLevelRestarter.dart';

class AppTestCorrectButton extends StatelessWidget {
  final AppLevel level;
  final AppLevelRestarter restarter;
  final AppLevelExiter levelExiter;
  final AppHighlighter highlighter;

  AppTestCorrectButton(
      {@required this.level, @required this.restarter, @required this.levelExiter, @required this.highlighter})
      : super();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.check,
        color: AppColors.checkColor,
        size: Theme.of(context).iconTheme.size,
      ),
      onPressed: () {
        AppLevelStatus levelStatus = AppLevelStatus.of(level);
        bool test = levelStatus.testCorrect();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Test result"),
              content: Text(test
                  ? "You have successfully solved this leevl. Great job!"
                  : "That's not completly correct. Please try further to find the correct solution."),
              actions: _generateActionButtons(context, test),
            );
          },
        );
      },
    );
  }

  List<Widget> _generateActionButtons(BuildContext context, bool test) {
    if (test) {
      return <Widget>[
        FlatButton(
          onPressed: () {
            restarter.restart();
            Navigator.of(context).pop();
          },
          child: Text("Replay"),
        ),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
              levelExiter.exitLevel(context);
            },
            child: Text("Exit"))
      ];
    } else {
      return [
        FlatButton(
          onPressed: () {
            restarter.restart();
            Navigator.of(context).pop();
          },
          child: Text("Replay"),
        ),
        FlatButton(
          onPressed: () {
            highlighter.highlightFalseBlocks();
            Navigator.of(context).pop();
          },
          child: Text("Continue"),
        ),
      ];
    }
  }
}
