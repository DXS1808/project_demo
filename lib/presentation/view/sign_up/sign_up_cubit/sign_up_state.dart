part of 'sign_up_cubit.dart';

enum SignUpStatus { initial, loading, success, failed }

@immutable
class SignUpState extends Equatable {
  final SignUpStatus status;
  final String email;
  final String password;
  final String errorMessage;

  const SignUpState(
      {this.status = SignUpStatus.initial,
      this.email = "",
      this.password = "",
      this.errorMessage = ""});

  @override
  // TODO: implement props
  List<Object?> get props => [status, email, password,errorMessage];

  SignUpState copyWith(
      {SignUpStatus? status,
      String? email,
      String? password,
      String? errorMessage}) {
    return SignUpState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
