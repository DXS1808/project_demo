part of 'network_services_cubit.dart';

enum NetworkServicesStatus{initial,online, offline}

@immutable
class NetworkServicesState extends Equatable {
  final NetworkServicesStatus networkServicesStatus;

  const NetworkServicesState({this.networkServicesStatus = NetworkServicesStatus.initial});

  @override
  // TODO: implement props
  List<Object?> get props => [networkServicesStatus];

  NetworkServicesState copyWith({
    NetworkServicesStatus? networkServicesStatus,
  }) {
    return NetworkServicesState(
      networkServicesStatus:
          networkServicesStatus ?? this.networkServicesStatus,
    );
  }
}


