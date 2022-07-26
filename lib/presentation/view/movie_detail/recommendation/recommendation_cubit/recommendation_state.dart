part of 'recommendation_cubit.dart';

enum RecommendationStatus { initial, loading, success, failed }

@immutable
class RecommendationState extends Equatable {
  final RecommendationStatus recommendationStatus;
  final Movie? movie;

  RecommendationState(
      {this.recommendationStatus = RecommendationStatus.initial, this.movie});

  @override
  // TODO: implement props
  List<Object?> get props => [recommendationStatus,movie];

  RecommendationState copyWith({
    RecommendationStatus? recommendationStatus,
    Movie? movie,
  }) {
    return RecommendationState(
      recommendationStatus: recommendationStatus ?? this.recommendationStatus,
      movie: movie ?? this.movie,
    );
  }
}
