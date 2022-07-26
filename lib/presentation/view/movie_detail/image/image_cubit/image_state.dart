part of 'image_cubit.dart';

enum ImageStatus{initial, loading, success, failed}

@immutable
class ImageState extends Equatable {
  ImageStatus imageStatus;
  MovieImage ? movieImage;

  ImageState({this.imageStatus = ImageStatus.initial,this.movieImage});

  @override
  // TODO: implement props
  List<Object?> get props => [imageStatus,movieImage];

  ImageState copyWith({
    ImageStatus? imageStatus,
    MovieImage? movieImage,
  }) {
    return ImageState(
      imageStatus: imageStatus ?? this.imageStatus,
      movieImage: movieImage ?? this.movieImage,
    );
  }
}


