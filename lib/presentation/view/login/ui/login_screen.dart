import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/data/impl/movie_impl.dart';
import 'package:project_demo/domain/usecase/movie_usecase.dart';
import 'package:project_demo/presentation/common/ultis/string_ultis.dart';
import 'package:project_demo/presentation/view/login/login_cubit/login_cubit.dart';
import 'package:project_demo/presentation/view/sign_up/sign_up_cubit/sign_up_cubit.dart';
import 'package:project_demo/presentation/view/sign_up/ui/sign_up_screen.dart';
import '../../../../config/constants.dart';
import '../../../../data/data_sources/remote/rest_client.dart';
import '../../../allert_dropdown/allert_dropdown.dart';
import '../../../common/input_text_wrap.dart';
import '../../../common/rouned_button.dart';
import '../../home_screen/home_cubit/home_cubit.dart';
import '../../home_screen/ui/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool obsText = true;
  late LoginCubit loginCubit;

  @override
  void initState() {
    loginCubit = context.read<LoginCubit>();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Material(
          child: Form(
            key: _key,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/login.png",
                      ),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  body(),
                  BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                    if (state.loginStatus == LoginStatus.failed) {
                      // AlertDropdown.error(state.errorMessage);
                    }
                    if (state.loginStatus == LoginStatus.success) {
                      // AlertDropdown.success(state.successMessage);
                    }
                    return Container();
                  })
                ],
              ),
            ),
          ),
        ));
  }

  Widget body() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height / 5,
          ),
          const Text(
            "Login",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          ),
          const SizedBox(
            height: 100,
          ),
          inputEmail(),
          const SizedBox(
            height: 10.0,
          ),
         inputPassword(),
          const SizedBox(
            height: 50.0,
          ),
          loginButton(),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have account?",
                style: TextStyle(
                    fontSize: Constants.FONT_SIZE,
                    fontFamily: Constants.FONTFAMILY),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BlocProvider<SignUpCubit>.value(
                      value: SignUpCubit(),
                      child: SignUpScreen(),
                    );
                  }));
                  // print(users);
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Constants.BACKGROUND_COLOR,
                      fontSize: Constants.FONT_SIZE,
                      fontFamily: Constants.FONTFAMILY),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  inputEmail() {
    return InputTextWrap(
        label: "Email...",
        controller: email,
        obscureText: false,
        icon: const Icon(
          Icons.person_outline,
          size: 20,
          color: Constants.BACKGROUND_COLOR,
        ),
        validator: (str) {
          if (StringUltis.isEmail(str!) == false && str.isNotEmpty) {
            return "Wrong email format";
          } else if (str.isEmpty) {
            return "Email is required";
          }
          return null;
        });
  }

  inputPassword() {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return InputTextWrap(
          label: "Password...",
          controller: password,
          icon: const Icon(
            Icons.lock_outline,
            size: 20,
            color: Constants.BACKGROUND_COLOR,
          ),
          obscureText: state.obscureText,
          iconSuffix: GestureDetector(
            child: Icon(
              state.obscureText ? Icons.visibility_off : Icons.visibility,
              color: Constants.BACKGROUND_COLOR,
            ),
            onTap: () {
              obsText = !obsText;
              loginCubit.obsText(obsText);
            },
          ),
          validator: (str) {
            if (str!.isEmpty) {
              return "Password is required";
            }
            return null;
          });
    });
  }

  loginButton() {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.loginStatus == LoginStatus.success) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BlocProvider<HomeCubit>.value(
                value: HomeCubit(MovieUseCase(MovieImpl(RestClient(
                    Dio(BaseOptions(contentType: "application/json")))))),
                child: const HomeScreen(),
              );
            }));
          }
        },
        child: RounedButton(
            onPress: () {
              context.read<LoginCubit>().success(email.text, password.text);
            },
            text: "Login"));
  }

  @override
  void dispose() {
    email.clear();
    password.clear();
    super.dispose();
  }
}
