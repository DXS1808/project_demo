import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void signIn(String email, String password) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(state.copyWith(
          loginStatus: LoginStatus.success, successMessage: "Login Successfully"));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          loginStatus: LoginStatus.failed, errorMessage: e.message));
    }
  }

  void obsText(bool obsText) {
    emit(
        state.copyWith(loginStatus: LoginStatus.obsText, obscureText: obsText));
  }

  void signInFacebook() async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      emit(state.copyWith(
          loginStatus: LoginStatus.successFacebook,
          successMessage: "Login Facebook Successfully"));
    } on Exception catch (e) {
      emit(state.copyWith(
          loginStatus: LoginStatus.failedFb,
          errorMessage: e.toString()));
    }
  }

  void signInGoogle() async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    try {
      final userGoogle = await GoogleSignIn().signIn();
      final googleAuth = await userGoogle!.authentication;
      final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(state.copyWith(loginStatus: LoginStatus.successGoogle,successMessage: "Login Google Successfully"));
    } catch (e) {
      emit(state.copyWith(loginStatus: LoginStatus.failedGoogle,errorMessage: e.toString()));
    }
  }
}
