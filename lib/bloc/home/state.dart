import 'package:bloc_demo/bloc/home/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeState {
  late List<Member> list;
  late List<String> tabs;
  late int selectIndex;
  late PageController pageController;
  late TabController tabController;

  HomeState init() {
    List<String> tabs = <String>["tab1", "tab2", "tab3", "tab4"];
    int selectIndex = 0;

    return HomeState()
    ..list = <Member>[]
    ..tabs = tabs
    ..selectIndex = selectIndex
    ..pageController = PageController(initialPage: selectIndex)
    ..tabController = TabController(length: tabs.length, vsync: ScrollableState());
  }

  HomeState clone() {
    return HomeState()
    ..list = list
    ..tabs = tabs
    ..selectIndex = selectIndex
    ..pageController = pageController
    ..tabController = tabController;
  }
}
