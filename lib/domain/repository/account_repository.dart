import '../../data/model/account/account.dart';
import '../../data/model/creat_request_token/request_token.dart';
import '../../data/model/creat_session/creat_session.dart';

abstract class AccountRepository{
  Future<Account> getAccount(String apiKey,String sessionId);
}