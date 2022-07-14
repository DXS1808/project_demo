import 'package:flutter/cupertino.dart';
import 'package:project_demo/presentation/view/home_screen/home_screen.dart';

class AppRouter{
  static const String HOME_SCREEN = "home_screen";
  static Map<String, WidgetBuilder> define = {
    HOME_SCREEN : (context) => HomeScreen(),
  };
}