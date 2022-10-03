import 'package:flutter/foundation.dart';
import 'package:project_demo/data/model/video_movie/video_movie.dart';
import 'package:project_demo/domain/repository/movie_repository.dart';

import '../../data/model/cast/cast.dart';
import '../../data/model/movie/movie.dart';
import '../../data/model/movie_detail/movie_detail.dart';
import '../../data/model/movie_image/movie_image.dart';
import '../../data/model/reviews/reviews.dart';

class MovieUseCase {
  final MovieRepository movieRepository;

  MovieUseCase(this.movieRepository);

  Future<Movie> getListPopular(String apiKey, int page) {
    return movieRepository.getListMovie(apiKey, page);
  }

  Future<Movie> getListTopRated(String apiKey, int page) {
    return movieRepository.getListTopRated(apiKey, page);
  }

  Future<Movie> getListNowPlaying(String apiKey, int page) {
    return movieRepository.getListNowPlaying(apiKey, page);
  }

  Future<Movie> getListUpComing(String apiKey, int page) {
    return movieRepository.getListUpComing(apiKey, page);
  }

  Future<Movie> getListFavorite(
      String apiKey, int accountId, String sessionId) {
    return movieRepository.getListFavorite(apiKey, accountId, sessionId);
  }

  //get Movie Detail
  Future<MovieDetail> getMovieDetail(String apiKey, int movieId) {
    return movieRepository.getMovieDetail(apiKey, movieId);
  }

  //get credit cast

  Future<CreditCast> getCreditCast(String apiKey, int movieId) {
    return movieRepository.getCreditCast(apiKey, movieId);
  }

  Future<Movie> getListRecommendations(String apiKey, int movieId, int page) {
    return movieRepository.getListRecommendations(apiKey, movieId, page);
  }

  //get reviews
  Future<Reviews> getReviews(String apiKey, int movieId) {
    try {
      return movieRepository.getReviews(apiKey, movieId);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return movieRepository.getReviews(apiKey, movieId);
  }

  //get similar movie
  Future<Movie> getListSimilar(String apiKey, int movieId, int page) {
    try {
      return movieRepository.getListSimilar(apiKey, movieId, page);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return movieRepository.getListSimilar(apiKey, movieId, page);
  }

  //get Movie Image

  Future<MovieImage> getMovieImage(String apiKey, int movieId) {
    try {
      return movieRepository.getMovieImage(apiKey, movieId);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return movieRepository.getMovieImage(apiKey, movieId);
  }

  //get Search Movie
  Future<Movie> getSearchMovie(String apiKey, String query) {
    try {
      return movieRepository.getSearchMovie(apiKey, query);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return movieRepository.getSearchMovie(apiKey, query);
  }

  //get Movie Video

  Future<MovieVideo> getVideo(String apiKey, int movieId) {
    try {
      return movieRepository.getVideo(apiKey, movieId);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return movieRepository.getVideo(apiKey, movieId);
  }
}
