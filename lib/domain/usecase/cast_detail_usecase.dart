import 'package:project_demo/data/model/cast/cast_detail.dart';
import 'package:project_demo/data/model/credit_movie/credit_movie.dart';
import 'package:project_demo/data/model/image_person/cast_image.dart';
import 'package:project_demo/domain/repository/cast_detail_repository.dart';

class CastDetailUseCase{
  CastRepository castRepository;
  CastDetailUseCase(this.castRepository);

  Future<CastDetail> getCastDetail(String apiKey, int castId){
    try{
      return castRepository.getCastDetail(apiKey, castId);
    }catch (e){
      print(e);
    }
    return castRepository.getCastDetail(apiKey, castId);
  }

  Future<CastImage> getCastImage(String apiKey, int castId){
    try{
      return castRepository.getCastImage(apiKey, castId);
    }catch (e){
      print(e);
    }
    return castRepository.getCastImage(apiKey, castId);
  }
  Future<CreditMovie> getCreditMovie(String apiKey, int castId){
    try{
      return castRepository.getCreditMovie(apiKey, castId);
    }catch (e){
      print(e);
    }
    return castRepository.getCreditMovie(apiKey, castId);
  }
}