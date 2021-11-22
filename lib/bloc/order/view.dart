import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';
import 'event.dart';
import 'state.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OrderBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<OrderBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('order'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Future.delayed(Duration(seconds: 3), () {
            print('refresh');
          });
          return Future.value();
        },
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 100,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          },
        ),
      ),
    );
  }
}

