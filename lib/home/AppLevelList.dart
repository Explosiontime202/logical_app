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
      itemCount: AppLevelManager.size,
      itemBuilder: (BuildContext context, int index) {
        return AppLevelManager.getLevel(index).toListTile(context);
      },
    );
  }
}
