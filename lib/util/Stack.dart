import 'dart:core';
import 'package:meta/meta.dart';

class Stack<E> {
  final int maxCapacity;
  List<E> _elements;
  int _stackPointer;

  Stack({@required this.maxCapacity}) : super() {
    _elements = List<E>(maxCapacity);
    _stackPointer = -1;
  }

  void push(E element) {
    _stackPointer = (_stackPointer + 1) % maxCapacity;
    _elements[_stackPointer] = element;
  }

  E pop() {
    E result = _elements[_stackPointer];
    _elements[_stackPointer] = null;
    _stackPointer = (_stackPointer - 1 + maxCapacity) % maxCapacity;
    return result;
  }

  bool isEmpty() {
    return _stackPointer == -1 || _elements[_stackPointer] == null;
  }
}
