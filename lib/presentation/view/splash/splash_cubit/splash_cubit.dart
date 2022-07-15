import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  void get(){
    emit(const SplashState.initial());
    try{
      emit(const SplashState.success());
    }catch(e){
      emit(const SplashState.failed());
    }
  }
}
