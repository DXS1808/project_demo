import 'package:flutter/cupertino.dart';
import 'package:project_demo/presentation/view/login/ui/login_screen.dart';
import 'package:project_demo/presentation/view/sign_up/ui/sign_up_screen.dart';

import '../../presentation/view/home_screen/ui/home_screen.dart';

class AppRouter{
  static const String HOME_SCREEN = "/home_screen";
  static const String LOGIN_SCREEN = "/login";
  static const String SIGN_UP = "/signup";
  static Map<String, WidgetBuilder> define = {
    HOME_SCREEN : (context) => MovieScreen(),
    LOGIN_SCREEN : (context) => LoginScreen(),
    SIGN_UP : (context) => SignUpScreen()
  };
}