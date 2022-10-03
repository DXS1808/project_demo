import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/core/router/router.dart';
import 'package:project_demo/presentation/view/splash/splash_cubit/splash_cubit.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  @override
  void initState() {
    context.read<SplashCubit>().get();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state.splashStatus == SplashStatus.success) {
            Navigator.pushNamed(context, AppRouter.loginScreen);
          }
        },
        child: splashScreen());
  }

  Widget splashScreen() {
    return Material(
        color: Constants.backgroundColor.withOpacity(0.7),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Image.asset(
              'assets/logo-image.png',
              height: 150,
              width: 150,
            ),
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'Welcome to the Movie',
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: Constants.textFontFamily),
                  colors: [
                    Colors.purple,
                    Colors.tealAccent,
                    Colors.yellow,
                    Colors.white,
                  ],
                ),
              ],
              isRepeatingAnimation: true,
              onTap: () {},
            ),
          ],
        ));
  }
}
