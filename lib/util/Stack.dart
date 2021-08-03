import 'dart:core';

abstract class Stack<E> {
  void push(E element);

  E pop();

  int get length;

  bool get isEmpty;
}
