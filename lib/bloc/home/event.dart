import 'package:bloc_demo/bloc/home/view.dart';

abstract class HomeEvent {}

class InitEvent extends HomeEvent {}

class GetDataEvent extends HomeEvent {
  GetDataEvent();
}