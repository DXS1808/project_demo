import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/impl/favorite_impl.dart';
import 'package:project_demo/data/model/movie/movie.dart';
import 'package:project_demo/domain/usecase/favorite_usecase.dart';
import 'package:project_demo/presentation/common/no_internet.dart';
import 'package:project_demo/presentation/common/skeleton/skeleton_home_screen.dart';
import 'package:project_demo/presentation/view/auth/sign_out/sign_out_cubit/sign_out_cubit.dart';
import 'package:project_demo/presentation/view/home_screen/home_cubit/home_cubit.dart';
import 'package:project_demo/presentation/view/movie/movie_favorite/check_favorite_cubit/check_favorite_cubit.dart';
import 'package:project_demo/presentation/view/movie/movie_favorite/movie_favorite_cubit/movie_favorite_cubit.dart';
import 'package:project_demo/presentation/view/movie/movie_favorite/ui/movie_favorite_list.dart';
import 'package:project_demo/presentation/view/profile/profile_screen.dart';
import 'package:project_demo/services/network_services/network_services_cubit.dart';
import '../../../../data/impl/movie_impl.dart';
import '../../../../domain/usecase/movie_usecase.dart';
import '../../../../utils/rest_client_dio.dart';
import '../../movie/category_movie_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    widgetOptions.add(MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) =>
              MovieFavoriteCubit(FavoriteUseCase(FavoriteImpl()))),
      BlocProvider<HomeCubit>(
          create: (context) =>
              HomeCubit(MovieUseCase(MovieImpl(RestClientDio.restClient)))),
      BlocProvider(create: (context) => CheckFavoriteCubit()),
    ], child: const MovieScreen())
        );
    widgetOptions.add(MultiBlocProvider(providers: [
      BlocProvider<MovieFavoriteCubit>(
          create: (context) =>
              MovieFavoriteCubit(FavoriteUseCase(FavoriteImpl()))),
      BlocProvider(create: (context) => CheckFavoriteCubit()),
    ], child: const MovieFavoriteList()));
    widgetOptions.add(MultiBlocProvider(
      providers: [
        BlocProvider<SignOutCubit>(
          create: (context) => SignOutCubit(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(),
        ),
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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            child: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.home),
                    label: AppLocalizations.of(context)!.home,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.favorite),
                    label: AppLocalizations.of(context)!.favorite,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.person),
                    label: AppLocalizations.of(context)!.profile,
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: (index) {
                  _onItemTapped(index);
                },
                unselectedItemColor: Colors.grey.withOpacity(0.6),
                selectedItemColor: Colors.white,
                backgroundColor: Constants.BACKGROUND_COLOR.withOpacity(0.5)),
          )),
    );
  }
}

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen>
    with TickerProviderStateMixin {
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  late TabController tabController;
  List<MovieListItem> getPopularList = [];
  List<MovieListItem> getTopRatedList = [];
  List<MovieListItem> getNowPlayingList = [];
  List<MovieListItem> getUpComing = [];
  List<MovieListItem> getSearchList = [];
  bool check = false;
  bool isLoading = false;
  late HomeCubit homeCubit;
  int page = 1;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        isLoading = true;
        page++;
        context.read<HomeCubit>().getTopRatedList(isLoading, page);
      }
    });
    // tabController = TabController(length: 4, vsync: this);

    context.read<HomeCubit>().getPopularList(false, 1);
    context.read<HomeCubit>().getTopRatedList(false, 1);
    context.read<HomeCubit>().getNowPlayingList(false, 1);
    context.read<HomeCubit>().getUpComingList(false, 1);
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
        case HomeStatus.getPopularListLoading:
          getPopularList.addAll(state.popularList);
          break;

        case HomeStatus.getTopRatedList:
          getTopRatedList = state.topRatedList;
          break;
        case HomeStatus.getTopRatedListLoading:
          getTopRatedList.addAll(state.topRatedList);
          break;

        case HomeStatus.getNowPlayingList:
          getNowPlayingList = state.nowPlayingList;
          break;
        case HomeStatus.getNowPlayingListLoading:
          getNowPlayingList.addAll(state.nowPlayingList);
          break;

        case HomeStatus.getUpComing:
          getUpComing = state.upComingList;
          break;
        case HomeStatus.getUpComingLoading:
          getUpComing.addAll(state.upComingList);
          break;

        case HomeStatus.getSearchMovie:
          getSearchList = state.searchMovieList;
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
        case HomeStatus.noSearch:
          // TODO: Handle this case.
          break;
      }
    }, builder: (context, state) {
      return DefaultTabController(
          length: state.checkSearch == true ? 1 : 4,
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return state.checkSearch == false
                        ? Text(
                            AppLocalizations.of(context)!.home_page,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: Constants.FONT_FAMILY),
                          )
                        : SearchMovie(controller, FocusNode());
                  },
                ),
                backgroundColor: Constants.BACKGROUND_COLOR,
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
                            getSearchList = [];
                          },
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.white,
                          ))
                ],
                bottom: TabBar(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  indicator: const BoxDecoration(),
                  isScrollable: true,
                  onTap: (index) {
                    page = 1;
                    if (index == 1) {
                      context.read<HomeCubit>().getPopularList(false, page);
                      scrollController.addListener(() {
                        if (scrollController.position.pixels ==
                            scrollController.position.maxScrollExtent) {
                          isLoading = true;
                          page++;
                          context
                              .read<HomeCubit>()
                              .getPopularList(isLoading, page);
                        }
                      });
                    } else if (index == 2) {
                      context.read<HomeCubit>().getNowPlayingList(false, page);
                      scrollController.addListener(() {
                        if (scrollController.position.pixels ==
                            scrollController.position.maxScrollExtent) {
                          isLoading = true;
                          page++;
                          context
                              .read<HomeCubit>()
                              .getNowPlayingList(isLoading, page);
                        }
                      });
                    } else if (index == 3) {
                      context.read<HomeCubit>().getUpComingList(false, page);
                      scrollController.addListener(() {
                        if (scrollController.position.pixels ==
                            scrollController.position.maxScrollExtent) {
                          isLoading = true;
                          page++;
                          context
                              .read<HomeCubit>()
                              .getUpComingList(isLoading, page);
                        }
                      });
                    } else {
                      context.read<HomeCubit>().getTopRatedList(false, page);
                    }
                  },
                  indicatorColor: Colors.white,
                  tabs: state.checkSearch == false
                      ? [
                          Text(
                            AppLocalizations.of(context)!.top_rated,
                            style: const TextStyle(
                                fontFamily: Constants.FONT_FAMILY,
                                fontSize: 13),
                          ),
                          Text(
                            AppLocalizations.of(context)!.popular,
                            style: const TextStyle(
                                fontFamily: Constants.FONT_FAMILY,
                                fontSize: 13),
                          ),
                          Text(
                            AppLocalizations.of(context)!.now_playing,
                            style: const TextStyle(
                                fontFamily: Constants.FONT_FAMILY,
                                fontSize: 13),
                          ),
                          Text(
                            AppLocalizations.of(context)!.up_coming,
                            style: const TextStyle(
                                fontFamily: Constants.FONT_FAMILY,
                                fontSize: 13),
                          ),
                        ]
                      : [
                          Text(
                            AppLocalizations.of(context)!.result_movie_search,
                            style: const TextStyle(
                                fontFamily: Constants.FONT_FAMILY,
                                fontSize: 13),
                          ),
                        ],
                ),
              ),
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [
                        0.4,
                        0.2,
                      ],
                      colors: [
                        Constants.BACKGROUND_COLOR,
                        Colors.white,
                      ],
                    )),
                  ),
                  state.homeStatus == HomeStatus.loading
                      ? const SkeletonScreen()
                      : state.checkSearch == true
                          ? TabBarView(children: [
                              CategoryMovieList(
                                movieListItem: getSearchList,
                                searchText: controller.text,
                                isLoading: false,
                              ),
                            ])
                          : BlocBuilder<NetworkServicesCubit,
                              NetworkServicesState>(
                              builder: (context, state) {
                                if (state.networkServicesStatus ==
                                    NetworkServicesStatus.online) {
                                  return TabBarView(children: [
                                    CategoryMovieList(
                                        movieListItem: getTopRatedList,
                                        isLoading: true,
                                        scrollController: scrollController),
                                    CategoryMovieList(
                                        movieListItem: getPopularList,
                                        isLoading: true,
                                        scrollController: scrollController),
                                    CategoryMovieList(
                                        movieListItem: getNowPlayingList,
                                        isLoading: true,
                                        scrollController: scrollController),
                                    CategoryMovieList(
                                        movieListItem: getUpComing,
                                        isLoading: true,
                                        scrollController: scrollController)
                                  ]);
                                } else if (state.networkServicesStatus ==
                                    NetworkServicesStatus.offline) {
                                  return NoInternet();
                                }
                                return Container();
                              },
                            ),
                ],
              )));
    });
  }
}
