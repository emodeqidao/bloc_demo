import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'bloc.dart';
import 'event.dart';
import 'state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      HomeBloc()
        ..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'getData',
        child: const Icon(Icons.add),
        onPressed: () async {
          bloc.add(GetDataEvent());
        },
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: bloc.state.list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(bloc.state.list[index].name)
              );
            },
          );
        },
      ),
    );
  }
}


class Member {
  final String id;
  final String name;

  Member({required this.id, required this.name});

  @override
  String toString() {
    return "$id: $name";
  }
}


