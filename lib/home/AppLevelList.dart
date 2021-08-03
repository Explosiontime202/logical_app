import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logical_app/level/AppLevelManager.dart';

class AppLevelList extends StatefulWidget {
  @override
  _AppLevelListState createState() => _AppLevelListState();
}

class _AppLevelListState extends State<AppLevelList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: AppLevelManager.size * 2 - 1,
      itemBuilder: (BuildContext context, int index) {
        if (index % 2 == 1) {
          return Divider(
            indent: MediaQuery.of(context).size.width * 0.1,
            endIndent: MediaQuery.of(context).size.width * 0.1,
          );
        }
        return AppLevelManager.getLevel(index ~/ 2).toListTile(context);
      },
    );
  }
}
