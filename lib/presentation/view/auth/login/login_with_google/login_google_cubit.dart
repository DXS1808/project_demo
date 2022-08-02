import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'login_google_state.dart';

class LoginGoogleCubit extends Cubit<LoginGoogleState> {
  LoginGoogleCubit() : super(const LoginGoogleState());

  void signIn() async {
    try {
      final userGoogle = await GoogleSignIn().signIn();
      final googleAuth = await userGoogle!.authentication;
      final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(state.copyWith(loginGoogleStatus: LoginGoogleStatus.success,message: "Login Successfully"));
    } catch (e) {
      print("error:  $e ");
      emit(state.copyWith(loginGoogleStatus: LoginGoogleStatus.failed,message: e.toString()));
    }
  }
}
