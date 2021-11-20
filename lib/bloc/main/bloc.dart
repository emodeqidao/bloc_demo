import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState().init()) {
    on<InitEvent>(_init);
    on<SelectEvent>(_selectIndex);
  }

  void _init(InitEvent event, Emitter<MainState> emit) async {
    emit(state.clone());
  }

  void _selectIndex(SelectEvent event, Emitter<MainState> emit) {
    MainState newState = state.clone();
    newState.selectIndex = event.selectIndex;
    newState.pageController.jumpToPage(event.selectIndex);
    emit(newState);
  }
}
