import 'package:project_demo/data/data_sources/remote/rest_client.dart';
import 'package:project_demo/data/model/account/account.dart';
import 'package:project_demo/data/model/creat_request_token/request_token.dart';
import 'package:project_demo/data/model/creat_session/creat_session.dart';
import 'package:project_demo/domain/repository/account_repository.dart';

class AccountImpl implements AccountRepository{
  RestClient restClient;
  AccountImpl(this.restClient);

  @override
  Future<Account> getAccount(String apiKey,String sessionId) {
    return restClient.getAccount(apiKey,sessionId);
  }
}