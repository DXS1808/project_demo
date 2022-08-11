

import 'package:project_demo/data/model/movie_detail/movie_detail.dart';
import 'package:project_demo/data/model/movie_image/movie_image.dart';
import 'package:project_demo/data/model/reviews/reviews.dart';
import 'package:project_demo/data/model/video_movie/video_movie.dart';
import '../../data/model/cast/cast.dart';
import '../../data/model/movie/movie.dart';

abstract class MovieRepository {
  Future<Movie> getListMovie(String apiKey,int page);

  Future<Movie> getListTopRated(String apiKey,int page);

  Future<Movie> getListNowPlaying(String apiKey,int page);

  Future<Movie> getListUpComing(String apiKey,int page);

  Future<Movie> getListFavorite(String apiKey, int accountId, String sessionId);


  // movie detail

  Future<MovieDetail> getMovieDetail(String apiKey, int movieId);

  // getList Recommendations movie

  Future<Movie> getListRecommendations(String apiKey, int movieId,int page);

//getCreditCast

  Future<CreditCast> getCreditCast(String apiKey, int movieId);

  //get Reviews
  Future<Reviews> getReviews(String apiKey, int movieId);

  //get list similar
  Future<Movie> getListSimilar(String apiKey, int movieId,int page);

  //get MovieImage
  Future<MovieImage> getMovieImage(String apiKey,int movieId);

  //get SearchMovie
  Future<Movie> getSearchMovie(String apiKey, String query);

  //get video Movie

  Future<MovieVideo> getVideo(String apiKey,int movieId);

}
