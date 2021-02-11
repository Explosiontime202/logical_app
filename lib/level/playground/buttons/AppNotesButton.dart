import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/level/AppLevel.dart';
import 'package:logical_app/level/notes/AppNotesScreen.dart';

class AppNotesButton extends StatelessWidget {
  final AppLevel level;
  final Function updateLevelScreen;

  AppNotesButton({@required this.level, @required this.updateLevelScreen}) : super();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.assignment, size: IconTheme.of(context).size),
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return AppNotesScreen(level: level);
            },
          ),
        );
        updateLevelScreen();
      },
    );
  }
}
