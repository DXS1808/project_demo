import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/data_sources/remote/rest_client.dart';
import 'package:project_demo/data/model/movie/movie.dart';
import 'package:project_demo/presentation/view/home_screen/home_cubit/home_cubit.dart';
import 'package:project_demo/presentation/view/movie/movie_favorite/movie_favorite_cubit/movie_favorite_cubit.dart';
import 'package:project_demo/presentation/view/movie/movie_favorite/ui/movie_favorite_list.dart';
import '../../../../data/impl/movie_impl.dart';
import '../../../../domain/usecase/movie_usecase.dart';
import '../../movie/category_movie_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> widgetOptions = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    widgetOptions.add(const MovieScreen());
    widgetOptions.add(BlocProvider<MovieFavoriteCubit>(
      create: (context) => MovieFavoriteCubit(MovieUseCase(MovieImpl(
          RestClient(Dio(BaseOptions(contentType: "application/json")))))),
      child: MovieFavoriteList(
          accountId: Constants.ACCOUNT_ID, sessionId: Constants.SESSION_ID),
    ));
    widgetOptions.add(TextButton(
      onPressed: () async {
        await FirebaseAuth.instance.signOut().then((value) {
          Navigator.pushNamed(context, "/home_Screen");
        });
      },
      child: const Text("Sign out"),
    ));

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
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
  List<MovieListItem> getUpComing = [];

  @override
  void initState() {
    context.read<HomeCubit>().getPopularList();
    context.read<HomeCubit>().getTopRatedList();
    context.read<HomeCubit>().getNowPlayingList();
    context.read<HomeCubit>().getUpComingList();

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
          case HomeStatus.getUpComing:
            getUpComing = state.upComingList;
            break;
          case HomeStatus.initial:
            // TODO: Handle this case.
            break;
          case HomeStatus.loading:
            // TODO: Handle this case.
            break;
          case HomeStatus.failed:
            // TODO: Handle this case.
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.black,
            body: state.homeStatus == HomeStatus.loading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : DefaultTabController(
                    length: 4,
                    child: Scaffold(
                        appBar: AppBar(
                          centerTitle: true,
                          backgroundColor: Colors.black,
                          bottom: const TabBar(
                            padding: EdgeInsets.only(bottom: 8.0),
                            indicator: BoxDecoration(),
                            isScrollable: true,
                            indicatorColor: Colors.white,
                            tabs: [
                              Text(
                                "TopRated",
                                style: TextStyle(
                                    fontFamily: Constants.FONT_FAMILY,
                                    fontSize: 12),
                              ),
                              Text(
                                "Popular",
                                style: TextStyle(
                                    fontFamily: Constants.FONT_FAMILY,
                                    fontSize: 12),
                              ),
                              Text(
                                "NowPlaying",
                                style: TextStyle(
                                    fontFamily: Constants.FONT_FAMILY,
                                    fontSize: 12),
                              ),
                              Text(
                                "UpComing",
                                style: TextStyle(
                                    fontFamily: Constants.FONT_FAMILY,
                                    fontSize: 12),
                              )
                            ],
                          ),
                          title: const Text(
                            "Movie Screen",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                fontFamily: Constants.FONT_FAMILY
                            ),
                          ),
                        ),
                        backgroundColor: Colors.black,
                        body: TabBarView(children: [
                          CategoryMovieList(movieListItem: getTopRatedList),
                          CategoryMovieList(movieListItem: getPopularList),
                          CategoryMovieList(movieListItem: getNowPlayingList),
                          CategoryMovieList(movieListItem: getUpComing)
                        ]))));
      },
    );
  }
}
