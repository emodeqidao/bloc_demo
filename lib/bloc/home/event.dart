import 'package:bloc_demo/bloc/home/view.dart';

abstract class HomeEvent {}

class InitEvent extends HomeEvent {}

class GetDataEvent extends HomeEvent {
  GetDataEvent();
}

class SelectTabEvent extends HomeEvent {
  final int selectIndex;

  SelectTabEvent({required this.selectIndex});
}

class PageViewChangeEvent extends HomeEvent {
  final int selectIndex;

  PageViewChangeEvent(this.selectIndex);
}