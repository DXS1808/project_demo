part of 'splash_cubit.dart';

enum SplashStatus { initial, loading, success, failed }

@immutable
class SplashState extends Equatable {
  final SplashStatus splashStatus;

  const SplashState._({this.splashStatus = SplashStatus.initial});

  const SplashState.initial() : this._();

  const SplashState.loading() : this._(splashStatus: SplashStatus.loading);

  const SplashState.success() : this._(splashStatus: SplashStatus.success);

  const SplashState.failed() : this._(splashStatus: SplashStatus.failed);

  @override
  // TODO: implement props
  List<Object?> get props => [splashStatus];
}
