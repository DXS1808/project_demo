import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'home_bloc_state.dart';

class HomeBlocCubit extends Cubit<HomeBlocState> {

  HomeBlocCubit() : super(const HomeBlocState.initial());


}
