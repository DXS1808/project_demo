import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/favorite/mark_favorite/mark_favorite.dart';
import 'package:project_demo/domain/usecase/movie_usecase.dart';

part 'mark_favorite_state.dart';

class MarkFavoriteCubit extends Cubit<MarkFavoriteState> {
  MovieUseCase movieUseCase;

  MarkFavoriteCubit(this.movieUseCase) : super(MarkFavoriteState());

  void markFavorite( MarkFavorite markFavorite) async {
    try {
      final data = await movieUseCase.markFavoriteMovie(
          Constants.API_KEY,Constants.SESSION_ID, Constants.ACCOUNT_ID, markFavorite,"application/json");
      emit(state.copyWith(
          markFavoriteStatus: MarkFavoriteStatus.success,
          message: data.statusMessage,));
    } catch (e) {
      emit(state.copyWith(markFavoriteStatus: MarkFavoriteStatus.failed));
    }
  }
  void isFavorite( bool isFavorite){
    emit(state.copyWith(isFavorite: isFavorite));
  }
}
