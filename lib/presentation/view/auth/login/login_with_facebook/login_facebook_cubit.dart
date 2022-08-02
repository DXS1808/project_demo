import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:meta/meta.dart';

part 'login_facebook_state.dart';

class LoginFacebookCubit extends Cubit<LoginFacebookState> {
  LoginFacebookCubit() : super(const LoginFacebookState());

  void signInFacebook() async {
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();

      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      emit(state.copyWith(
          loginFacebookStatus: LoginFacebookStatus.success,
          message: "Login Successfully"));
    } on Exception catch (e) {
      print(e);
      emit(state.copyWith(
          loginFacebookStatus: LoginFacebookStatus.failed,
          message: e.toString()));
    }
  }
}
