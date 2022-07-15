part of 'login_cubit.dart';

enum LoginStatus { initial, loading, success, failed }

@immutable
class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final String email;
  final String password;

  const LoginState._(
      {this.loginStatus = LoginStatus.initial,
      this.email = "",
      this.password = ""});

  const LoginState.initial() : this._();

  const LoginState.loading() : this._(loginStatus: LoginStatus.loading);

  const LoginState.success(String email, String password) : this._( email: email,password: password);

  const LoginState.failed() : this._(loginStatus: LoginStatus.failed);

  @override
  // TODO: implement props
  List<Object?> get props => [loginStatus, email, password];
}
