import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(const ChangePasswordState());

  void changePassword(String newPassword) async {
    try {
      User user =
          FirebaseAuth.instance.currentUser!;
      user.updatePassword(newPassword);
      emit(state.copyWith(
          changePasswordStatus: ChangePasswordStatus.success,
          messageSuccess: "Change password successfully"));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          changePasswordStatus: ChangePasswordStatus.failed,
          messageFailed: e.toString()));
    }
  }

  void obsTextOld(bool obsText) {
    emit(state.copyWith(obsTextOld: obsText));
  }

  void obsTextNew(bool obsText) {
    emit(state.copyWith(obsTextNew: obsText));
  }

  void confirmObsText(bool obsText) {
    emit(state.copyWith(obsTextConfirm: obsText));
  }
}
