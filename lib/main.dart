import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:logical_app/home/MainApp.dart';

void main() {
  MyApp app = MyApp();
  runApp(app);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainApp();
  }
}
