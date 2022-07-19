part of 'mark_favorite_cubit.dart';

enum MarkFavoriteStatus { initial, success, failed }

@immutable
class MarkFavoriteState extends Equatable {
  final MarkFavoriteStatus markFavoriteStatus;
  final String message;
  final bool ? isFavorite;

  MarkFavoriteState(
      {this.markFavoriteStatus = MarkFavoriteStatus.initial,
      this.message = "",
      this.isFavorite});

  @override
  // TODO: implement props
  List<Object?> get props => [markFavoriteStatus, isFavorite,message];

  MarkFavoriteState copyWith({
    MarkFavoriteStatus? markFavoriteStatus,
    String? message,
    bool? isFavorite,
  }) {
    return MarkFavoriteState(
      markFavoriteStatus: markFavoriteStatus ?? this.markFavoriteStatus,
      message: message ?? this.message,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
