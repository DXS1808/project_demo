part of 'splash_cubit.dart';

enum SplashStatus { initial, loading, success, failed }

@immutable
class SplashState extends Equatable {
  final SplashStatus splashStatus;

  const SplashState({this.splashStatus = SplashStatus.initial});

  @override
  // TODO: implement props
  List<Object?> get props => [splashStatus];

  SplashState copyWith({
    SplashStatus? splashStatus,
  }) {
    return SplashState(
      splashStatus: splashStatus ?? this.splashStatus,
    );
  }
}
