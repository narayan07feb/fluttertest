import 'package:flutter/material.dart';

abstract class CounterScreenState<T extends StatefulWidget> extends State<T> {
  void updateFromParent();
}
