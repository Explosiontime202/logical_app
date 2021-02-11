import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/level/AppLevel.dart';

class AppPlaygroundInformation extends StatelessWidget {
  final AppLevel level;

  AppPlaygroundInformation({@required this.level}) : super();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext buildContext) {
            return AlertDialog(
              title: Text(level.name),
              content: Text(level.introductionText),
              actions: [
                FlatButton(
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
    );
  }
}
