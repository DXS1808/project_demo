
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/reviews/reviews.dart';
import 'package:project_demo/domain/usecase/movie_usecase.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  MovieUseCase movieUseCase;

  ReviewsCubit(this.movieUseCase) : super(const ReviewsState());

  void getReviews(int movieId) async {
    emit(state.copyWith(reviewsStatus: ReviewsStatus.loading));
    try {
      final data = await movieUseCase.getReviews(Constants.apiKey, movieId);
      // print(jsonEncode(data.results));
      emit(state.copyWith(
          reviewsStatus: ReviewsStatus.success, results: data.results));
    } catch (e) {
      emit(state.copyWith(reviewsStatus: ReviewsStatus.failed));
    }
  }
}
