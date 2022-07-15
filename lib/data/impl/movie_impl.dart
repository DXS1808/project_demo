import 'package:dio/dio.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/data_sources/remote/rest_client.dart';
import 'package:project_demo/data/model/movie.dart';
import 'package:project_demo/domain/repository/movie_repository.dart';

class MovieImpl implements MovieRepository {
  RestClient restClient;

  MovieImpl(this.restClient);

  @override
  Future<Movie> getListMovie(String apiKey) {
    return restClient.getListMovie(Constants.apiKey);
  }

  @override
  Future<Movie> getListTopRated(String apiKey) {
    return restClient.getListTopRated(Constants.apiKey);
  }
}
