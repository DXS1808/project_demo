import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../config/constants.dart';
import '../../../../../data/model/cast/cast.dart';
import '../../../../../domain/usecase/movie_usecase.dart';

part 'cast_state.dart';

class CreditCastCubit extends Cubit<CreditCastState> {
  MovieUseCase movieUseCase;
  CreditCastCubit(this.movieUseCase) : super(CreditCastState());

  void get(int movieId) async {
    emit(state.copyWith(creditCastStatus: CreditCastStatus.loading));
    try{
      final data = await movieUseCase.getCreditCast(Constants.API_KEY, movieId);
      emit(state.copyWith(creditCastStatus: CreditCastStatus.success,creditCast: data));
    }catch(e){
      emit(state.copyWith(creditCastStatus: CreditCastStatus.failed));
    }
  }
}
