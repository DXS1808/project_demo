part of 'login_google_cubit.dart';

enum LoginGoogleStatus {initial,success,failed}

@immutable
class LoginGoogleState extends Equatable {
  final LoginGoogleStatus loginGoogleStatus;
  final String message;

  const LoginGoogleState({this.loginGoogleStatus = LoginGoogleStatus.initial,this.message = ""});
  @override
  // TODO: implement props
  List<Object?> get props => [loginGoogleStatus,message];

  LoginGoogleState copyWith({
    LoginGoogleStatus? loginGoogleStatus,
    String? message,
  }) {
    return LoginGoogleState(
      loginGoogleStatus: loginGoogleStatus ?? this.loginGoogleStatus,
      message: message ?? this.message,
    );
  }
}


