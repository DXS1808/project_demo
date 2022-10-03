import 'package:project_demo/data/model/cast/cast_detail.dart';
import 'package:project_demo/data/model/credit_movie/credit_movie.dart';
import 'package:project_demo/data/model/image_person/cast_image.dart';

abstract class CastRepository {
  Future<CastDetail> getCastDetail(String apiKey, int castId);
  Future<CastImage> getCastImage(String apiKey, int castId);
  Future<CreditMovie> getCreditMovie(String apiKey, int castId);
}
