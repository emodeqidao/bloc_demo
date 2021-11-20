import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';

class MineBloc extends Bloc<MineEvent, MineState> {
  MineBloc() : super(MineState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<MineState> emit) async {
    emit(state.clone());
  }
}
