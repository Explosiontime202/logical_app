import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/constants/AppColors.dart';

import 'AppSettingsStatus.dart';

class AppColorModeSwitch extends StatefulWidget {
  @override
  _AppColorModeSwitchState createState() => _AppColorModeSwitchState();
}

class _AppColorModeSwitchState extends State<AppColorModeSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Dark Mode",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Switch(
          value: AppSettingStatus.isLightMode,
          onChanged: (bool value) {
            setState(() {
              print(value.toString());
              AppSettingStatus.isLightMode = value;
              AppColors.toggleTheme();
            });
          },
        ),
        Text(
          "Light Mode",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
