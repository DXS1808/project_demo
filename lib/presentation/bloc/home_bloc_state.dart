part of 'home_bloc_cubit.dart';

enum HomeState {initial, loading, success, failed }
@immutable
 class HomeBlocState extends Equatable {
  const HomeBlocState._();

  const HomeBlocState.initial() : this._();

  @override
  List<Object> get props => [];
}
