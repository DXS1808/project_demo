part of 'login_cubit.dart';

enum LoginStatus { initial, loading, success, failed }

@immutable
class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final String email;
  final String password;
  final String errorMessage;

  LoginState(
      {this.loginStatus = LoginStatus.initial,
      this.email = "",
      this.password = "",
      this.errorMessage = ""});

  @override
  // TODO: implement props
  List<Object?> get props => [loginStatus, email, password,errorMessage];

  LoginState copyWith(
      {LoginStatus? loginStatus,
      String? email,
      String? password,
      String? errorMessage}) {
    return LoginState(
        loginStatus: loginStatus ?? this.loginStatus,
        email: email ?? this.email,
        password: password ?? this.password,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
