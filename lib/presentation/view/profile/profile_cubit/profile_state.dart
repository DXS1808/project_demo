part of 'profile_cubit.dart';

enum ProfileStatus { initial, loading, success }

@immutable
class ProfileState extends Equatable {
  final ProfileStatus profileStatus;

  const ProfileState({this.profileStatus = ProfileStatus.initial});
  @override
  // TODO: implement props
  List<Object?> get props => [profileStatus];

  ProfileState copyWith({
    ProfileStatus? profileStatus,
  }) {
    return ProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
    );
  }
}
