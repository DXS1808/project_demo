import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/presentation/view/home_screen/ui/home_screen.dart';
import 'package:project_demo/presentation/view/login/login_cubit/login_cubit.dart';
import 'package:project_demo/presentation/view/login/ui/login_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds:BlocProvider(
        create: (context) => LoginCubit(),
        child: LoginScreen(),
      ),
      title: const Text(
        'Welcome In MovieFilm',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: Image.asset(
          'assets/images.png'),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
}
