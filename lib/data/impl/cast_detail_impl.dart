import 'package:flutter/foundation.dart';
import 'package:project_demo/data/data_sources/remote/rest_client.dart';
import 'package:project_demo/data/model/cast/cast_detail.dart';
import 'package:project_demo/data/model/credit_movie/credit_movie.dart';
import 'package:project_demo/data/model/image_person/cast_image.dart';
import 'package:project_demo/domain/repository/cast_detail_repository.dart';

class CastDetailImpl implements CastRepository {
  RestClient restClient;
  CastDetailImpl(this.restClient);

  @override
  Future<CastDetail> getCastDetail(String apiKey, int personId) {
    try {
      restClient.getCastDetail(apiKey, personId);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return restClient.getCastDetail(apiKey, personId);
  }

  @override
  Future<CastImage> getCastImage(String apiKey, int castId) {
    try {
      restClient.getCastImage(apiKey, castId);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return restClient.getCastImage(apiKey, castId);
  }

  @override
  Future<CreditMovie> getCreditMovie(String apiKey, int castId) {
    try {
      restClient.getCreditMovie(apiKey, castId);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return restClient.getCreditMovie(apiKey, castId);
  }
}
