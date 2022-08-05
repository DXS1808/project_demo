import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit() : super(SignOutState());

  void signOut()  async {
    emit(state.copyWith(signOutStatus: SignOutStatus.loading));
    try {
      await GoogleSignIn().signOut();
       FirebaseAuth.instance.signOut();
      emit(state.copyWith(
          signOutStatus: SignOutStatus.success,
          successMessage: "Sign out successfully"));
    } on FirebaseAuthException {
      emit(state.copyWith(signOutStatus: SignOutStatus.failed));
    }
  }
}
