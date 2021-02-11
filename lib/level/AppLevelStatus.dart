import 'dart:core';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:logical_app/util/Stack.dart';

import 'AppLevel.dart';

class AppLevelStatus {
  static List<AppLevelStatus> _levelStati = List<AppLevelStatus>();
  final AppLevel level;
  cupertino.TextEditingController _notesController;
  List<List<int>> _status;
  List<bool> _ruleStatus;
  Stack<List<List<int>>> _statusStack;

  AppLevelStatus({@cupertino.required this.level}) : super() {
    _levelStati.add(this);
    _initStatus();
    _statusStack = Stack(maxCapacity: 30);
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

  bool testCorrect() {
    if (!level.hasCorrectSolution) level.generateCorrectSolution();
    List<List<int>> correctSolution = level.correctSolution;
    return _checkListEquality(_status, correctSolution);
  }

  bool _checkListEquality(List<List<int>> l1, List<List<int>> l2) {
    if (l1.length != l2.length) return false;
    for (int i = 0; i < l1.length; i++) {
      if (l1[i].length != l2[i].length) return false;
      for (int k = 0; k < l1[i].length; k++) {
        if (l1[i][k] != l2[i][k]) return false;
      }
    }
    return true;
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
  }
}
