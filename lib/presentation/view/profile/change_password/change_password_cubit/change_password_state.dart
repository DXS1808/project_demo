part of 'change_password_cubit.dart';

enum ChangePasswordStatus { initial, loading, success, failed }

@immutable
class ChangePasswordState extends Equatable {
  final ChangePasswordStatus changePasswordStatus;
  final String messageSuccess;
  final String messageFailed;
  final bool obsTextOld;
  final bool obsTextNew;
  final bool obsTextConfirm;

  const ChangePasswordState(
      {this.changePasswordStatus = ChangePasswordStatus.initial,
      this.messageSuccess = "",
      this.messageFailed = "",
      this.obsTextOld = true,
      this.obsTextNew = true,
      this.obsTextConfirm = true});

  @override
  // TODO: implement props
  List<Object?> get props => [
        changePasswordStatus,
        messageSuccess,
        messageFailed,
        obsTextOld,
        obsTextNew,
        obsTextConfirm
      ];

  ChangePasswordState copyWith({
    ChangePasswordStatus? changePasswordStatus,
    String? messageSuccess,
    String? messageFailed,
    bool? obsTextOld,
    bool? obsTextNew,
    bool? obsTextConfirm,
  }) {
    return ChangePasswordState(
      changePasswordStatus: changePasswordStatus ?? this.changePasswordStatus,
      messageSuccess: messageSuccess ?? this.messageSuccess,
      messageFailed: messageFailed ?? this.messageFailed,
      obsTextOld: obsTextOld ?? this.obsTextOld,
      obsTextNew: obsTextNew ?? this.obsTextNew,
      obsTextConfirm: obsTextConfirm ?? this.obsTextConfirm,
    );
  }
}
