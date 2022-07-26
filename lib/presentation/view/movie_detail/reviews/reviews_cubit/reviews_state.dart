part of 'reviews_cubit.dart';

enum ReviewsStatus{initial,loading,success,failed}

@immutable
class ReviewsState extends Equatable {
  final List<Results> results;
  final ReviewsStatus reviewsStatus;

  ReviewsState({this.reviewsStatus = ReviewsStatus.initial,this.results = const []});

  @override
  // TODO: implement props
  List<Object?> get props => [results,reviewsStatus];

  ReviewsState copyWith({
    List<Results>? results,
    ReviewsStatus? reviewsStatus,
  }) {
    return ReviewsState(
      results: results ?? this.results,
      reviewsStatus: reviewsStatus ?? this.reviewsStatus,
    );
  }
}

