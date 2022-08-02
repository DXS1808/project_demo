import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  void status() {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));
    Timer(const Duration(seconds: 1), () {
      emit(state.copyWith(profileStatus: ProfileStatus.success)
      );}
    );
  }
}
