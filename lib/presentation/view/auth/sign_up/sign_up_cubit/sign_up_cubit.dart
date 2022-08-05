import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());

  void signUpEmail(
      String email, String password, String name, String avatarUrl) async {
    emit(state.copyWith(status: SignUpStatus.loading));
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user?.updateDisplayName(name);
      userCredential.user?.updatePhotoURL(avatarUrl);
      emit(state.copyWith(
          status: SignUpStatus.success, successMessage: "Sign up success"));
    } on FirebaseAuthException catch (e) {
      emit(
          state.copyWith(status: SignUpStatus.failed, errorMessage: e.message));
    }
  }

  void signInFacebook() async {
    emit(state.copyWith(status: SignUpStatus.loading));
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();

      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      emit(state.copyWith(
          status: SignUpStatus.successFb,
          successMessage: "SignUp Facebook Successfully"));
    } on Exception catch (e) {
      print(e);
      emit(state.copyWith(
          status: SignUpStatus.failedFb, errorMessage: e.toString()));
    }
  }

  void signInGoogle() async {
    emit(state.copyWith(status: SignUpStatus.loading));
    try {
      final userGoogle = await GoogleSignIn().signIn();
      final googleAuth = await userGoogle!.authentication;
      final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(state.copyWith(
          status: SignUpStatus.successGoogle,
          successMessage: "SignUp Google Successfully"));
    } catch (e) {
      print("error:  $e ");
      emit(state.copyWith(
          status: SignUpStatus.failedGoogle, errorMessage: e.toString()));
    }
  }

  void obsText(bool obsText) {
    emit(state.copyWith(obsText: obsText));
  }

  void confirmObsText(bool obsText) {
    emit(state.copyWith(confirmObsText: obsText));
  }
}
