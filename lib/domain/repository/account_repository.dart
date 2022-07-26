import '../../data/model/account/account.dart';

abstract class AccountRepository{
  Future<Account> getAccount(String apiKey,String sessionId);
}