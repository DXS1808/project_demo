import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
part 'network_services_state.dart';

class NetworkServicesCubit extends Cubit<NetworkServicesState> {
  NetworkServicesCubit() : super(const NetworkServicesState());

  void checkNetWork() async {
    final result = await Connectivity().checkConnectivity();
    try {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        emit(state.copyWith(
            networkServicesStatus: NetworkServicesStatus.online));
      } else {
        emit(state.copyWith(
            networkServicesStatus: NetworkServicesStatus.offline));
      }
    } on SocketException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
