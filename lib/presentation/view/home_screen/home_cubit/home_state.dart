part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  getPopularList,
  getPopularListLoading,
  getTopRatedList,
  getTopRatedListLoading,
  failed,
  noSearch,
  getNowPlayingList,
  getNowPlayingListLoading,
  getUpComing,
  getUpComingLoading,
  getSearchMovie,
  getSearchMovieLoading,
  loadingSearch
}

@immutable
class HomeState extends Equatable {
  final HomeStatus homeStatus;
  final List<MovieListItem> popularList;
  final List<MovieListItem> topRatedList;
  final List<MovieListItem> nowPlayingList;
  final List<MovieListItem> upComingList;
  final List<MovieListItem> searchMovieList;
  final bool checkSearch;

  const HomeState({
    this.homeStatus = HomeStatus.initial,
    this.popularList = const [],
    this.topRatedList = const [],
    this.nowPlayingList = const [],
    this.upComingList = const [],
    this.searchMovieList = const [],
    this.checkSearch = false,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        popularList,
        topRatedList,
        homeStatus,
        nowPlayingList,
        upComingList,
        searchMovieList,
        checkSearch
      ];

  HomeState copyWith({
    HomeStatus? homeStatus,
    List<MovieListItem>? popularList,
    List<MovieListItem>? topRatedList,
    List<MovieListItem>? nowPlayingList,
    List<MovieListItem>? upComingList,
    List<MovieListItem>? searchMovieList,
    bool? checkSearch,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      popularList: popularList ?? this.popularList,
      topRatedList: topRatedList ?? this.topRatedList,
      nowPlayingList: nowPlayingList ?? this.nowPlayingList,
      upComingList: upComingList ?? this.upComingList,
      searchMovieList: searchMovieList ?? this.searchMovieList,
      checkSearch: checkSearch ?? this.checkSearch,
    );
  }
}
