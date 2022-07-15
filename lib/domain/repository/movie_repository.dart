import '../../data/model/movie.dart';

abstract class MovieRepository{

  Future<Movie> getListMovie(String apiKey);

  Future<Movie> getListTopRated(String apiKey);
}