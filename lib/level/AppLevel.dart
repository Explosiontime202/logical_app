import 'dart:core';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:logical_app/level/AppLevelScreen.dart';
import 'package:logical_app/level/AppLevelStatus.dart';

class AppLevel {
  final String name;
  final String introductionText;
  final List<List<int>> solution;
  final List<String> rules;
  final List<List<String>> items;
  bool _correctSolutionGenerated = false;
  List<List<int>> _correctSolution;

  AppLevel._(this.name, this.introductionText, this.solution, this.rules, this.items);

  static AppLevel of(Map<String, dynamic> data) {
    String name;
    String introductionText;
    List<List<int>> solution;
    List<String> rules;
    List<List<String>> items;
    try {
      name = data["name"];
      introductionText = data["introduction_text"];
      solution = List.castFrom<dynamic, List<dynamic>>(data["solution"])
          .map((e) => List.castFrom<dynamic, int>(List.unmodifiable(e)))
          .toList(growable: false);
      rules = List.castFrom<dynamic, String>(List.unmodifiable(data["rules"]));
      items = List.castFrom<dynamic, List<dynamic>>(data["items"])
          .map((e) => List.castFrom<dynamic, String>(List.unmodifiable(e)))
          .toList(growable: false);
    } on NoSuchMethodError {
      dev.log("You Levels sucks!");
      assert(true, "rules, items or solution are no Lists! (or Lists of Lists)!!");
    }
    assert(name != null && introductionText != null, "name or introduction_text doesn't exist!");
    return AppLevel._(name, introductionText, solution, rules, items);
  }

  @override
  String toString() {
    return "\n[Level]: {\n"
        "\tname = $name\n"
        "\tintroductionText = $introductionText\n"
        "\tsolution = ${solution.toString()}\n"
        "\titems = ${items.toString()}\n"
        "\trules = ${rules.toString()}\n"
        "}";
  }

  ListTile toListTile(BuildContext context) {
    return ListTile(
      title: Text(name, textAlign: TextAlign.center),
      onTap: () {
        AppLevelStatus(level: this);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext innerContext) => AppLevelScreen(level: this)));
      },
    );
  }

  bool get hasCorrectSolution => _correctSolutionGenerated;

  List<List<int>> get correctSolution => _correctSolution;

  void generateCorrectSolution() {
    _correctSolution = List.generate(6, (index) => List.filled(25, 1));

    for (List<int> sol in solution) {
      for (int i in [0, 3, 2]) {
        innerLoop:
        for (int j in [1, 2, 3]) {
          int fieldIndex = _convertIndices(i, j);
          if (fieldIndex == -1) break innerLoop;
          int first = sol[i];
          int second = sol[j];
          _correctSolution[fieldIndex][first * 5 + second] = 2;
        }
      }
    }
  }

  int _convertIndices(int i, int j) {
    int fieldIndex = 0;
    switch (i) {
      case 0:
        switch (j) {
          case 1:
            fieldIndex = 0;
            break;
          case 2:
            fieldIndex = 1;
            break;
          case 3:
            fieldIndex = 2;
            break;
        }
        break;
      case 3:
        switch (j) {
          case 1:
            fieldIndex = 3;
            break;
          case 2:
            fieldIndex = 4;
            break;
          default:
            fieldIndex = -1;
            break;
        }
        break;
      case 2:
        switch (j) {
          case 1:
            fieldIndex = 5;
            break;
          default:
            fieldIndex = -1;
            break;
        }
        break;
    }
    return fieldIndex;
  }
}
