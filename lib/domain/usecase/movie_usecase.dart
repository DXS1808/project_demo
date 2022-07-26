
import 'package:project_demo/data/model/favorite/mark_favorite/mark_favorite.dart';
import 'package:project_demo/data/model/favorite/status_favorite/status_favorite.dart';
import 'package:project_demo/domain/repository/movie_repository.dart';

import '../../data/model/cast/cast.dart';
import '../../data/model/movie/movie.dart';
import '../../data/model/movie_detail/movie_detail.dart';
import '../../data/model/movie_image/movie_image.dart';
import '../../data/model/reviews/reviews.dart';

class MovieUseCase {
  final MovieRepository movieRepository;

  MovieUseCase(this.movieRepository);

  Future<Movie> getListPopular(String apiKey) {
    return movieRepository.getListMovie(apiKey);
  }

  Future<Movie> getListTopRated(String apiKey) {
    return movieRepository.getListTopRated(apiKey);
  }

  Future<Movie> getListNowPlaying(String apiKey) {
    return movieRepository.getListNowPlaying(apiKey);
  }

  Future<Movie> getListUpComing(String apiKey) {
    return movieRepository.getListUpComing(apiKey);
  }

  Future<Movie> getListFavorite(
      String apiKey, int accountId, String sessionId) {
    return movieRepository.getListFavorite(apiKey, accountId, sessionId);
  }

  //mark Favorite

  Future<StatusFavorite> markFavoriteMovie(String apiKey, String sessionId,
      int accountId, MarkFavorite markFavorite, String contentType) {
    return movieRepository.markFavoriteMovie(
        apiKey, sessionId, accountId, markFavorite, contentType);
  }

  //get Movie Detail
  Future<MovieDetail> getMovieDetail(String apiKey, int movieId) {
    return movieRepository.getMovieDetail(apiKey, movieId);
  }

  //get credit cast

  Future<CreditCast> getCreditCast(String apiKey, int movieId) {
    return movieRepository.getCreditCast(apiKey, movieId);
  }

  Future<Movie> getListRecommendations(String apiKey, int movieId) {
    return movieRepository.getListRecommendations(apiKey, movieId);
  }

  //get reviews
  Future<Reviews> getReviews(String apiKey, int movieId) {
    try {
      return movieRepository.getReviews(apiKey, movieId);
    } catch (e) {
      print(e);
    }
    return movieRepository.getReviews(apiKey, movieId);
  }

  //get similar movie
  Future<Movie> getListSimilar(String apiKey, int movieId) {
    try {
      return movieRepository.getListSimilar(apiKey, movieId);
    } catch (e) {
      print(e);
    }
    return movieRepository.getListSimilar(apiKey, movieId);
  }

  //get Movie Image

  Future<MovieImage> getMovieImage(String apiKey, int movieId) {
    try {
      return movieRepository.getMovieImage(apiKey, movieId);
    } catch (e) {
      print(e);
    }
    return movieRepository.getMovieImage(apiKey, movieId);
  }

  Future<Movie> getSearchMovie(String apiKey, String query){
    try {
      return movieRepository.getSearchMovie(apiKey, query);
    } catch (e) {
      print(e);
    }
    return movieRepository.getSearchMovie(apiKey, query);
  }
}
