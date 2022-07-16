import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/movie.dart';
import 'package:project_demo/domain/usecase/movie_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  MovieUseCase movieUseCase;

  HomeCubit(this.movieUseCase) : super(HomeState());

  void getPopularList() async {
    emit(state.copyWith(homeStatus: HomeStatus.initial));
    try {
      final data = await movieUseCase.getListPopular(Constants.API_KEY);
      emit(state.copyWith(
          homeStatus: HomeStatus.getPopularList, popularList: data.results));
    } catch (e) {
      emit(state.copyWith(homeStatus: HomeStatus.failed));
    }
  }

  void getTopRatedList() async {
    emit(state.copyWith(homeStatus: HomeStatus.initial));
    try {
      final data = await movieUseCase.getListTopRated(Constants.API_KEY);
      emit(state.copyWith(
          homeStatus: HomeStatus.getTopRatedList, topRatedList: data.results));
    } catch (e) {
      emit(state.copyWith(homeStatus: HomeStatus.failed));
    }
  }

  void getNowPlayingList() async {
    emit(state.copyWith(homeStatus: HomeStatus.initial));
    try {
      final data = await movieUseCase.getListNowPlaying(Constants.API_KEY);
      emit(state.copyWith(
          homeStatus: HomeStatus.getNowPlayingList,
          nowPlayingList: data.results));
    } catch (e) {
      emit(state.copyWith(homeStatus: HomeStatus.failed));
    }
  }
}
