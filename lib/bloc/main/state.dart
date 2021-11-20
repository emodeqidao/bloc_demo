import 'package:bloc_demo/bloc/home/view.dart';
import 'package:bloc_demo/bloc/mine/view.dart';
import 'package:bloc_demo/bloc/order/view.dart';
import 'package:flutter/cupertino.dart';

class MainState {
  late PageController pageController;
  late List<Widget> pageList;
  late int selectIndex;

  MainState init() {
    return MainState()
      ..selectIndex = 0
      ..pageController = PageController()
      ..pageList = [HomePage(), OrderPage(), MinePage()];
  }

  MainState clone() {
    return MainState()
    ..selectIndex = selectIndex
    ..pageList = pageList
    ..pageController = pageController;
  }
}
