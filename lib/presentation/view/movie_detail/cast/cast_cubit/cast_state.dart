part of 'cast_cubit.dart';

@immutable
enum CreditCastStatus {initial,loading,success,failed}

@immutable
class CreditCastState extends Equatable {
  final CreditCastStatus creditCastStatus;
  final CreditCast ? creditCast;

  CreditCastState({this.creditCastStatus = CreditCastStatus.initial,this.creditCast});

  @override
  // TODO: implement props
  List<Object?> get props => [creditCastStatus,creditCast];

  CreditCastState copyWith({
    CreditCastStatus? creditCastStatus,
    CreditCast? creditCast,
  }) {
    return CreditCastState(
      creditCastStatus: creditCastStatus ?? this.creditCastStatus,
      creditCast: creditCast ?? this.creditCast,
    );
  }
}
