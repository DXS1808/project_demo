import 'package:project_demo/domain/repository/account_repository.dart';

import '../../data/model/account/account.dart';

class AccountUseCase {
  final AccountRepository accountRepository;
  AccountUseCase(this.accountRepository);
  Future<Account> getAccount(String apiKey,String sessionId){
    return accountRepository.getAccount(apiKey,sessionId);
  }
}