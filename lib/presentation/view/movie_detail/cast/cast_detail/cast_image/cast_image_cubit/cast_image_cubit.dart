import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/image_person/cast_image.dart';
import 'package:project_demo/domain/usecase/cast_detail_usecase.dart';

part 'cast_image_state.dart';

class CastImageCubit extends Cubit<CastImageState> {
  CastDetailUseCase castDetailUseCase;
  CastImageCubit(this.castDetailUseCase) : super(CastImageState());

  void getProfiles (int castId) async{
    emit(state.copyWith(castImageStatus: CastImageStatus.loading));
    try{
      final data = await castDetailUseCase.getCastImage(Constants.API_KEY, castId);
      emit(state.copyWith(castImageStatus: CastImageStatus.success, profiles: data.profiles));
    }catch(e){
      emit(state.copyWith(castImageStatus: CastImageStatus.failed));
    }
  }
}
