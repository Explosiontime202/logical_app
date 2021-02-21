import 'dart:core';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:logical_app/util/Pair.dart';
import 'package:logical_app/util/Stack.dart';

import 'AppLevel.dart';

class AppLevelStatus {
  static List<AppLevelStatus> _levelStati = List<AppLevelStatus>();
  final AppLevel level;
  cupertino.TextEditingController _notesController;
  List<List<int>> _status;
  List<bool> _ruleStatus;
  Stack<List<List<int>>> _statusStack;
  List<List<bool>> _highlightedBlocks;
  Function updateLevelScreen;

  AppLevelStatus({@cupertino.required this.level}) : super() {
    _levelStati.add(this);
    _initStatus();
    _statusStack = Stack(maxCapacity: 30);
    _highlightedBlocks = List(6);
    for (int index = 0; index < _highlightedBlocks.length; index++) {
      _highlightedBlocks[index] = List(25);
      _highlightedBlocks[index].fillRange(0, 25, false);
    }
  }

  static AppLevelStatus of(AppLevel level) {
    return _levelStati.firstWhere((element) => element.level == level);
  }

  void incrementStatus(int fieldIndex, int rowIndex) {
    _statusStack.push(_copyStatus());
    List<int> field = _status[fieldIndex];
    if (field[rowIndex] == 1) {
      int row = (rowIndex / 5).floor();
      int col = rowIndex % 5;
      for (int i = 0; i < 5; i++) {
        if (i != row) field[i * 5 + col] = 1;
        if (i != col) field[row * 5 + i] = 1;
      }
    }
    field[rowIndex] = (field[rowIndex] + 1) % 3;

    removeHighlighting();
  }

  List<List<int>> _copyStatus() {
    List<List<int>> copy = List(_status.length);
    for (int i = 0; i < copy.length; i++) {
      List<int> field = List(_status[i].length);
      for (int j = 0; j < field.length; j++) field[j] = _status[i][j];
      copy[i] = field;
    }
    return copy;
  }

  int getStatus(int fieldIndex, int rowIndex) => _status[fieldIndex][rowIndex];

  void restart() {
    _initStatus();
    removeHighlighting();
  }

  void _initStatus() {
    _status = List(6);
    for (int i = 0; i < _status.length; i++) {
      List<int> field = List(25);
      field.fillRange(0, 25, 0);
      _status[i] = field;
    }
    _ruleStatus = List(level.rules.length);
    _ruleStatus.fillRange(0, _ruleStatus.length, false);
  }

  Pair<bool, List<Map<String, int>>> testCorrect() {
    removeHighlighting();
    if (!level.hasCorrectSolution) level.generateCorrectSolution();
    List<List<int>> correctSolution = level.correctSolution;
    List<Map<String, int>> falseBlocks = List();
    for (int i = 0; i < correctSolution.length; i++) {
      for (int k = 0; k < correctSolution[i].length; k++) {
        if (correctSolution[i][k] != _status[i][k]) falseBlocks.add({"fieldIndex": i, "rowIndex": k});
      }
    }
    bool test = falseBlocks.isEmpty;
    falseBlocks.removeWhere((element) => getStatus(element["fieldIndex"], element["rowIndex"]) == 0);
    return Pair(test, falseBlocks);
  }

  cupertino.TextEditingController get notesController {
    if (_notesController == null) _notesController = cupertino.TextEditingController();
    return _notesController;
  }

  bool getRuleStatus(int index) {
    return _ruleStatus[index];
  }

  void invertRuleStatus(int index) => _ruleStatus[index] = !_ruleStatus[index];

  void undoMove() {
    if (!_statusStack.isEmpty()) _status = _statusStack.pop();
    removeHighlighting();
  }

  void highlightBlocks(List<Map<String, int>> blocks) {
    for (Map<String, int> block in blocks) _highlightedBlocks[block["fieldIndex"]][block["rowIndex"]] = true;
    updateLevelScreen();
  }

  void removeHighlighting() {
    for (List<bool> list in _highlightedBlocks) for (int index = 0; index < list.length; index++) list[index] = false;
    updateLevelScreen();
  }

  bool getHighlightedStatus(int fieldIndex, int rowIndex) {
    return _highlightedBlocks[fieldIndex][rowIndex];
  }
}
