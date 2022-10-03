import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'change_email_state.dart';

class ChangeEmailCubit extends Cubit<ChangeEmailState> {
  ChangeEmailCubit() : super(const ChangeEmailState());

  void changeEmail(String email) {
    try {
      User user = FirebaseAuth.instance.currentUser!;
      user.updateEmail(email);
      emit(state.copyWith(
          changeEmailStatus: ChangeEmailStatus.success,
          message: "Change email successfully"));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          changeEmailStatus: ChangeEmailStatus.failed, message: e.toString()));
    }
  }
}
