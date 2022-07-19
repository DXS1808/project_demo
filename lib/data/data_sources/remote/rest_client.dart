import 'package:dio/dio.dart';
import 'package:project_demo/data/model/creat_request_token/request_token.dart';
import 'package:project_demo/data/model/favorite/mark_favorite/mark_favorite.dart';
import 'package:project_demo/data/model/favorite/status_favorite/status_favorite.dart';
import 'package:project_demo/data/model/movie_detail/movie_detail.dart';
import 'package:retrofit/http.dart';

import '../../model/account/account.dart';
import '../../model/creat_session/creat_session.dart';
import '../../model/movie/movie.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("movie/popular")
  Future<Movie> getListMovie(@Query("api_key") String apiKey);

  @GET("movie/top_rated")
  Future<Movie> getListTopRated(@Query("api_key") String apiKey);

  @GET("movie/now_playing")
  Future<Movie> getListNowPlaying(@Query("api_key") String apiKey);

  @GET("movie/upcoming")
  Future<Movie> getListUpComing(@Query("api_key") String apiKey);

  @GET("account/{account_id}/favorite/movies")
  Future<Movie> getListFavorite(@Query("api_key") String apiKey,
      @Path("account_id") int accountId, @Query("session_id") String sessionId);

  //get account
  @GET("account")
  Future<Account> getAccount(
      @Query("api_key") String apiKey, @Query("session_id") String sessionId);

  //mark favorite
  @POST("account/{account_id}/favorite")
  Future<StatusFavorite> markFavorite(
      @Query("api_key") String apiKey,
      @Query("session_id") String sessionId,
      @Path("account_id") int accountId,
      @Body() MarkFavorite markFavorite,
      @Header("Content-Type") String contentType);

  @GET('movie/{movie_id}')
  Future<MovieDetail> getMovieDetail(
      @Query("api_key") String apiKey,
      @Path("movie_id") int movieId,
      );


}
