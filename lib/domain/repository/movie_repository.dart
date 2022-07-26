
import 'package:project_demo/data/model/favorite/status_favorite/status_favorite.dart';
import 'package:project_demo/data/model/movie_detail/movie_detail.dart';
import 'package:project_demo/data/model/movie_image/movie_image.dart';
import 'package:project_demo/data/model/reviews/reviews.dart';

import '../../data/model/cast/cast.dart';
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

  // getList Recommendations movie

  Future<Movie> getListRecommendations(String apiKey, int movieId);

//getCreditCast

  Future<CreditCast> getCreditCast(String apiKey, int movieId);

  //get Reviews
  Future<Reviews> getReviews(String apiKey, int movieId);

  Future<Movie> getListSimilar(String apiKey, int movieId);

  Future<MovieImage> getMovieImage(String apiKey,int movieId);

  Future<Movie> getSearchMovie(String apiKey, String query);
}
