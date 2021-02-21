import 'package:flutter/material.dart';
import 'package:logical_app/level/AppLevelExiter.dart';
import 'package:logical_app/level/playground/AppPlayground.dart';
import 'package:logical_app/level/playground/buttons/AppRestartButton.dart';
import 'package:logical_app/settings/AppSettings.dart';

import 'AppLevel.dart';
import 'AppRuleList.dart';
import 'AppLevelRestarter.dart';

class AppLevelScreen extends StatefulWidget {
  final AppLevel level;

  AppLevelScreen({@required this.level}) : super();

  @override
  _AppLevelScreenState createState() => _AppLevelScreenState();
}

class _AppLevelScreenState extends State<AppLevelScreen> {
  AppLevelRestarter _restarter;
  AppLevelExiter _exiter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.level.name),
        actions: [
          AppRestartButton(
            level: widget.level,
            restarter: _getRestarter(),
          ),
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
      body: ListView(
        physics: PageScrollPhysics(),
        children: [
          AppPlayground(
            level: widget.level,
            restarter: _getRestarter(),
            levelExiter: _getExiter(),
            updateLevelScreen: _update,
          ),
          AppRuleList(level: widget.level),
        ],
      ),
    );
  }

  void _update() {
    setState(() {});
  }

  AppLevelRestarter _getRestarter() {
    if (_restarter == null) {
      _restarter = AppLevelRestarter(level: widget.level, updateLevelScreen: _update);
    }
    return _restarter;
  }

  AppLevelExiter _getExiter() {
    if (_exiter == null) _exiter = AppLevelExiter(level: widget.level);
    return _exiter;
  }
}
