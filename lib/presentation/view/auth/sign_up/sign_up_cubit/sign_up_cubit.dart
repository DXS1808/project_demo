import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());

  void success(String email, String password,String name,String avatarUrl) async {
    emit(state.copyWith(status: SignUpStatus.loading));
    try {
      UserCredential userCredential =await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user?.updateDisplayName(name);
      userCredential.user?.updatePhotoURL(avatarUrl);
      emit(state.copyWith(status: SignUpStatus.success,successMessage: "Sign up success"));
    } on FirebaseAuthException catch (e) {
      emit(
          state.copyWith(status: SignUpStatus.failed, errorMessage: e.message));
    }
  }

  void obsText(bool obsText){
    emit(state.copyWith(obsText: obsText));
  }
  void confirmObsText(bool obsText){
    emit(state.copyWith(confirmObsText: obsText));
  }
}
