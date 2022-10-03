part of 'locale_cubit.dart';

enum LocaleStatus { initial, success, loading }

@immutable
class LocaleState extends Equatable {
  final String languagesCode;
  final LocaleStatus localeStatus;
  const LocaleState(
      {this.languagesCode = "en", this.localeStatus = LocaleStatus.initial});

  @override
  // TODO: implement props
  List<Object?> get props => [languagesCode];

  LocaleState copyWith({
    String? languagesCode,
    LocaleStatus? localeStatus,
  }) {
    return LocaleState(
      languagesCode: languagesCode ?? this.languagesCode,
      localeStatus: localeStatus ?? this.localeStatus,
    );
  }
}
