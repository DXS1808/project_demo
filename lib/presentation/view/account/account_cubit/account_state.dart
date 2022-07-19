part of 'account_cubit.dart';

enum AccountStatus {initial,loading,success,failed,creatSession,requestToken,getAccount}

@immutable
class AccountState {
  AccountStatus accountStatus;
  Account  ? account;
  CreatSession ? creatSession;
  RequestToken ? requestToken;
  AccountState({
    this.accountStatus = AccountStatus.initial,this.account,this.creatSession,this.requestToken
});

  @override
  // TODO: implement props
  List<Object?> get props => [accountStatus,account,creatSession,requestToken];

  AccountState copyWith({
    AccountStatus? accountStatus,
    Account? account,
    CreatSession? creatSession,
    RequestToken? requestToken,
  }) {
    return AccountState(
      accountStatus: accountStatus ?? this.accountStatus,
      account: account ?? this.account,
      creatSession: creatSession ?? this.creatSession,
      requestToken: requestToken ?? this.requestToken,
    );
  }
}

