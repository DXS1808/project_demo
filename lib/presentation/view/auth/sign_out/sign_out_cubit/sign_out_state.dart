part of 'sign_out_cubit.dart';

enum SignOutStatus {initial, loading,success,failed}

@immutable
class SignOutState extends Equatable {
  final SignOutStatus signOutStatus;
  final String successMessage;
  SignOutState({this.signOutStatus = SignOutStatus.initial,this.successMessage = ""});
  @override
  // TODO: implement props
  List<Object?> get props => [signOutStatus,successMessage];

  SignOutState copyWith({
    SignOutStatus? signOutStatus,
    String? successMessage,
  }) {
    return SignOutState(
      signOutStatus: signOutStatus ?? this.signOutStatus,
      successMessage: successMessage ?? this.successMessage,
    );
  }
}


