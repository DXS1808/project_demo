part of 'account_cubit.dart';

enum AccountStatus {initial,loading,success,failed,creatSession,requestToken,getAccount}

@immutable
class AccountState extends Equatable {
  AccountStatus accountStatus;
  Account  ? account;
  AccountState({
    this.accountStatus = AccountStatus.initial,this.account
});

  @override
  // TODO: implement props
  List<Object?> get props => [accountStatus,account];

  AccountState copyWith({
    AccountStatus? accountStatus,
    Account? account,
  }) {
    return AccountState(
      accountStatus: accountStatus ?? this.accountStatus,
      account: account ?? this.account,
    );
  }
}

