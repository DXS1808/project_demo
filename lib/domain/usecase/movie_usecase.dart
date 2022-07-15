import 'package:project_demo/domain/repository/movie_repository.dart';

import '../../data/model/movie.dart';

class MovieUseCase{
  final MovieRepository movieRepository;

  MovieUseCase(this.movieRepository);

  Future<Movie> getListMovie(String apiKey){
    return movieRepository.getListMovie(apiKey);
  }
  Future<Movie> getListTopRated(String apiKey){
    return movieRepository.getListTopRated(apiKey);
  }

}