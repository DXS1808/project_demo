
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_demo/core/router/router.dart';
import 'package:project_demo/data/check_connection/check_connection.dart';
import 'package:project_demo/data/impl/movie_impl.dart';
import 'package:project_demo/data/model/favorite/favorite.dart';
import 'package:project_demo/domain/usecase/movie_usecase.dart';
import 'package:project_demo/presentation/common/ultis/rest_client_dio.dart';
import 'package:project_demo/presentation/view/auth/sign_out/sign_out_cubit/sign_out_cubit.dart';
import 'package:project_demo/presentation/view/home_screen/home_cubit/home_cubit.dart';
import 'package:project_demo/presentation/view/home_screen/ui/home_screen.dart';
import 'package:project_demo/presentation/view/splash/splash_cubit/splash_cubit.dart';
import 'package:project_demo/presentation/view/splash/ui/splash_screen.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:project_demo/services/network_services/network_services_cubit.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteAdapter());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    Connection.checkUserConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: (context, child) => Stack(
              children: [child!, const DropdownAlert()],
            ),
        routes: AppRouter.define,
        home: MultiBlocProvider(providers: [
          BlocProvider<HomeCubit>(
            create: (context) =>
                HomeCubit(MovieUseCase(MovieImpl(RestClientDio.restClient))),
          ),
          BlocProvider<SignOutCubit>(
            create: (context) => SignOutCubit(),
          ),
          BlocProvider<SplashCubit>(
            create: (context) => SplashCubit(),
          ),
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
            Hive.openBox<Favorite>(
                "favorite_${FirebaseAuth.instance.currentUser?.uid}");
            return BlocProvider<NetworkServicesCubit>(
              create: (context) => NetworkServicesCubit(),
              child: const HomeScreen(),
            );
          }
          return const Splash();
        });
  }
}
