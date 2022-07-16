part of 'home_cubit.dart';

enum HomeStatus { initial, loading, getPopularList, getTopRatedList, failed, getNowPlayingList }

@immutable
class HomeState extends Equatable {
  HomeStatus homeStatus;
  final List<MovieListItem> popularList;
  final List<MovieListItem> topRatedList;
  final List<MovieListItem> nowPlayingList;

  HomeState(
      {this.homeStatus = HomeStatus.initial,
      this.popularList = const [],
      this.topRatedList = const [],
      this.nowPlayingList = const []});

  @override
  // TODO: implement props
  List<Object?> get props => [popularList, topRatedList, homeStatus,nowPlayingList];

  HomeState copyWith({
    HomeStatus? homeStatus,
    List<MovieListItem>? popularList,
    List<MovieListItem>? topRatedList,
    List<MovieListItem>? nowPlayingList,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      popularList: popularList ?? this.popularList,
      topRatedList: topRatedList ?? this.topRatedList,
      nowPlayingList: nowPlayingList ?? this.nowPlayingList,
    );
  }
}
