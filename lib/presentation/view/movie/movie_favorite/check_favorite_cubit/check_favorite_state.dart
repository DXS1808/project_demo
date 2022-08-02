part of 'check_favorite_cubit.dart';

enum CheckFavoriteStatus {initial,marked,notMarked}

@immutable
class CheckFavoriteState extends Equatable {
  final CheckFavoriteStatus checkFavoriteStatus;

  const CheckFavoriteState({this.checkFavoriteStatus = CheckFavoriteStatus.initial});

  @override
  // TODO: implement props
  List<Object?> get props => [checkFavoriteStatus];

  CheckFavoriteState copyWith({
    CheckFavoriteStatus? checkFavoriteStatus,
  }) {
    return CheckFavoriteState(
      checkFavoriteStatus: checkFavoriteStatus ?? this.checkFavoriteStatus,
    );
  }
}

