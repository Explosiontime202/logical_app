import 'dart:core';

import 'package:flutter/material.dart';

import 'package:logical_app/level/AppLevelExiter.dart';
import 'package:logical_app/level/playground/AppPlaygroundNames.dart';
import 'package:logical_app/level/AppLevel.dart';
import 'package:logical_app/level/AppLevelRestarter.dart';
import 'package:logical_app/level/playground/buttons/AppNotesButton.dart';
import 'package:logical_app/level/playground/buttons/AppPlaygroundInformationButton.dart';
import 'package:logical_app/level/playground/buttons/AppTestCorrectButton.dart';
import 'package:logical_app/level/playground/buttons/AppUndoButton.dart';

import 'AppPlaygroundSqaure.dart';
import 'AppPlaygroundTappingField.dart';

class AppPlayground extends StatefulWidget {
  final AppLevel level;
  final AppLevelRestarter restarter;
  final AppLevelExiter levelExiter;
  final Function updateLevelScreen;

  AppPlayground(
      {required this.level, required this.restarter, required this.levelExiter, required this.updateLevelScreen})
      : super();

  @override
  _AppPlaygroundState createState() => _AppPlaygroundState();
}

class _AppPlaygroundState extends State<AppPlayground> {
  @override
  Widget build(BuildContext context) {
    return AppPlaygroundSquare(
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          AppPlaygroundSquare(
            child: AppPlaygroundInformationButton(level: widget.level),
          ),
          AppPlaygroundSquare(child: AppPlaygroundItems(level: widget.level, rot: true, index: 1)),
          AppPlaygroundSquare(child: AppPlaygroundItems(level: widget.level, rot: true, index: 2)),
          AppPlaygroundSquare(child: AppPlaygroundItems(level: widget.level, rot: true, index: 3)),
          AppPlaygroundSquare(child: AppPlaygroundItems(level: widget.level, rot: false, index: 0)),
          AppPlaygroundSquare(child: AppPlaygroundTappingField(level: widget.level, fieldIndex: 0)),
          AppPlaygroundSquare(child: AppPlaygroundTappingField(level: widget.level, fieldIndex: 1)),
          AppPlaygroundSquare(child: AppPlaygroundTappingField(level: widget.level, fieldIndex: 2)),
          AppPlaygroundSquare(child: AppPlaygroundItems(level: widget.level, rot: false, index: 3)),
          AppPlaygroundSquare(child: AppPlaygroundTappingField(level: widget.level, fieldIndex: 3)),
          AppPlaygroundSquare(child: AppPlaygroundTappingField(level: widget.level, fieldIndex: 4)),
          AppPlaygroundSquare(
              child: AppUndoButton(
            level: widget.level,
            updatePlayground: _update,
          )),
          AppPlaygroundSquare(child: AppPlaygroundItems(level: widget.level, rot: false, index: 2)),
          AppPlaygroundSquare(child: AppPlaygroundTappingField(level: widget.level, fieldIndex: 5)),
          AppPlaygroundSquare(
              child: AppNotesButton(
            level: widget.level,
            updateLevelScreen: widget.updateLevelScreen,
          )),
          AppPlaygroundSquare(
            child: AppTestCorrectButton(
              level: widget.level,
              restarter: widget.restarter,
              levelExiter: widget.levelExiter,
            ),
          ),
        ],
      ),
    );
  }

  void _update() {
    setState(() {});
  }
}
