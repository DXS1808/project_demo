part of 'cast_detail_cubit.dart';

enum CastDetailStatus{initial,loading,success,failed}

@immutable
class CastDetailState extends Equatable {
  final CastDetailStatus castDetailStatus;
  final CastDetail ? castDetail;
  const CastDetailState({this.castDetailStatus = CastDetailStatus.initial,this.castDetail});
  @override
  // TODO: implement props
  List<Object?> get props => [castDetailStatus,castDetail];

  CastDetailState copyWith({
    CastDetailStatus? castDetailStatus,
    CastDetail? castDetail,
  }) {
    return CastDetailState(
      castDetailStatus: castDetailStatus ?? this.castDetailStatus,
      castDetail: castDetail ?? this.castDetail,
    );
  }
}

