import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';
import 'event.dart';
import 'state.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MainBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<MainBloc>(context);

    return Scaffold(
      bottomNavigationBar: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: '订单', icon: Icon(Icons.book)),
              BottomNavigationBarItem(label: '我的', icon: Icon(Icons.perm_identity)),
            ],
            currentIndex: bloc.state.selectIndex,
            onTap: (index) {
              print('${index}');
              bloc.add(SelectEvent(index));
            },
          );
        },
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return PageView.builder(
            onPageChanged: (v) {
              print('change ${v}');
            },
            itemCount: bloc.state.pageList.length,
            controller: bloc.state.pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return bloc.state.pageList[index];
            },
          );
        },
      ),
    );
  }
}

