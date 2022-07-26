import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/presentation/view/movie_detail/movie_detail_cubit/movie_detail_cubit.dart';
import 'package:project_demo/presentation/view/profile/change_email/change_email_cubit/change_email_cubit.dart';
import 'package:project_demo/presentation/view/profile/change_email/ui/change_email_ui.dart';
import 'package:project_demo/presentation/view/profile/change_password/change_password_cubit/change_password_cubit.dart';
import 'package:project_demo/presentation/view/profile/change_password/ui/change_password_ui.dart';
import 'package:splashscreen/splashscreen.dart';
import '../../data/impl/cast_detail_impl.dart';
import '../../data/impl/movie_impl.dart';
import '../../domain/usecase/cast_detail_usecase.dart';
import '../../domain/usecase/movie_usecase.dart';
import '../../presentation/common/ultis/rest_client_dio.dart';
import '../../presentation/view/auth/login/login_cubit/login_cubit.dart';
import '../../presentation/view/auth/login/ui/login_screen.dart';
import '../../presentation/view/auth/sign_up/sign_up_cubit/sign_up_cubit.dart';
import '../../presentation/view/auth/sign_up/ui/sign_up_screen.dart';
import '../../presentation/view/home_screen/home_cubit/home_cubit.dart';
import '../../presentation/view/home_screen/ui/home_screen.dart';
import '../../presentation/view/mark_favorite_cubit/mark_favorite_cubit.dart';
import '../../presentation/view/movie_detail/cast/cast_detail/cast_detail_cubit/cast_detail_cubit.dart';
import '../../presentation/view/movie_detail/cast/cast_detail/ui/cast_detail_screen.dart';
import '../../presentation/view/movie_detail/movie_detail_screen.dart';
import '../../presentation/view/splash/ui/splash_screen.dart';

class AppRouter {
  static const String HOME_SCREEN = "/home_screen";
  static const String LOGIN_SCREEN = "/login";
  static const String SIGN_UP = "/signup";
  static const String MOVIE_DETAIL = "/movie_detail";
  static const String CAST_DETAIL = "/cast_detail";
  static const String CHANGE_PASSWORD = "/change_password";
  static const String CHANGE_EMAIL = "/change_email";
  static const String SPLASH = "/splash";
  static Map<String, WidgetBuilder> define = {
    HOME_SCREEN: (context) {
      return MultiBlocProvider(providers: [
        BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(
                  MovieUseCase(MovieImpl(RestClientDio.restClient)),
                )),
      ], child: const HomeScreen());
    },
    LOGIN_SCREEN: (context) {
      return BlocProvider<LoginCubit>.value(
        value: LoginCubit(),
        child: LoginScreen(),
      );
    },
    SIGN_UP: (context) {
      return BlocProvider<SignUpCubit>.value(
        value: SignUpCubit(),
        child: SignUpScreen(),
      );
    },
    MOVIE_DETAIL: (context) {
      final movieId = ModalRoute.of(context)!.settings.arguments as int;
      return MultiBlocProvider(
        providers: [
          BlocProvider<MovieDetailCubit>(
            create: (context) => MovieDetailCubit(
              MovieUseCase(MovieImpl(RestClientDio.restClient)),
            ),
          ),
          BlocProvider<MarkFavoriteCubit>(
            create: (context) => MarkFavoriteCubit(
              MovieUseCase(MovieImpl(RestClientDio.restClient)),
            ),
          ),
        ],
        child: MovieDetailScreen(movieId: movieId),
      );
    },
    CAST_DETAIL: (context) {
      final castId = ModalRoute.of(context)!.settings.arguments as int;
      return BlocProvider<CastDetailCubit>.value(
        value: CastDetailCubit(
            CastDetailUseCase(CastDetailImpl(RestClientDio.restClient))),
        child: CastDetailScreen(
          personId: castId,
        ),
      );
    },
    CHANGE_PASSWORD:(context){
      return BlocProvider<ChangePasswordCubit>.value(
        value: ChangePasswordCubit(),
        child: const ChangePassWord(),
      );
    },
    CHANGE_EMAIL:(context){
      return BlocProvider<ChangeEmailCubit>.value(
        value: ChangeEmailCubit(),
        child: const ChangeEmail(),
      );
    },
    SPLASH:(context){
      return Splash();
    }
  };
}
