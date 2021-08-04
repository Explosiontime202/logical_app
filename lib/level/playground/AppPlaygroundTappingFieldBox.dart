import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/constants/AppBorderWidth.dart';
import 'package:logical_app/constants/AppColors.dart';
import 'package:logical_app/level/AppLevel.dart';
import 'package:logical_app/level/AppLevelStatus.dart';

class AppPlaygroundTappingFieldBox extends StatefulWidget {
  final AppLevel level;
  final int rowIndex;
  final int fieldIndex;
  final void Function(int) update;

  AppPlaygroundTappingFieldBox(
      {required this.level, required this.fieldIndex, required this.rowIndex, required this.update})
      : super();

  @override
  _AppPlaygroundTappingFieldBoxState createState() => _AppPlaygroundTappingFieldBoxState();
}

class _AppPlaygroundTappingFieldBoxState extends State<AppPlaygroundTappingFieldBox> {
  static const List<Map<String, dynamic>> _cosmetics = [
    {"text": "", "color": Colors.white}, // status == 0
    {"text": "X", "color": AppColors.x}, // status == 1
    {"text": "O", "color": AppColors.kreis} // status == 2
  ];

  @override
  Widget build(BuildContext context) {
    AppLevelStatus levelStatus = AppLevelStatus.of(widget.level);
    int status = levelStatus.getStatus(widget.fieldIndex, widget.rowIndex);
    bool highlighted = levelStatus.getHighlightedStatus(widget.fieldIndex, widget.rowIndex);
    Color backgroundColor = highlighted ? AppColors.highlightedBlock : Theme.of(context).scaffoldBackgroundColor;
    Map<String, dynamic> cos = _cosmetics[status];
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor, width: AppBorderWidth.thin),
        color: backgroundColor,
      ),
      child: FlatButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          widget.update(widget.rowIndex);
        },
        child: Text(
          cos["text"],
          textAlign: TextAlign.right,
          style: TextStyle(
            color: cos["color"],
          ),
        ),
      ),
    );
  }
}
