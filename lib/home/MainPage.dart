import 'dart:core';
import 'package:flutter/material.dart';
import 'package:logical_app/settings/AppSettings.dart';
import 'AppLevelList.dart';

class MainPage extends StatefulWidget {
  MainPage() : super();

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Main Menu"),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String choice) {
              switch (choice) {
                case "Settings":
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) => AppSettings()));
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
