import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_demo/core/router/router.dart';
import 'package:project_demo/presentation/common/social_media.dart';
import 'package:project_demo/presentation/common/ultis/string_ultis.dart';
import 'package:project_demo/presentation/view/auth/login/login_with_facebook/login_facebook_cubit.dart';
import 'package:project_demo/presentation/view/auth/login/login_with_google/login_google_cubit.dart';
import '../../../../../config/constants.dart';
import '../../../../allert_dropdown/allert_dropdown.dart';
import '../../../../common/input_text_wrap.dart';
import '../../../../common/rouned_button.dart';
import '../login_cubit/login_cubit.dart';

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
            child: body(),
          ),
        ));
  }

  Widget body() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            color: Colors.black,
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height / 10,
                ),
                Image.asset(
                  "assets/logo.png",
                  height: 120,
                  width: 120,
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(50.0)),
                ),
                width: size.width,
                height: size.height * 0.7,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    inputEmail(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    inputPassword(),
                    const SizedBox(
                      height: 30.0,
                    ),
                    loginButton(),
                    const SizedBox(height: 50.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        signInGoogle(),
                        const SizedBox(width: 15.0,),
                        signInFaceBook(),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have account?",
                          style: TextStyle(
                              fontSize: Constants.FONT_SIZE,
                              color: Colors.black,
                              fontFamily: Constants.FONTFAMILY),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRouter.SIGN_UP);
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Constants.BACKGROUND,
                                fontSize: Constants.FONT_SIZE,
                                fontFamily: Constants.FONTFAMILY),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
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
          color: Colors.black,
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
            color: Colors.black,
          ),
          obscureText: state.obscureText,
          iconSuffix: GestureDetector(
            child: Icon(
              state.obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
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
            AlertDropdown.success(state.successMessage);
            Navigator.pushNamed(context, AppRouter.HOME_SCREEN);
          } else if (state.loginStatus == LoginStatus.failed) {
            AlertDropdown.error(state.errorMessage);
          }
        },
        child: RounedButton(
            onPress: () {
              context.read<LoginCubit>().success(email.text, password.text);
            },
            text: "Login"));
  }

  signInGoogle() {
    return BlocListener<LoginGoogleCubit, LoginGoogleState>(
      listener: (context, state) {
        if (state.loginGoogleStatus == LoginGoogleStatus.failed) {
          AlertDropdown.error(state.message);
        } else if (state.loginGoogleStatus == LoginGoogleStatus.success) {
          AlertDropdown.success(state.message);
          Navigator.pushNamed(context, "/home_screen");
        }
      },
      child: SocialMedia(
          press: () {
            context.read<LoginGoogleCubit>().signIn();
          },
          icon: const FaIcon(FontAwesomeIcons.google,size: 20, color: Colors.white),
          color: Colors.redAccent),
    );
  }

  signInFaceBook() {
    return BlocListener<LoginFacebookCubit, LoginFacebookState>(
      listener: (context, state) {
        if (state.loginFacebookStatus == LoginFacebookStatus.failed) {
          AlertDropdown.error(state.message);
        } else if (state.loginFacebookStatus == LoginFacebookStatus.success) {
          AlertDropdown.success(state.message);
          Navigator.pushNamed(context, "/home_screen");
        }
      },
      child: SocialMedia(
        press: () {
          context.read<LoginFacebookCubit>().signInFacebook();
        },
        color: Colors.blue,
        icon: const FaIcon(FontAwesomeIcons.facebookF,size: 20, color: Colors.white),
      ),
    );
  }

  @override
  void dispose() {
    email.clear();
    password.clear();
    super.dispose();
  }
}
