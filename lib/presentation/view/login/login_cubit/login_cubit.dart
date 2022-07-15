import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  // String email;
  // String password;

  LoginCubit() : super(const LoginState.initial());

  void success(String email,String password) async {
    emit(const LoginState.initial());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginState.success(email, password));
    } catch (e) {
      emit(const LoginState.failed());
    }
  }
}
