import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  // String email;
  // String password;

  LoginCubit() : super(LoginState());

  void success(String email, String password) async {
    emit(state.copyWith(loginStatus: LoginStatus.initial));
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
}
