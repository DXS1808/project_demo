import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/core/router/router.dart';
import 'package:project_demo/data/data_sources/remote/rest_client.dart';
import 'package:project_demo/data/impl/movie_impl.dart';
import 'package:project_demo/domain/usecase/movie_usecase.dart';
import 'package:project_demo/presentation/view/home_screen/home_cubit/home_cubit.dart';
import 'package:project_demo/presentation/view/home_screen/ui/home_screen.dart';
import 'package:project_demo/presentation/view/mark_favorite_cubit/mark_favorite_cubit.dart';
import 'package:project_demo/presentation/view/movie_detail/movie_detail_cubit/movie_detail_cubit.dart';
import 'package:project_demo/presentation/view/splash/ui/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: AppRouter.define,
        home: MultiBlocProvider(providers: [
          BlocProvider<HomeCubit>(
              create: (context) => HomeCubit(
                    MovieUseCase(MovieImpl(RestClient(
                        Dio(BaseOptions(contentType: "application/json"))))),
                  )),
          BlocProvider<MarkFavoriteCubit>(
              create: (context) => MarkFavoriteCubit(
                MovieUseCase(MovieImpl(RestClient(
                    Dio(BaseOptions(contentType: "application/json"))))),
              )),

          // BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        ], child: const MainPage()));
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            print(snapshot.error);
          } else if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const Splash();
        });
  }
}
