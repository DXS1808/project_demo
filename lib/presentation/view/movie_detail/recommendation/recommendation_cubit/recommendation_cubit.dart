import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/domain/usecase/movie_usecase.dart';

import '../../../../../data/model/movie/movie.dart';

part 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  MovieUseCase movieUseCase;

  RecommendationCubit(this.movieUseCase) : super(RecommendationState());

  void get(int movieId) async {
    emit(state.copyWith(recommendationStatus: RecommendationStatus.loading));
    try {
      final data =
          await movieUseCase.getListRecommendations(Constants.API_KEY, movieId);
      emit(state.copyWith(
          recommendationStatus: RecommendationStatus.success, movie: data));
    } catch (e) {
      emit(state.copyWith(recommendationStatus: RecommendationStatus.failed));
    }
  }
}
