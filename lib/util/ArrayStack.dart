import 'dart:core';

import 'Stack.dart';

class ArrayStack<E> implements Stack<E> {
  final List<E> _elements = [];

  @override
  bool get isEmpty => _elements.isEmpty;

  @override
  int get length => _elements.length;

  @override
  E pop() => _elements.removeLast();

  @override
  void push(E element) => _elements.add(element);
}
