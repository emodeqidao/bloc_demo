import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';
import 'event.dart';
import 'state.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MineBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<MineBloc>(context);
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          centerTitle: true,
          floating: true,
          expandedHeight: 300.0,
          backgroundColor: Colors.purple,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('复仇者联盟'),
            background: Image.network(
              'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SliverFixedExtentList(

          itemExtent: 80.0,
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Card(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.primaries[(index % Colors.primaries.length)],
                  child: Text(''),
                ),
              );
            },
            childCount: 100,
          ),
        ),
      ],
    );
    // return CustomScrollView(
    //   slivers: <Widget>[
    //     SliverAppBar(
    //       // title: Text('Mine app bar'),
    //       centerTitle: true,
    //       elevation: 300,
    //       pinned: true,
    //       backgroundColor: Colors.purple,
    //       foregroundColor: Colors.red,
    //       flexibleSpace: FlexibleSpaceBar(
    //         title: Text('复仇者联盟'),
    //         background: Image.network(
    //           'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
    //           fit: BoxFit.fitHeight,
    //         ),
    //       ),
    //     ),
    //
    //     SliverFixedExtentList(
    //       itemExtent: 80,
    //       delegate: SliverChildBuilderDelegate(
    //         (BuildContext content, int index) {
    //           return Container(
    //             height: 100,
    //             color: Colors.primaries[index % Colors.primaries.length],
    //           );
    //         },
    //       ),
    //     ),
    //   ],
    // );
  }
}

