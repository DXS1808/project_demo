part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, failed }

@immutable
class HomeState extends Equatable {
  final HomeStatus status;
  final Movie ? movie;

  const HomeState._({this.status = HomeStatus.initial, this.movie});

  const HomeState.initial() : this._();

  const HomeState.loading() : this._(status: HomeStatus.loading);

  const HomeState.success(Movie movie)
      : this._(status: HomeStatus.success, movie: movie);

  const HomeState.failed() : this._(status: HomeStatus.failed);

  @override
  List<Object?> get props => [status, movie];
}
