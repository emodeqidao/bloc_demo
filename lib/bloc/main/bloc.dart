import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState().init());

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is InitEvent) {
      yield await init();
    } else if (event is SelectEvent) {
      yield selectIndex(event);
    }
  }

  Future<MainState> init() async {
    return state.clone();
  }

  MainState selectIndex(SelectEvent event) {
    print('selectIndex: ${event.selectIndex}');
    MainState newState = state.clone();
    newState.pageController.jumpToPage(event.selectIndex);
    newState.selectIndex = event.selectIndex;
    return newState;
  }
}
