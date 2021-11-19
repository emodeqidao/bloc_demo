import 'package:bloc_demo/bloc/home/view.dart';
import 'package:bloc_demo/bloc/mine/view.dart';
import 'package:bloc_demo/bloc/order/view.dart';
import 'package:flutter/cupertino.dart';

class MainState {
  int selectIndex = 0;

  List<Widget> pageList = <Widget>[];

  PageController pageController = PageController();

  MainState init() {
    List<Widget> list = [HomePage(), OrderPage(), MinePage()];

    return MainState()
    ..selectIndex = 0
    ..pageList = list;

  }

  MainState clone() {
    return MainState()
    ..selectIndex = selectIndex
    ..pageList = pageList
    ..pageController = pageController;
  }

}
