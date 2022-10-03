part of 'check_favorite_cubit.dart';

enum CheckFavoriteStatus { initial, marked, notMarked }

@immutable
class CheckFavoriteState extends Equatable {
  final int? id;
  final CheckFavoriteStatus checkFavoriteStatus;

  const CheckFavoriteState(
      {this.checkFavoriteStatus = CheckFavoriteStatus.initial, this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [checkFavoriteStatus, id];

  CheckFavoriteState copyWith({
    int? id,
    CheckFavoriteStatus? checkFavoriteStatus,
  }) {
    return CheckFavoriteState(
      id: id ?? this.id,
      checkFavoriteStatus: checkFavoriteStatus ?? this.checkFavoriteStatus,
    );
  }
}
