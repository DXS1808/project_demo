import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  void get() {
    emit(state.copyWith(splashStatus: SplashStatus.loading));
    try {
      Timer(const Duration(seconds: 4), () {
        emit(state.copyWith(splashStatus: SplashStatus.success));
      });
    } catch (e) {
      emit(state.copyWith(splashStatus: SplashStatus.failed));
    }
  }
}
