import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/movie.dart';
import 'package:project_demo/presentation/common/category_text.dart';
import 'package:project_demo/presentation/view/home_screen/home_cubit/home_cubit.dart';
import 'package:project_demo/presentation/view/movie/now_playing/now_playing_item.dart';

import '../../movie/now_playing/now_playing_list.dart';
import '../../movie/popular/popular_list.dart';
import '../../movie/toprated/toprated_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _widgetOptions.add(MovieScreen());
    _widgetOptions.add(Text("page 2"));
    _widgetOptions.add(Text("page 3"));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            _onItemTapped(index);
          },
          selectedItemColor: Colors.white,
          backgroundColor: Colors.black54),
    );
  }
}

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  List<MovieListItem> getPopularList = [];
  List<MovieListItem> getTopRatedList = [];
  List<MovieListItem> getNowPlayingList = [];

  @override
  void initState() {
    context.read<HomeCubit>().getPopularList();
    context.read<HomeCubit>().getTopRatedList();
    context.read<HomeCubit>().getNowPlayingList();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        switch (state.homeStatus) {
          case HomeStatus.getPopularList:
            getPopularList = state.popularList;
            break;

          case HomeStatus.getTopRatedList:
            getTopRatedList = state.topRatedList;
            break;

          case HomeStatus.getNowPlayingList:
            getNowPlayingList = state.nowPlayingList;
            break;
        }
      },
      builder: (context, state) {
        return state.homeStatus == HomeStatus.loading
            ? const CircularProgressIndicator()
            : DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.black,
                bottom: const TabBar(
                  tabs: [
                    Text("TopRated"),
                    Text("Popular"),
                    Text("NowPlaying")
                  ],
                ),
                title: const Text(
                  "Movie Screen",
                  style: TextStyle(
                      color: Colors.white, fontFamily: Constants.FONTFAMILY),
                ),
              ),
              backgroundColor: Colors.black,
              body: TabBarView(
                children: [
                  TopRatedList(movieListItem:getTopRatedList),
                  PopularList(movieListItem: getPopularList),
                  NowPlayingList(movieListItem: getNowPlayingList),
                ]
              )
            ));
      },
    );
  }
}
