part of 'movie_detail_cubit.dart';

enum MovieDetailStatus {initial,loading, success, failed}

@immutable
 class MovieDetailState extends Equatable {

  final MovieDetailStatus movieDetailStatus;

  final MovieDetail ? movieDetail;

  MovieDetailState({this.movieDetailStatus = MovieDetailStatus.initial,this.movieDetail});

  @override
  // TODO: implement props
  List<Object?> get props => [movieDetailStatus,movieDetail];

  MovieDetailState copyWith({
    MovieDetailStatus? movieDetailStatus,
    MovieDetail? movieDetail,
  }) {
    return MovieDetailState(
      movieDetailStatus: movieDetailStatus ?? this.movieDetailStatus,
      movieDetail: movieDetail ?? this.movieDetail,
    );
  }
}


