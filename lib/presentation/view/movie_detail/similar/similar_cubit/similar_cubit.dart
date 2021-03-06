import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/movie/movie.dart';
import 'package:project_demo/domain/usecase/movie_usecase.dart';

part 'similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  MovieUseCase movieUseCase;
  SimilarCubit(this.movieUseCase) : super(SimilarState());

  void get (int movieId) async{
    emit(state.copyWith(similarStatus: SimilarStatus.loading));
    try{
      final data = await movieUseCase.getListSimilar(Constants.API_KEY, movieId);
      emit(state.copyWith(similarStatus: SimilarStatus.success,movieListItem: data.results));
    }catch(e){
      emit(state.copyWith(similarStatus: SimilarStatus.failed));
    }
  }
}
