import 'dart:async';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:project_demo/data/data_sources/local/language/language_local.dart';

import '../l10n.dart';


part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {

  LocaleCubit() : super(const LocaleState());

  void getLanguagesCode() {
    LanguageLocal.getLanguagesCode().then((value) {
      emit(state.copyWith(languagesCode: value));
    });
  }

  void setLocale(String languageCode) {
    emit(state.copyWith(localeStatus: LocaleStatus.loading));
    Timer(const Duration(milliseconds: 500), (){
      try{
        LanguageLocal.setLanguagesCode(languageCode);
        if (!L10n.all.contains(Locale(languageCode))) return;
        emit(state.copyWith(languagesCode: languageCode,localeStatus: LocaleStatus.success));
      }catch(e){
        if (kDebugMode) {
          print(e);
        }
      }
    });
  }
}
