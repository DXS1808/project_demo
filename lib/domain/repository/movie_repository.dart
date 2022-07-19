import 'package:project_demo/data/model/favorite/status_favorite/status_favorite.dart';
import 'package:project_demo/data/model/movie_detail/movie_detail.dart';

import '../../data/model/favorite/mark_favorite/mark_favorite.dart';
import '../../data/model/movie/movie.dart';

abstract class MovieRepository {
  Future<Movie> getListMovie(String apiKey);

  Future<Movie> getListTopRated(String apiKey);

  Future<Movie> getListNowPlaying(String apiKey);

  Future<Movie> getListUpComing(String apiKey);

  Future<Movie> getListFavorite(String apiKey, int accountId, String sessionId);

  //mark Favorite

  Future<StatusFavorite> markFavoriteMovie(String apiKey, String sessionId,
      int accountId, MarkFavorite markFavorite, String contentType);

  // movie detail

  Future<MovieDetail> getMovieDetail(String apiKey, int movieId);
}
