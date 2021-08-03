import 'dart:core';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:logical_app/util/Pair.dart';
import 'package:logical_app/util/ArrayStack.dart';

import 'AppLevel.dart';

class AppLevelStatus {
  static List<AppLevelStatus> _levelStati = [];
  final AppLevel level;
  cupertino.TextEditingController _notesController;
  List<List<int>> _status;
  List<bool> _ruleStatus;
  ArrayStack<List<List<int>>> _statusStack;
  List<List<bool>> _highlightedBlocks;
  Function updateLevelScreen;

  AppLevelStatus({@cupertino.required this.level}) : super() {
    _levelStati.add(this);
    _initStatus();
    _statusStack = ArrayStack();
    _highlightedBlocks = List.generate(6, (index) => List.filled(25, false));
  }

  static AppLevelStatus of(AppLevel level) => _levelStati.firstWhere((element) => element.level == level);

  void incrementStatus(int fieldIndex, int rowIndex) {
    _statusStack.push(_copyStatus());
    List<int> field = _status[fieldIndex];

    // if there's an 'X' field, the whole row and the whole column should be marked as 'X', because this field gets to
    // a 'O' field. But other 'O' fields should remain unchanged.
    if (field[rowIndex] == 1) {
      int row = (rowIndex / 5).floor();
      int col = rowIndex % 5;
      for (int i = 0; i < 5; i++) {
        if (i != row) field[i * 5 + col] = math.max(field[i * 5 + col], 1);
        if (i != col) field[row * 5 + i] = math.max(field[row * 5 + i], 1);
      }
    }
    field[rowIndex] = (field[rowIndex] + 1) % 3;

    removeHighlighting();
  }

  List<List<int>> _copyStatus() => List.generate(
      _status.length, (index) => List.generate(_status[index].length, (index2) => _status[index][index2]));

  int getStatus(int fieldIndex, int rowIndex) => _status[fieldIndex][rowIndex];

  void restart() {
    _initStatus();
    removeHighlighting();
  }

  void _initStatus() {
    _status = List.generate(6, (index) => List.filled(25, 0));
    _ruleStatus = List.filled(level.rules.length, false);
  }

  Pair<bool, List<Map<String, int>>> testCorrect() {
    removeHighlighting();

    // generate a solution for the current level if there is none
    if (!level.hasCorrectSolution) level.generateCorrectSolution();

    List<List<int>> correctSolution = level.correctSolution;

    // identify false blocks
    List<Map<String, int>> falseBlocks = [];
    for (int i = 0; i < correctSolution.length; i++) {
      for (int k = 0; k < correctSolution[i].length; k++) {
        if (correctSolution[i][k] != _status[i][k]) falseBlocks.add({"fieldIndex": i, "rowIndex": k});
      }
    }

    // to pass the test, there must be no false blocks on the game board
    bool test = falseBlocks.isEmpty;

    // for highlighting purposes remove the field with no 'X' or 'O'
    falseBlocks.removeWhere((element) => getStatus(element["fieldIndex"], element["rowIndex"]) == 0);

    return Pair(test, falseBlocks);
  }

  cupertino.TextEditingController get notesController {
    if (_notesController == null) {
      _notesController = cupertino.TextEditingController();
    }
    return _notesController;
  }

  bool getRuleStatus(int index) => _ruleStatus[index];

  void invertRuleStatus(int index) => _ruleStatus[index] = !_ruleStatus[index];

  void undoMove() {
    if (!_statusStack.isEmpty) _status = _statusStack.pop();
    removeHighlighting();
  }

  void highlightBlocks(List<Map<String, int>> blocks) {
    for (Map<String, int> block in blocks) {
      _highlightedBlocks[block["fieldIndex"]][block["rowIndex"]] = true;
    }
    updateLevelScreen();
  }

  void removeHighlighting() {
    for (List<bool> list in _highlightedBlocks) {
      for (int index = 0; index < list.length; index++) {
        list[index] = false;
      }
    }
    updateLevelScreen();
  }

  bool getHighlightedStatus(int fieldIndex, int rowIndex) => _highlightedBlocks[fieldIndex][rowIndex];
}
