import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/domain/usecase/movie_usecase.dart';

import '../../../../../data/model/movie/movie.dart';

part 'movie_favorite_state.dart';

class MovieFavoriteCubit extends Cubit<MovieFavoriteState> {
  MovieUseCase movieUseCase;

  MovieFavoriteCubit(this.movieUseCase) : super(MovieFavoriteState());

  void get(int accountId,String sessionId) async {
    emit(state.copyWith(movieFavoriteStatus: MovieFavoriteStatus.loading));
    try {
      final data =
          await movieUseCase.getListFavorite(Constants.API_KEY, accountId,sessionId);
      emit(state.copyWith(
          movieFavoriteStatus: MovieFavoriteStatus.success,
          getListFavorite: data.results));
    } catch (e) {
      emit(state.copyWith(
          movieFavoriteStatus: MovieFavoriteStatus.failed,
          errorMessage: e.toString()));
    }
  }
}
