part of 'cast_movie_cubit.dart';

enum CreditMovieStatus{initial, loading, success,failed}

@immutable
class CreditMovieState extends Equatable {

  final CreditMovieStatus creditMovieStatus;
  final List<CastMovie> castMovie;
  final List<CastCareer> castCareer;

  const CreditMovieState({this.creditMovieStatus = CreditMovieStatus.initial,this.castMovie = const [],this.castCareer = const []});

  @override
  // TODO: implement props
  List<Object?> get props => [creditMovieStatus,castMovie,castCareer];

  CreditMovieState copyWith({
    CreditMovieStatus? creditMovieStatus,
    List<CastMovie>? castMovie,
    List<CastCareer>? castCareer,
  }) {
    return CreditMovieState(
      creditMovieStatus: creditMovieStatus ?? this.creditMovieStatus,
      castMovie: castMovie ?? this.castMovie,
      castCareer: castCareer ?? this.castCareer,
    );
  }
}

