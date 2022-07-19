import 'package:dio/dio.dart';
import 'package:project_demo/data/model/creat_request_token/request_token.dart';
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
  Future<Movie> getListFavorite(
      @Query("api_key") String apiKey, @Path("account_id") int accountId ,@Query("session_id") String sessionId);

  // creat request token
  @GET("authentication/token/new")
  Future<RequestToken> getRequestToken(@Query("api_key") String apiKey);

  // creat session_id
  @POST("authentication/session/new")
  @FormUrlEncoded()
  Future<CreatSession> creatSession(
      @Query("api_key") String apiKey, @Field("request_token") requestToken);

  //get account
  @GET("account")
  Future<Account> getAccount(
      @Query("api_key") String apiKey, @Query("session_id") String sessionId);
}
