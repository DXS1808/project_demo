import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/data_sources/remote/rest_client.dart';
import 'package:project_demo/data/model/movie.dart';
import 'package:project_demo/domain/usecase/movie_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  MovieUseCase movieUseCase;

  HomeCubit(this.movieUseCase) : super(const HomeState.initial());

  void loading() {}

  void get() async {
    emit(const HomeState.loading());
    try {
      final result = await movieUseCase.getListMovie(Constants.apiKey);
      emit(HomeState.success(result));
    } catch (e) {
      emit(const HomeState.failed());
    }
  }
}
