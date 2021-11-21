import 'package:bloc/bloc.dart';
import 'package:bloc_demo/bloc/home/view.dart';
import 'package:http/http.dart' as http;
import "dart:convert" as convert;

import 'event.dart';
import 'state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState().init()) {
    on<InitEvent>(_init);
    on<GetDataEvent>(_getData);

  }

  void _init(InitEvent event, Emitter<HomeState> emit) async {
    emit(state.clone());
  }

  void _getData(GetDataEvent event, Emitter<HomeState> emit) async {
    final url = "https://api.apiopen.top/getJoke?page=1&count=20&type=video";
    final res = await http.get(Uri.parse(url));
    if (res.statusCode != 200) {
      throw "request error";
    }
    final json = convert.jsonDecode(res.body);
    final members = json["result"].map<Member>((row) {
      return Member(id: row["sid"], name: row["name"]);
    }).toList();
    members.forEach((m) => print(m));

    HomeState newState = state.clone();
    newState.list= members;
    emit(newState);
  }
}
