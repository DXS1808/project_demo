import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/domain/usecase/movie_usecase.dart';

import '../../../../../data/model/movie/movie.dart';

part 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  MovieUseCase movieUseCase;

  RecommendationCubit(this.movieUseCase) : super(RecommendationState());

  void get(int movieId, bool isLoading, int page) async {
    if (isLoading == false) {
      emit(state.copyWith(recommendationStatus: RecommendationStatus.loading));
    }
    try {
      List<MovieListItem> listRecommendation = [];
      if (isLoading == false) {
        final data = await movieUseCase.getListRecommendations(
            Constants.API_KEY, movieId, 1);
        listRecommendation.addAll(data.results);
        emit(state.copyWith(
            recommendationStatus: RecommendationStatus.success,
            movieListItem: listRecommendation));
      } else if (isLoading == true) {
        final data = await movieUseCase.getListRecommendations(
            Constants.API_KEY, movieId, page);
        listRecommendation.addAll(data.results);
        emit(state.copyWith(
            recommendationStatus: RecommendationStatus.isLoading,
            movieListItem: listRecommendation));
      }
    } catch (e) {
      emit(state.copyWith(recommendationStatus: RecommendationStatus.failed));
    }
  }
}
