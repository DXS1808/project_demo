import 'package:project_demo/data/data_sources/remote/rest_client.dart';
import 'package:project_demo/data/model/movie/movie.dart';
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
}
