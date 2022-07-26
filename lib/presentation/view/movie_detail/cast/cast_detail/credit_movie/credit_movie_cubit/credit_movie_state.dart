part of 'credit_movie_cubit.dart';

enum CreditMovieStatus{initial, loading, success,failed}

@immutable
class CreditMovieState extends Equatable {

  CreditMovieStatus creditMovieStatus;
  List<CastMovie> castMovie;

  CreditMovieState({this.creditMovieStatus = CreditMovieStatus.initial,this.castMovie = const []});

  @override
  // TODO: implement props
  List<Object?> get props => [creditMovieStatus,castMovie];

  CreditMovieState copyWith({
    CreditMovieStatus? creditMovieStatus,
    List<CastMovie>? castMovie,
  }) {
    return CreditMovieState(
      creditMovieStatus: creditMovieStatus ?? this.creditMovieStatus,
      castMovie: castMovie ?? this.castMovie,
    );
  }

}

