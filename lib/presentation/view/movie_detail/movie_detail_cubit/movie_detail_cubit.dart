import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/movie_detail/movie_detail.dart';
import 'package:project_demo/domain/usecase/movie_usecase.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieUseCase movieUseCase;

  MovieDetailCubit(this.movieUseCase) : super(MovieDetailState());

  void getDetail(int movieId) async {
    emit(state.copyWith(movieDetailStatus: MovieDetailStatus.loading));
    try {
      final data =
          await movieUseCase.getMovieDetail(Constants.API_KEY, movieId);
      emit(state.copyWith(
          movieDetailStatus: MovieDetailStatus.success, movieDetail: data));
    } catch (e) {
      emit(state.copyWith(movieDetailStatus: MovieDetailStatus.failed));
    }
  }
}
