import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../model/movie.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/movie/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("popular")
  Future<Movie> getListMovie(@Query("api_key") String apiKey);
  @GET("top_rated")
  Future<Movie> getListTopRated(@Query("api_key") String apiKey);
}
