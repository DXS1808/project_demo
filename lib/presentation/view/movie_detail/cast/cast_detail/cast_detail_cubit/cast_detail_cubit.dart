import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/domain/usecase/cast_detail_usecase.dart';

import '../../../../../../data/model/cast/cast_detail.dart';

part 'cast_detail_state.dart';

class CastDetailCubit extends Cubit<CastDetailState> {
  CastDetailUseCase castDetailUseCase;

  CastDetailCubit(this.castDetailUseCase) : super(const CastDetailState());

  void getCastDetail(int personId) async {
    emit(state.copyWith(castDetailStatus: CastDetailStatus.loading));
    try {
      final data =
          await castDetailUseCase.getCastDetail(Constants.apiKey, personId);
      emit(state.copyWith(
          castDetailStatus: CastDetailStatus.success, castDetail: data));
    } catch (e) {
      emit(state.copyWith(castDetailStatus: CastDetailStatus.failed));
    }
  }
}
