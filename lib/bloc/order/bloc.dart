import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderState().init());

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    if (event is InitEvent) {
      yield await init();
    }
  }

  Future<OrderState> init() async {
    return state.clone();
  }
}
