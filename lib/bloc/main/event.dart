import 'package:flutter/material.dart';

abstract class MainEvent {}

class InitEvent extends MainEvent {}

class SelectEvent extends MainEvent {
  final int selectIndex;

  SelectEvent(@required this.selectIndex);
}