part of 'home_cubit.dart';

enum HomeStatus { initial, loading, getPopularList, getTopRatedList, failed, getNowPlayingList,getUpComing }

@immutable
class HomeState extends Equatable {
  HomeStatus homeStatus;
  final List<MovieListItem> popularList;
  final List<MovieListItem> topRatedList;
  final List<MovieListItem> nowPlayingList;
  final List<MovieListItem> upComingList;

  HomeState(
      {this.homeStatus = HomeStatus.initial,
      this.popularList = const [],
      this.topRatedList = const [],
      this.nowPlayingList = const [],
      this.upComingList = const [],
      });

  @override
  // TODO: implement props
  List<Object?> get props => [popularList, topRatedList, homeStatus,nowPlayingList,upComingList];

  HomeState copyWith({
    HomeStatus? homeStatus,
    List<MovieListItem>? popularList,
    List<MovieListItem>? topRatedList,
    List<MovieListItem>? nowPlayingList,
    List<MovieListItem>? upComingList,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      popularList: popularList ?? this.popularList,
      topRatedList: topRatedList ?? this.topRatedList,
      nowPlayingList: nowPlayingList ?? this.nowPlayingList,
      upComingList: upComingList ?? this.upComingList,
    );
  }
}
