import 'package:project_demo/domain/repository/account_repository.dart';

import '../../data/model/account/account.dart';
import '../../data/model/creat_request_token/request_token.dart';
import '../../data/model/creat_session/creat_session.dart';

class AccountUseCase {
  final AccountRepository accountRepository;
  AccountUseCase(this.accountRepository);
  Future<Account> getAccount(String apiKey,String sessionId){
    return accountRepository.getAccount(apiKey,sessionId);
  }
  Future<CreatSession> creatSession(String apiKey,String requestToken){
    return accountRepository.creatSession(apiKey,requestToken);
  }
  Future<RequestToken> getRequestToken(String apiKey){
    return accountRepository.getRequestToken(apiKey);
  }
}