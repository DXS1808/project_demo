import '../../data/model/movie/movie.dart';

abstract class MovieRepository{

  Future<Movie> getListMovie(String apiKey);

  Future<Movie> getListTopRated(String apiKey);

  Future<Movie> getListNowPlaying (String apiKey);

  Future<Movie> getListUpComing(String apiKey);

  Future<Movie> getListFavorite(String apiKey,int accountId,String sessionId);
}