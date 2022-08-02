import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/video_movie/video_movie.dart';
import 'package:project_demo/domain/usecase/movie_usecase.dart';

part 'video_movie_state.dart';

class VideoMovieCubit extends Cubit<VideoMovieState> {
  MovieUseCase movieUseCase;

  VideoMovieCubit(this.movieUseCase) : super(VideoMovieState());

  void get(int movieId) async {
    emit(state.copyWith(videoMovieStatus: VideoMovieStatus.loading));
    try {
      final data = await movieUseCase.getVideo(Constants.API_KEY, movieId);
      emit(state.copyWith(
          videoMovieStatus: VideoMovieStatus.success, movieVideo: data));
    } catch (e) {
      emit(state.copyWith(videoMovieStatus: VideoMovieStatus.failed));
    }
  }
}
