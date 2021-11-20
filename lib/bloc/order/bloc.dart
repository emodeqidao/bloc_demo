import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<OrderState> emit) async {
    emit(state.clone());
  }
}
