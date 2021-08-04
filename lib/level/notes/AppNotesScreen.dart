import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/lang/AppLanguage.dart';
import 'package:logical_app/level/AppLevel.dart';
import 'package:logical_app/level/AppLevelStatus.dart';
import 'package:logical_app/level/AppRuleList.dart';
import 'package:logical_app/settings/AppSettings.dart';
import 'package:logical_app/settings/AppSettingsStatus.dart';

class AppNotesScreen extends StatefulWidget {
  final AppLevel level;

  AppNotesScreen({required this.level}) : super();

  @override
  _AppNotesScreenState createState() => _AppNotesScreenState();
}

class _AppNotesScreenState extends State<AppNotesScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AppLevelStatus.of(widget.level).notesController;
  }

  @override
  Widget build(BuildContext context) {
    NotesGuiStrings gui = AppSettingStatus.currentLanguage.notes;

    return Scaffold(
      appBar: AppBar(
        title: Text(gui.title + ": " + widget.level.name),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String choice) {
              switch (choice) {
                case "Settings":
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AppSettings(
                            updateParentPage: _update,
                          )));
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
            Divider(),
            ListTile(
              title: Text(gui.spaceForNotes),
            ),
            TextField(
              decoration: InputDecoration(hintText: gui.hintText),
              controller: _controller,
              keyboardType: TextInputType.multiline,
              minLines: null,
              maxLines: null,
              autocorrect: false,
              onTap: () => FocusScope.of(context).unfocus(),
              scrollPhysics: NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }

  void _update() {
    setState(() {});
  }
}

class AppNotesTile extends StatefulWidget {
  const AppNotesTile({Key? key}) : super(key: key);

  @override
  _AppNotesTileState createState() => _AppNotesTileState();
}

class _AppNotesTileState extends State<AppNotesTile> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
