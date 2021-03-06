import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/cast/cast.dart';
import 'package:project_demo/data/model/credit_movie/credit_movie.dart';
import 'package:project_demo/domain/usecase/cast_detail_usecase.dart';

part 'credit_movie_state.dart';

class CreditMovieCubit extends Cubit<CreditMovieState> {
  CastDetailUseCase castDetailUseCase;

  CreditMovieCubit(this.castDetailUseCase) : super(CreditMovieState());


  void getCreditCubit(int castId) async {
    emit(state.copyWith(creditMovieStatus: CreditMovieStatus.loading));
    try{
      final data = await castDetailUseCase.getCreditMovie(Constants.API_KEY, castId);
      emit(state.copyWith(creditMovieStatus: CreditMovieStatus.success,castMovie: data.cast));
    }catch(e){
      emit(state.copyWith(creditMovieStatus: CreditMovieStatus.failed));
    }
  }
}
