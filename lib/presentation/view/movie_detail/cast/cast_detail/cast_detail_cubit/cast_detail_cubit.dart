import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/domain/usecase/cast_detail_usecase.dart';

import '../../../../../../data/model/cast/cast_detail.dart';

part 'cast_detail_state.dart';

class CastDetailCubit extends Cubit<CastDetailState> {
  CastDetailUseCase castDetailUseCase;

  CastDetailCubit(this.castDetailUseCase) : super(CastDetailState());

  void getCastDetail(int personId) async {
    emit(state.copyWith(castDetailStatus: CastDetailStatus.loading));
    try {
      final data =
          await castDetailUseCase.getCastDetail(Constants.API_KEY, personId);
      emit(state.copyWith(
          castDetailStatus: CastDetailStatus.success, castDetail: data));
    } catch (e) {
      emit(state.copyWith(castDetailStatus: CastDetailStatus.failed));
    }
  }
}
