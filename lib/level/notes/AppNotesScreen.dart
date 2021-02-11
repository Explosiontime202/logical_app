import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/level/AppLevel.dart';
import 'package:logical_app/level/AppLevelStatus.dart';
import 'package:logical_app/level/AppRuleList.dart';
import 'package:logical_app/settings/AppSettings.dart';

class AppNotesScreen extends StatefulWidget {
  final AppLevel level;

  AppNotesScreen({@required this.level}) : super();

  @override
  _AppNotesScreenState createState() => _AppNotesScreenState();
}

class _AppNotesScreenState extends State<AppNotesScreen> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AppLevelStatus.of(widget.level).notesController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes: " + widget.level.name),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String choice) {
              switch (choice) {
                case "Settings":
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AppSettings()));
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            AppRuleList(level: widget.level),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor)),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.multiline,
                minLines: null,
                maxLines: null,
                autocorrect: false,
                onTap: () => FocusScope.of(context).unfocus(),
                scrollPhysics: NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
