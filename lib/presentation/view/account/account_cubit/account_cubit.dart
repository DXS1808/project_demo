import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_demo/data/model/creat_request_token/request_token.dart';
import 'package:project_demo/data/model/creat_session/creat_session.dart';
import 'package:project_demo/domain/usecase/account_usecase.dart';
import 'package:project_demo/presentation/view/home_screen/home_cubit/home_cubit.dart';

import '../../../../config/constants.dart';
import '../../../../data/model/account/account.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountUseCase accountUseCase;

  AccountCubit(this.accountUseCase) : super(AccountState());

  void getAccount(String sessionId) async {
    emit(state.copyWith(accountStatus: AccountStatus.initial));
    try {
      final data =
          await accountUseCase.getAccount(Constants.API_KEY, sessionId);
      emit(state.copyWith(accountStatus: AccountStatus.getAccount, account: data));
    } catch (e) {
      print(e);
      emit(state.copyWith(accountStatus: AccountStatus.failed));
    }
  }

}
