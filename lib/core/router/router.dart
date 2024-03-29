import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/core/router/moive_router_data.dart';
import 'package:project_demo/core/router/movie_favorite_router.dart';
import 'package:project_demo/presentation/view/movie/movie_favorite/check_favorite_cubit/check_favorite_cubit.dart';
import 'package:project_demo/presentation/view/movie_detail/movie_detail_cubit/movie_detail_cubit.dart';
import 'package:project_demo/presentation/common/movie_see_all.dart';
import 'package:project_demo/presentation/view/profile/change_email/change_email_cubit/change_email_cubit.dart';
import 'package:project_demo/presentation/view/profile/change_email/ui/change_email_ui.dart';
import 'package:project_demo/presentation/view/profile/change_password/change_password_cubit/change_password_cubit.dart';
import 'package:project_demo/presentation/view/profile/change_password/ui/change_password_ui.dart';
import 'package:project_demo/services/network_services/network_services_cubit.dart';
import '../../data/impl/cast_detail_impl.dart';
import '../../data/impl/favorite_impl.dart';
import '../../data/impl/movie_impl.dart';
import '../../domain/usecase/cast_detail_usecase.dart';
import '../../domain/usecase/favorite_usecase.dart';
import '../../domain/usecase/movie_usecase.dart';
import '../../presentation/view/auth/login/login_cubit/login_cubit.dart';
import '../../presentation/view/auth/login/ui/login_screen.dart';
import '../../presentation/view/auth/sign_up/sign_up_cubit/sign_up_cubit.dart';
import '../../presentation/view/auth/sign_up/ui/sign_up_screen.dart';
import '../../presentation/view/home_screen/home_cubit/home_cubit.dart';
import '../../presentation/view/home_screen/ui/home_screen.dart';
import '../../presentation/view/movie/movie_favorite/movie_favorite_cubit/movie_favorite_cubit.dart';
import '../../presentation/view/movie_detail/cast/cast_detail/cast_detail_cubit/cast_detail_cubit.dart';
import '../../presentation/view/movie_detail/cast/cast_detail/ui/cast_detail_screen.dart';
import '../../presentation/view/movie_detail/movie_detail_screen.dart';
import '../../presentation/view/splash/ui/splash_screen.dart';
import '../../utils/rest_client_dio.dart';

class AppRouter {
  static const String homeScreen = "/home_screen";
  static const String loginScreen = "/login";
  static const String signUp = "/signup";
  static const String movieDetail = "/movie_detail";
  static const String castDetail = "/cast_detail";
  static const String changePassword = "/change_password";
  static const String changeEmail = "/change_email";
  static const String splash = "/splash";
  static const String movieSeeAll = "/movie_see_all";
  static Map<String, WidgetBuilder> define = {
    homeScreen: (context) {
      return MultiBlocProvider(providers: [
        BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(
                  MovieUseCase(MovieImpl(RestClientDio.restClient)),
                )),
        BlocProvider<NetworkServicesCubit>(
            create: (context) => NetworkServicesCubit()),
      ], child: const HomeScreen());
    },
    loginScreen: (context) {
      return MultiBlocProvider(providers: [
        BlocProvider<LoginCubit>.value(
          value: LoginCubit(),
        ),
      ], child: const LoginScreen());
    },
    signUp: (context) {
      return BlocProvider<SignUpCubit>.value(
        value: SignUpCubit(),
        child: const SignUpScreen(),
      );
    },
    movieDetail: (context) {
      final movieFavoriteRouter =
          ModalRoute.of(context)!.settings.arguments as MovieFavoriteRouter;
      return MultiBlocProvider(
        providers: [
          BlocProvider<MovieDetailCubit>(
            create: (context) => MovieDetailCubit(
              MovieUseCase(MovieImpl(RestClientDio.restClient)),
            ),
          ),
          BlocProvider<MovieFavoriteCubit>.value(
              value: movieFavoriteRouter.movieFavoriteCubit),
          BlocProvider<CheckFavoriteCubit>.value(
            value: CheckFavoriteCubit(),
          ),
        ],
        child: MovieDetailScreen(movieId: movieFavoriteRouter.movieId),
      );
    },
    castDetail: (context) {
      final castId = ModalRoute.of(context)!.settings.arguments as int;
      return MultiBlocProvider(
        providers: [
          BlocProvider<CastDetailCubit>.value(
            value: CastDetailCubit(
                CastDetailUseCase(CastDetailImpl(RestClientDio.restClient))),
          ),
          BlocProvider<MovieFavoriteCubit>.value(
            value: MovieFavoriteCubit(FavoriteUseCase(FavoriteImpl())),
          ),
        ],
        child: CastDetailScreen(
          personId: castId,
        ),
      );
    },
    changePassword: (context) {
      return BlocProvider<ChangePasswordCubit>.value(
        value: ChangePasswordCubit(),
        child: const ChangePassWord(),
      );
    },
    changeEmail: (context) {
      return BlocProvider<ChangeEmailCubit>.value(
        value: ChangeEmailCubit(),
        child: const ChangeEmailScreen(),
      );
    },
    splash: (context) => const Splash(),
    movieSeeAll: (context) {
      final movieRouter =
          ModalRoute.of(context)!.settings.arguments as MovieRouterData;
      return BlocProvider<MovieFavoriteCubit>.value(
        value: MovieFavoriteCubit(FavoriteUseCase(FavoriteImpl())),
        child: MovieSeeAll(
            movieListItem: movieRouter.movieListItem,
            category: movieRouter.category),
      );
    }
  };

  static Route scaleIn(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, page) {
        var begin = 0.0;
        var end = 1.0;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return ScaleTransition(
          scale: animation.drive(tween),
          child: page,
        );
      },
    );
  }
}
