import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  void get(){
    emit(state.copyWith(splashStatus: SplashStatus.loading));
    try{
      emit(state.copyWith(splashStatus: SplashStatus.success));
    }catch(e){
      emit(state.copyWith(splashStatus: SplashStatus.failed));
    }
  }
}
