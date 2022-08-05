import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/impl/favorite_impl.dart';
import 'package:project_demo/data/model/movie/movie.dart';
import 'package:project_demo/domain/usecase/favorite_usecase.dart';
import 'package:project_demo/presentation/common/no_internet.dart';
import 'package:project_demo/presentation/common/skeleton/skeleton_home_screen.dart';
import 'package:project_demo/presentation/common/ultis/rest_client_dio.dart';
import 'package:project_demo/presentation/view/auth/sign_out/sign_out_cubit/sign_out_cubit.dart';
import 'package:project_demo/presentation/view/home_screen/home_cubit/home_cubit.dart';
import 'package:project_demo/presentation/view/movie/movie_favorite/movie_favorite_cubit/movie_favorite_cubit.dart';
import 'package:project_demo/presentation/view/movie/movie_favorite/ui/movie_favorite_list.dart';
import 'package:project_demo/presentation/view/profile/profile_screen.dart';
import 'package:project_demo/services/network_services/network_services_cubit.dart';
import '../../../../data/impl/movie_impl.dart';
import '../../../../domain/usecase/movie_usecase.dart';
import '../../movie/category_movie_list.dart';
import '../../profile/profile_cubit/profile_cubit.dart';
import '../../search_movie/ui/search_movie.dart';

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
    widgetOptions.add(
      BlocProvider<HomeCubit>(
        create: (context) =>
            HomeCubit(MovieUseCase(MovieImpl(RestClientDio.restClient))),
        child: const MovieScreen(),
      ),
    );
    widgetOptions.add(BlocProvider<MovieFavoriteCubit>(
      create: (context) => MovieFavoriteCubit(FavoriteUseCase(FavoriteImpl())),
      child: const MovieFavoriteList(),
    ));
    widgetOptions.add(MultiBlocProvider(
      providers: [
        BlocProvider<SignOutCubit>(
          create: (context) => SignOutCubit(),
        ),
        // BlocProvider<SignOutCubit>(
        //   create: (context) => SignOutCubit(),
        // ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(),
        )
      ],
      child: const ProfileScreen(),
    ));
    context.read<NetworkServicesCubit>().checkNetWork();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            child: BottomNavigationBar(
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
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: (index) {
                  _onItemTapped(index);
                },
                selectedItemColor: Colors.white,
                backgroundColor: Colors.grey.withOpacity(0.5)),
          )),
    );
  }
}

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  late FocusNode focusNode;
  List<MovieListItem> getPopularList = [];
  List<MovieListItem> getTopRatedList = [];
  List<MovieListItem> getNowPlayingList = [];
  List<MovieListItem> getUpComing = [];
  List<MovieListItem> getSearchList = [];
  bool check = false;
  late HomeCubit homeCubit;

  @override
  void initState() {
    // scrollController.addListener(() {
    //   if (scrollController.position.pixels ==
    //       scrollController.position.maxScrollExtent) {
    //     context.read<HomeCubit>().getPopularList();
    //     context.read<HomeCubit>().getTopRatedList();
    //     context.read<HomeCubit>().getNowPlayingList();
    //     context.read<HomeCubit>().getUpComingList();
    //   }
    // });
    context.read<HomeCubit>().getPopularList();
    context.read<HomeCubit>().getTopRatedList();
    context.read<HomeCubit>().getNowPlayingList();
    context.read<HomeCubit>().getUpComingList();

    homeCubit = context.read<HomeCubit>();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
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
        case HomeStatus.getSearchMovie:
          getSearchList = state.searchMovieList;
          break;
        case HomeStatus.noSearch:
          // TODO: Handle this case.
          break;
      }
    }, builder: (context, state) {
      return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return state.checkSearch == false
                      ? const Text(
                          "Movie Screen",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              fontFamily: Constants.FONT_FAMILY),
                        )
                      : SearchMovie(controller, FocusNode());
                },
              ),
              backgroundColor: Colors.black,
              actions: [
                state.checkSearch == false
                    ? IconButton(
                        onPressed: () {
                          check = true;
                          homeCubit.checkSearch(check);
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ))
                    : IconButton(
                        onPressed: () {
                          check = false;
                          homeCubit.checkSearch(check);
                          controller.clear();
                        },
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.white,
                        ))
              ],
              bottom: const TabBar(
                padding: EdgeInsets.only(bottom: 8.0),
                indicator: BoxDecoration(),
                isScrollable: true,
                indicatorColor: Colors.white,
                tabs: [
                  Text(
                    "TopRated",
                    style: TextStyle(
                        fontFamily: Constants.FONT_FAMILY, fontSize: 12),
                  ),
                  Text(
                    "Popular",
                    style: TextStyle(
                        fontFamily: Constants.FONT_FAMILY, fontSize: 12),
                  ),
                  Text(
                    "NowPlaying",
                    style: TextStyle(
                        fontFamily: Constants.FONT_FAMILY, fontSize: 12),
                  ),
                  Text(
                    "UpComing",
                    style: TextStyle(
                        fontFamily: Constants.FONT_FAMILY, fontSize: 12),
                  )
                ],
              ),
            ),
            backgroundColor: Colors.black,
            body: state.homeStatus == HomeStatus.loading
                ? const SkeletonScreen()
                : state.homeStatus == HomeStatus.getSearchMovie &&
                        controller.text != ""
                    ? BlocProvider(
                        create: (context) =>
                            MovieFavoriteCubit(FavoriteUseCase(FavoriteImpl())),
                        child: CategoryMovieList(
                          movieListItem: getSearchList,
                          searchText: controller.text,
                        ),
                      )
                    : BlocBuilder<NetworkServicesCubit, NetworkServicesState>(
                        builder: (context, state) {
                          print("State: ${state.networkServicesStatus}");
                          if (state.networkServicesStatus ==
                              NetworkServicesStatus.online) {
                            return BlocProvider(
                              create: (context) => MovieFavoriteCubit(
                                  FavoriteUseCase(FavoriteImpl())),
                              child: TabBarView(children: [
                                CategoryMovieList(
                                    movieListItem: getTopRatedList),
                                CategoryMovieList(
                                    movieListItem: getPopularList),
                                CategoryMovieList(
                                    movieListItem: getNowPlayingList),
                                CategoryMovieList(movieListItem: getUpComing)
                              ]),
                            );
                          } else if (state.networkServicesStatus ==
                              NetworkServicesStatus.offline) {
                            return NoInternet();
                          }
                          return Container();
                        },
                      ),
          ));
    });
  }
}
