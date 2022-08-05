part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  failed,
  obsText,
  successFacebook,
  successGoogle,
  failedFb,
  failedGoogle
}

@immutable
class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final String email;
  final String password;
  final String errorMessage;
  final String successMessage;
  final bool obscureText;

  LoginState(
      {this.loginStatus = LoginStatus.initial,
      this.email = "",
      this.password = "",
      this.errorMessage = "",
      this.obscureText = true,
      this.successMessage = ""});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [loginStatus, email, password, errorMessage, obscureText, successMessage];

  LoginState copyWith({
    LoginStatus? loginStatus,
    String? email,
    String? password,
    String? errorMessage,
    String? successMessage,
    bool? obscureText,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}
