import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/lang/AppLanguages.dart';
import 'package:logical_app/settings/AppSettings.dart';
import 'package:logical_app/settings/AppSettingsStatus.dart';
import 'AppLevelList.dart';

class MainPage extends StatefulWidget {
  MainPage() : super();

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    if (!AppLanguages.isLoaded) {
      AppLanguages.update = () {
        setState(() {});
      };
      return new Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(AppSettingStatus.currentLanguage.homeGui["title"]),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String choice) {
              switch (choice) {
                case "Settings":
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AppSettings(updateMainPage: () {
                            setState(() {});
                          })));
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
        child: AppLevelList(),
      ),
    );
  }
}
