import 'package:project_demo/data/model/favorite/mark_favorite/mark_favorite.dart';
import 'package:project_demo/data/model/favorite/status_favorite/status_favorite.dart';
import 'package:project_demo/domain/repository/movie_repository.dart';

import '../../data/model/movie/movie.dart';
import '../../data/model/movie_detail/movie_detail.dart';

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

  //mark Favorite

  Future<StatusFavorite> markFavoriteMovie(String apiKey,String sessionId, int accountId, MarkFavorite markFavorite,String contentType){
    return movieRepository.markFavoriteMovie(apiKey,sessionId, accountId, markFavorite,contentType);
  }

  //get Movie Detail
  Future<MovieDetail> getMovieDetail(String apiKey, int movieId){
    return movieRepository.getMovieDetail(apiKey, movieId);
  }
}