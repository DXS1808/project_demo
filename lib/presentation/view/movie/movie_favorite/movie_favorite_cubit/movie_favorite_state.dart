part of 'movie_favorite_cubit.dart';

enum MovieFavoriteStatus { initial, loading, success, failed }

@immutable
class MovieFavoriteState extends Equatable {
  MovieFavoriteStatus movieFavoriteStatus;

  List<MovieListItem> getListFavorite;

  String errorMessage;

  MovieFavoriteState(
      {this.movieFavoriteStatus = MovieFavoriteStatus.initial,
      this.getListFavorite = const [],
      this.errorMessage = ""});
  @override
  // TODO: implement props
  List<Object?> get props =>
      [movieFavoriteStatus,getListFavorite,errorMessage];

  MovieFavoriteState copyWith({
    MovieFavoriteStatus? movieFavoriteStatus,
    List<MovieListItem>? getListFavorite,
    String? errorMessage,
  }) {
    return MovieFavoriteState(
      movieFavoriteStatus: movieFavoriteStatus ?? this.movieFavoriteStatus,
      getListFavorite: getListFavorite ?? this.getListFavorite,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
