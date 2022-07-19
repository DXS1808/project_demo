import 'package:project_demo/data/data_sources/remote/rest_client.dart';
import 'package:project_demo/data/model/favorite/mark_favorite/mark_favorite.dart';
import 'package:project_demo/data/model/favorite/status_favorite/status_favorite.dart';
import 'package:project_demo/data/model/movie/movie.dart';
import 'package:project_demo/data/model/movie_detail/movie_detail.dart';
import 'package:project_demo/domain/repository/movie_repository.dart';

class MovieImpl implements MovieRepository {
  RestClient restClient;

  MovieImpl(this.restClient);

  @override
  Future<Movie> getListMovie(String apiKey) {
    return restClient.getListMovie(apiKey);
  }

  @override
  Future<Movie> getListTopRated(String apiKey) {
    return restClient.getListTopRated(apiKey);
  }

  @override
  Future<Movie> getListNowPlaying(String apiKey) {
    return restClient.getListNowPlaying(apiKey);
  }

  @override
  Future<Movie> getListUpComing(String apiKey) {
    return restClient.getListUpComing(apiKey);
  }

  @override
  Future<Movie> getListFavorite(String apiKey, int accountId,String sessionId) {
    return restClient.getListFavorite(apiKey, accountId,sessionId);
  }

  @override
  Future<StatusFavorite> markFavoriteMovie(String apiKey,String sessionId, int accountId, MarkFavorite markFavorite,String contentType) {
    return restClient.markFavorite(apiKey,sessionId, accountId, markFavorite,contentType);
  }

  @override
  Future<MovieDetail> getMovieDetail(String apiKey, int movieId) {
    return restClient.getMovieDetail(apiKey, movieId);
  }
}
