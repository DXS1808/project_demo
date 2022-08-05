part of 'sign_up_cubit.dart';

enum SignUpStatus { initial, loading, success, failed,successFb,successGoogle,failedFb,failedGoogle }

@immutable
class SignUpState extends Equatable {
  final SignUpStatus status;
  final String email;
  final String password;
  final String errorMessage;
  final String successMessage;
  final bool obsText;
  final bool confirmObsText;

  const SignUpState({
    this.status = SignUpStatus.initial,
    this.email = "",
    this.password = "",
    this.errorMessage = "",
    this.successMessage = "",
    this.obsText = true,
    this.confirmObsText = true,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [status, email, password, errorMessage,successMessage,obsText,confirmObsText];

  SignUpState copyWith({
    SignUpStatus? status,
    String? email,
    String? password,
    String? errorMessage,
    String? successMessage,
    bool? obsText,
    bool? confirmObsText,
  }) {
    return SignUpState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
      obsText: obsText ?? this.obsText,
      confirmObsText: confirmObsText ?? this.confirmObsText,
    );
  }
}
