part of 'video_movie_cubit.dart';

enum VideoMovieStatus {initial,loading,success,failed}

@immutable
class VideoMovieState extends Equatable {
  final VideoMovieStatus videoMovieStatus;
  final MovieVideo ? movieVideo;

  VideoMovieState({this.videoMovieStatus = VideoMovieStatus.initial,this.movieVideo});

  @override
  // TODO: implement props
  List<Object?> get props => [videoMovieStatus,movieVideo];

  VideoMovieState copyWith({
    VideoMovieStatus? videoMovieStatus,
    MovieVideo? movieVideo,
  }) {
    return VideoMovieState(
      videoMovieStatus: videoMovieStatus ?? this.videoMovieStatus,
      movieVideo: movieVideo ?? this.movieVideo,
    );
  }
}


