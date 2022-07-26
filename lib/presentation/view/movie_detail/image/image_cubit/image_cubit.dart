import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/movie_image/movie_image.dart';
import 'package:project_demo/domain/usecase/movie_usecase.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  MovieUseCase movieUseCase;
  ImageCubit(this.movieUseCase) : super(ImageState());


  void getMovieImage (int movieId) async{
    emit(state.copyWith(imageStatus: ImageStatus.loading));
    try{
      final data = await movieUseCase.getMovieImage(Constants.API_KEY, movieId);
      print("image detail : ${jsonEncode(data.backdrops)}");
      emit(state.copyWith(imageStatus: ImageStatus.success, movieImage: data));
    }catch (e){
      emit(state.copyWith(imageStatus: ImageStatus.failed));
    }
  }
}
