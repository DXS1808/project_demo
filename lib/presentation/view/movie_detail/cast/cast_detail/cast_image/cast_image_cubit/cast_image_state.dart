part of 'cast_image_cubit.dart';

enum CastImageStatus{initial,loading,success,failed}

@immutable
class CastImageState extends Equatable {
  final CastImageStatus castImageStatus;
  final List<Profiles> profiles;

  const CastImageState({this.castImageStatus = CastImageStatus.initial,this.profiles = const []});

  @override
  // TODO: implement props
  List<Object?> get props => [castImageStatus,profiles];

  CastImageState copyWith({
    CastImageStatus? castImageStatus,
    List<Profiles>? profiles,
  }) {
    return CastImageState(
      castImageStatus: castImageStatus ?? this.castImageStatus,
      profiles: profiles ?? this.profiles,
    );
  }
}

