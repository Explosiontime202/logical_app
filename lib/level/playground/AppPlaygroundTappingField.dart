import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/level/AppLevelStatus.dart';
import 'package:logical_app/level/AppLevel.dart';
import 'package:logical_app/level/playground/AppPlaygroundTappingFieldBox.dart';

class AppPlaygroundTappingField extends StatefulWidget {
  final AppLevel level;
  final int fieldIndex;

  AppPlaygroundTappingField({required this.level, required this.fieldIndex}) : super();

  @override
  _AppPlaygroundTappingFieldState createState() => _AppPlaygroundTappingFieldState();
}

class _AppPlaygroundTappingFieldState extends State<AppPlaygroundTappingField> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(
        25,
        (index) => AppPlaygroundTappingFieldBox(
          level: widget.level,
          fieldIndex: widget.fieldIndex,
          rowIndex: index,
          update: update,
        ),
      ),
    );
  }

  void update(int rowIndex) {
    setState(() {
      AppLevelStatus.of(widget.level).incrementStatus(widget.fieldIndex, rowIndex);
    });
  }
}
