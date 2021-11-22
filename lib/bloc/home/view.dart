import 'dart:io';

import 'package:bloc_demo/Tools/keep_alive_client_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';
import 'event.dart';
import 'state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'getData',
        child: const Icon(Icons.add),
        onPressed: () async {
          bloc.add(GetDataEvent());
        },
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return DefaultTabController(
            length: bloc.state.tabs.length,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    centerTitle: true,
                    actions: [
                      IconButton(
                          onPressed: () => print('add'), icon: Icon(Icons.add)),
                      IconButton(
                          onPressed: () => print('more'),
                          icon: Icon(Icons.more_horiz)),
                    ],
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => print('aa'),
                    ),
                    expandedHeight: 300,
                    floating: false,
                    snap: false,
                    pinned: true,
                    title: const Text('sliver app bar'),
                    elevation: 10,
                    forceElevated: innerBoxIsScrolled,
                    flexibleSpace: FlexibleSpaceBar(
                      // title: Text('home app bar'),
                      background: Image.asset(
                        'images/abc.jpeg',
                        fit: BoxFit.fill,
                      ),
                      centerTitle: true,
                      collapseMode: CollapseMode.pin,
                    ),
                    bottom: TabBar(
                      controller: bloc.state.tabController,
                      onTap: (index) {
                        bloc.add(SelectTabEvent(selectIndex: index));
                      },
                      indicatorColor: Colors.blue,
                      indicatorWeight: 3,
                      unselectedLabelColor: Colors.grey,
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 20,
                      ),
                      labelColor: Colors.red,
                      labelStyle: const TextStyle(
                        fontSize: 30,
                      ),
                      tabs: bloc.state.tabs
                          .map((String name) => Tab(
                        child: Text(
                          name,
                        ),
                      ))
                          .toList(),
                    ),
                  ),
                ];
              },
              body: PageView.builder(
                onPageChanged: (index) {
                  bloc.add(PageViewChangeEvent(index));
                },
                controller: bloc.state.pageController,
                itemCount: bloc.state.tabs.length,
                itemBuilder: (BuildContext context, int index) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      print('refresh');
                      // bloc.add(GetDataEvent());
                    },
                    child: CustomScrollView(
                      slivers: [
                        sxKeepAliveClientWrapper(_buildList(bloc)),
                      ],
                    ),

                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildList(HomeBloc bloc) {
    return SliverFixedExtentList(
      itemExtent: 50,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
            child: Image.network(
              bloc.state.list[index].thumbnail,
              errorBuilder: (
                BuildContext context,
                Object error,
                StackTrace? stackTrace,
              ) {
                return Icon(Icons.refresh);
              },
            ),
          ),
          title: Text(bloc.state.list[index].name),
        );
      }, childCount: bloc.state.list.length),
    );
  }
}

class Member {
  final String id;
  final String name;
  final String thumbnail;

  Member({required this.id, required this.name, required this.thumbnail});

  @override
  String toString() {
    return "$id: $name $thumbnail";
  }
}
