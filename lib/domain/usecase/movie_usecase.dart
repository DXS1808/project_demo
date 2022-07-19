import 'package:project_demo/domain/repository/movie_repository.dart';

import '../../data/model/movie/movie.dart';

class MovieUseCase{
  final MovieRepository movieRepository;

  MovieUseCase(this.movieRepository);

  Future<Movie> getListPopular(String apiKey){
    return movieRepository.getListMovie(apiKey);
  }
  Future<Movie> getListTopRated(String apiKey){
    return movieRepository.getListTopRated(apiKey);
  }

  Future<Movie> getListNowPlaying(String apiKey){
    return movieRepository.getListNowPlaying(apiKey);
  }
  Future<Movie> getListUpComing(String apiKey){
    return movieRepository.getListUpComing(apiKey);
  }
  Future<Movie> getListFavorite(String apiKey,int accountId, String sessionId){
    return movieRepository.getListFavorite(apiKey, accountId,sessionId);
  }

}