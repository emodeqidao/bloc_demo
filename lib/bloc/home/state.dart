import 'package:bloc_demo/bloc/home/view.dart';

class HomeState {
  late List<Member> list;

  HomeState init() {
    return HomeState()
    ..list = <Member>[];
  }

  HomeState clone() {
    return HomeState()
    ..list = list;
  }


}
