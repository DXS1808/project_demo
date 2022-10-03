part of 'recommendation_cubit.dart';

enum RecommendationStatus { initial, loading, success, failed,isLoading}

@immutable
class RecommendationState extends Equatable {
  final RecommendationStatus recommendationStatus;
  final List<MovieListItem> movieListItem;

  const RecommendationState(
      {this.recommendationStatus = RecommendationStatus.initial, this.movieListItem = const[]});

  @override
  // TODO: implement props
  List<Object?> get props => [recommendationStatus, movieListItem];

  RecommendationState copyWith({
    RecommendationStatus? recommendationStatus,
    List<MovieListItem>? movieListItem,
  }) {
    return RecommendationState(
      recommendationStatus: recommendationStatus ?? this.recommendationStatus,
      movieListItem: movieListItem ?? this.movieListItem,
    );
  }
}
