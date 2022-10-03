import 'package:project_demo/data/data_sources/remote/rest_client.dart';
import 'package:project_demo/data/model/movie/movie.dart';
import 'package:project_demo/data/model/movie_detail/movie_detail.dart';
import 'package:project_demo/data/model/movie_image/movie_image.dart';
import 'package:project_demo/data/model/reviews/reviews.dart';
import 'package:project_demo/data/model/video_movie/video_movie.dart';
import 'package:project_demo/domain/repository/movie_repository.dart';

import '../model/cast/cast.dart';

class MovieImpl implements MovieRepository {
  RestClient restClient;

  MovieImpl(this.restClient);

  @override
  Future<Movie> getListMovie(String apiKey,int page) {
    return restClient.getListMovie(apiKey,page);
  }

  @override
  Future<Movie> getListTopRated(String apiKey,int page) {
    return restClient.getListTopRated(apiKey,page);
  }

  @override
  Future<Movie> getListNowPlaying(String apiKey,int page) {
    return restClient.getListNowPlaying(apiKey,page);
  }

  @override
  Future<Movie> getListUpComing(String apiKey,int page) {
    return restClient.getListUpComing(apiKey,page);
  }

  @override
  Future<Movie> getListFavorite(
      String apiKey, int accountId, String sessionId) {
    return restClient.getListFavorite(apiKey, accountId, sessionId);
  }


  @override
  Future<MovieDetail> getMovieDetail(String apiKey, int movieId) {
    return restClient.getMovieDetail(apiKey, movieId);
  }

  @override
  Future<Movie> getListRecommendations(String apiKey, int movieId,int page) {
    return restClient.getListRecommendations(apiKey, movieId,page);
  }

  @override
  Future<CreditCast> getCreditCast(String apiKey, int movieId) {
    return restClient.getCreditCast(apiKey, movieId);
  }

  @override
  Future<Reviews> getReviews(String apiKey, int movieId) {
    return restClient.getReviews(apiKey, movieId);
  }

  @override
  Future<Movie> getListSimilar(String apiKey, int movieId, int page) {
    return restClient.getSimilar(apiKey, movieId, page);
  }

  @override
  Future<MovieImage> getMovieImage(String apiKey, int movieId) {
    return restClient.getMovieImage(apiKey, movieId);
  }

  @override
  Future<Movie> getSearchMovie(String apiKey, String query) {
    return restClient.getSearchMovie(apiKey, query);
  }

  @override
  Future<MovieVideo> getVideo(String apiKey,int movieId) {
    return restClient.getVideo(apiKey, movieId);
  }

  Future removeFavorite(String userId, int movieId) {
    // TODO: implement removeFavorite
    throw UnimplementedError();
  }
}
