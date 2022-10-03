part of 'change_email_cubit.dart';

enum ChangeEmailStatus { initial, loading, success, failed }

@immutable
class ChangeEmailState extends Equatable {
  final ChangeEmailStatus changeEmailStatus;
  final String message;
  const ChangeEmailState(
      {this.changeEmailStatus = ChangeEmailStatus.initial, this.message = ''});

  @override
  // TODO: implement props
  List<Object?> get props => [changeEmailStatus, message];

  ChangeEmailState copyWith({
    ChangeEmailStatus? changeEmailStatus,
    String? message,
  }) {
    return ChangeEmailState(
      changeEmailStatus: changeEmailStatus ?? this.changeEmailStatus,
      message: message ?? this.message,
    );
  }
}
