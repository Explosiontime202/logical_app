import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/constants/AppBorderWidth.dart';

class AppPlaygroundSquare extends StatelessWidget {
  final Widget child;
  AppPlaygroundSquare({required this.child}) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: AppBorderWidth.thick)),
    );
  }
}
