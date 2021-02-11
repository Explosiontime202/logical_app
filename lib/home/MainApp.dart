import 'package:flutter/material.dart';
import 'package:logical_app/constants/AppColors.dart';
import 'package:logical_app/lang/AppLanguages.dart';
import 'package:logical_app/level/AppLevelManager.dart';

import 'MainPage.dart';

class MainApp extends StatefulWidget {
  MainApp() : super() {
    AppColors.init();
  }

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    AppLevelManager.init(update);
    AppLanguages.init();
  }

  @override
  Widget build(BuildContext context) {
    AppColors.setUpdateThemeFunction(update);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Logical App',
      home: MainPage(),
      themeMode: AppColors.currentTheme,
      darkTheme: AppColors.darkTheme,
      theme: AppColors.lightTheme,
    );
  }

  void update() {
    setState(() {
    });
  }
}
