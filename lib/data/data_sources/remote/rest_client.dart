import 'package:dio/dio.dart';
import 'package:project_demo/data/model/cast/cast_detail.dart';
import 'package:project_demo/data/model/credit_movie/credit_movie.dart';
import 'package:project_demo/data/model/movie_detail/movie_detail.dart';
import 'package:project_demo/data/model/movie_image/movie_image.dart';
import 'package:project_demo/data/model/reviews/reviews.dart';
import 'package:project_demo/data/model/video_movie/video_movie.dart';
import 'package:retrofit/http.dart';
import '../../model/cast/cast.dart';
import '../../model/image_person/cast_image.dart';
import '../../model/movie/movie.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("movie/popular")
  Future<Movie> getListMovie(
      @Query("api_key") String apiKey, @Query("page") int page);

  @GET("movie/top_rated")
  Future<Movie> getListTopRated(
      @Query("api_key") String apiKey, @Query("page") int page);

  @GET("movie/now_playing")
  Future<Movie> getListNowPlaying(
      @Query("api_key") String apiKey, @Query("page") int page);

  @GET("movie/upcoming")
  Future<Movie> getListUpComing(
      @Query("api_key") String apiKey, @Query("page") int page);

  @GET("account/{account_id}/favorite/movies")
  Future<Movie> getListFavorite(@Query("api_key") String apiKey,
      @Path("account_id") int accountId, @Query("session_id") String sessionId);

  //get movie detail

  @GET('movie/{movie_id}')
  Future<MovieDetail> getMovieDetail(
    @Query("api_key") String apiKey,
    @Path("movie_id") int movieId,
  );

  // get movie recommendations

  @GET('movie/{movie_id}/recommendations')
  Future<Movie> getListRecommendations(@Query("api_key") String apiKey,
      @Path("movie_id") int movieId, @Query("page") int page);

  @GET('movie/{movie_id}/credits')
  Future<CreditCast> getCreditCast(
    @Query("api_key") String apiKey,
    @Path("movie_id") int movieId,
  );

  @GET('movie/{movie_id}/reviews')
  Future<Reviews> getReviews(
    @Query("api_key") String apiKey,
    @Path("movie_id") int movieId,
  );

  @GET('movie/{movie_id}/similar')
  Future<Movie> getSimilar(@Query("api_key") String apiKey,
      @Path("movie_id") int movieId, @Query("page") int page);

  @GET('movie/{movie_id}/images')
  Future<MovieImage> getMovieImage(
    @Query("api_key") String apiKey,
    @Path("movie_id") int movieId,
  );

  //get cast detail

  @GET('person/{person_id}')
  Future<CastDetail> getCastDetail(
    @Query("api_key") String apiKey,
    @Path("person_id") int personId,
  );

  //get castImage

  @GET('person/{person_id}/images')
  Future<CastImage> getCastImage(
    @Query("api_key") String apiKey,
    @Path("person_id") int castId,
  );

  //get credit movie
  @GET('person/{person_id}/movie_credits')
  Future<CreditMovie> getCreditMovie(
    @Query("api_key") String apiKey,
    @Path("person_id") int castId,
  );

  // serach movie

  @GET('search/movie')
  Future<Movie> getSearchMovie(
    @Query("api_key") String apiKey,
    @Query("query") String query,
  );

  @GET('movie/{movie_id}/videos')
  Future<MovieVideo> getVideo(
    @Query("api_key") String apiKey,
    @Path("movie_id") int movieId,
  );
}
