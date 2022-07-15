import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {

  SignUpCubit() : super(const SignUpState.initial());

  void loding(){
    emit(const SignUpState.initial());
  }

  void success(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(SignUpState.success(email, password));
    } on FirebaseAuthException catch (e) {
      emit(const SignUpState.failed());
    }
  }
}
