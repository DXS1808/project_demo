import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/movie_image/movie_image.dart';
import 'package:project_demo/domain/usecase/movie_usecase.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  MovieUseCase movieUseCase;
  ImageCubit(this.movieUseCase) : super(const ImageState());

  void getMovieImage(int movieId) async {
    emit(state.copyWith(imageStatus: ImageStatus.loading));
    try {
      final data = await movieUseCase.getMovieImage(Constants.apiKey, movieId);
      emit(state.copyWith(imageStatus: ImageStatus.success, movieImage: data));
    } catch (e) {
      emit(state.copyWith(imageStatus: ImageStatus.failed));
    }
  }
}
