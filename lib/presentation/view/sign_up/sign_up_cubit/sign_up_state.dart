part of 'sign_up_cubit.dart';

enum SignUpStatus { initial, loading, success, failed }

@immutable
class SignUpState extends Equatable {
  final SignUpStatus status;
  final String email;
  final String password;

  const SignUpState._(
      {this.status = SignUpStatus.initial,
      this.email = "",
      this.password = ""});

  const SignUpState.initial() : this._();

  const SignUpState.loading() : this._(status: SignUpStatus.loading);

  const SignUpState.success(String email, String password)
      : this._(status: SignUpStatus.success, email: email, password: password);

  const SignUpState.failed() : this._(status: SignUpStatus.failed);

  @override
  // TODO: implement props
  List<Object?> get props => [status, email, password];
}
