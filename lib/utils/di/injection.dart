import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:project_demo/data/data_sources/remote/rest_client.dart';
import 'package:project_demo/data/impl/cast_detail_impl.dart';
import 'package:project_demo/data/impl/favorite_impl.dart';
import 'package:project_demo/data/impl/movie_impl.dart';
import 'package:project_demo/domain/repository/cast_detail_repository.dart';
import 'package:project_demo/domain/repository/movie_repository.dart';

import '../../domain/repository/favorite_repository.dart';

GetIt getIt = GetIt.instance;

Future setupInjection() async {
  await _registerNetWork();
  _registerRepository();
}

Future<void> _registerNetWork() async {
  final dio = Dio(BaseOptions(
    baseUrl: "https://api.themoviedb.org/3/",
  ));
  getIt.registerSingleton(dio);
  getIt.registerSingleton(RestClient(dio, baseUrl: dio.options.baseUrl));
}

void _registerRepository() {
  getIt.registerFactory<CastRepository>(
      () => CastDetailImpl(getIt<RestClient>()));
  getIt.registerFactory<FavoriteRepository>(() => FavoriteImpl());
  getIt.registerFactory<MovieRepository>(() => MovieImpl(getIt<RestClient>()));
}
