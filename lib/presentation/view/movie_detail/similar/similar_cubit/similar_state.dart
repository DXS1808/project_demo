part of 'similar_cubit.dart';

enum SimilarStatus{initial,loading,success,failed,isLoading}

@immutable
class SimilarState extends Equatable {
  final List<MovieListItem> movieListItem;
  final SimilarStatus similarStatus;

  const SimilarState({this.movieListItem = const [],this.similarStatus = SimilarStatus.initial });

  @override
  // TODO: implement props
  List<Object?> get props => [movieListItem,similarStatus];

  SimilarState copyWith({
    List<MovieListItem>? movieListItem,
    SimilarStatus? similarStatus,
  }) {
    return SimilarState(
      movieListItem: movieListItem ?? this.movieListItem,
      similarStatus: similarStatus ?? this.similarStatus,
    );
  }

}

