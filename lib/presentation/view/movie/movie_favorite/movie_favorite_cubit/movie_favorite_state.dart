part of 'movie_favorite_cubit.dart';

enum MovieFavoriteStatus {
  initial,
  loading,
  success,
  failed,
  marked,
  notMarked,
  markedSuccess,
  markedFailed,
  removeFavorite
}

@immutable
class MovieFavoriteState extends Equatable {
  final MovieFavoriteStatus movieFavoriteStatus;

  final List<Favorite> getListFavorite;

  final String errorMessage;

  const MovieFavoriteState(
      {this.movieFavoriteStatus = MovieFavoriteStatus.initial,
      this.getListFavorite = const [],
      this.errorMessage = ""});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [movieFavoriteStatus, getListFavorite, errorMessage];

  MovieFavoriteState copyWith({
    MovieFavoriteStatus? movieFavoriteStatus,
    List<Favorite>? getListFavorite,
    String? errorMessage,
  }) {
    return MovieFavoriteState(
      movieFavoriteStatus: movieFavoriteStatus ?? this.movieFavoriteStatus,
      getListFavorite: getListFavorite ?? this.getListFavorite,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
