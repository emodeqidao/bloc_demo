import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';

class MineBloc extends Bloc<MineEvent, MineState> {
  MineBloc() : super(MineState().init());

  @override
  Stream<MineState> mapEventToState(MineEvent event) async* {
    if (event is InitEvent) {
      yield await init();
    }
  }

  Future<MineState> init() async {
    return state.clone();
  }
}
