import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/movie/movie.dart';
import 'package:project_demo/domain/usecase/movie_usecase.dart';

part 'similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  MovieUseCase movieUseCase;
  SimilarCubit(this.movieUseCase) : super(const SimilarState());

  void get(int movieId, bool isLoading, int page) async {
    if (isLoading == false) {
      emit(state.copyWith(similarStatus: SimilarStatus.loading));
    }
    try {
      List<MovieListItem> listSimilar = [];
      if (isLoading == false) {
        final data = await movieUseCase.getListSimilar(
            Constants.apiKey, movieId, 1);
        listSimilar.addAll(data.results);
        emit(state.copyWith(
            similarStatus: SimilarStatus.success,
            movieListItem: listSimilar));
      } else if (isLoading == true) {
        final data = await movieUseCase.getListSimilar(
            Constants.apiKey, movieId, page);
        listSimilar.addAll(data.results);
        emit(state.copyWith(
            similarStatus: SimilarStatus.isLoading,
            movieListItem: listSimilar));
      }
    } catch (e) {
      emit(state.copyWith(similarStatus: SimilarStatus.failed));
    }
  }
}
