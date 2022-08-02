part of 'login_facebook_cubit.dart';

enum LoginFacebookStatus {initial,success,failed}

@immutable
class LoginFacebookState extends Equatable {
  final LoginFacebookStatus loginFacebookStatus;
  final String message;

  const LoginFacebookState({this.loginFacebookStatus = LoginFacebookStatus.initial,this.message = ""});

  @override
  // TODO: implement props
  List<Object?> get props => [loginFacebookStatus,message];

  LoginFacebookState copyWith({
    LoginFacebookStatus? loginFacebookStatus,
    String? message,
  }) {
    return LoginFacebookState(
      loginFacebookStatus: loginFacebookStatus ?? this.loginFacebookStatus,
      message: message ?? this.message,
    );
  }
}


