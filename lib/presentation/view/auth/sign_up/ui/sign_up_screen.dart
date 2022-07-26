
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/core/router/router.dart';
import 'package:project_demo/presentation/allert_dropdown/allert_dropdown.dart';
import 'package:project_demo/presentation/common/ultis/string_ultis.dart';
import '../../../../../config/constants.dart';
import '../../../../common/input_text_wrap.dart';
import '../../../../common/rouned_button.dart';
import '../../login/login_cubit/login_cubit.dart';
import '../../login/ui/login_screen.dart';
import '../sign_up_cubit/sign_up_cubit.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();
  TextEditingController name = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool _passwordVisible = true;
  bool passwordVisibleConfirm = true;
  late SignUpCubit signUpCubit;

  // var box = Hive.box("user");

  @override
  void initState() {
    signUpCubit = context.read<SignUpCubit>();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _key,
        child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
            child: body()),
      ),
    );
  }

  Widget body() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height / 4,
          ),
          const Text(
            "SignUp",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          ),
          const SizedBox(
            height: 60,
          ),
          inputUserName(),
          const SizedBox(
            height: 10.0,
          ),
          inputPassword(),
          const SizedBox(
            height: 10.0,
          ),
          conFirmPassword(),
          const SizedBox(
            height: 10.0,
          ),
          fullName(),
          const SizedBox(
            height: 30.0,
          ),
          signUpButton(),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You have account ? '),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.LOGIN_SCREEN);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return BlocProvider<LoginCubit>.value(
                    //     value: LoginCubit(),
                    //     child: LoginScreen(),
                    //   );
                    // }));
                  },
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                        color: Constants.BACKGROUND_COLOR,
                        decoration: TextDecoration.underline),
                  ))
            ],
          )
        ],
      ),
    );
  }

  inputUserName() {
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
          if (str!.isNotEmpty) {
            if (StringUltis.isEmail(str) == false) {
              return "Wrong email format";
            }
          } else {
            return "Email is required";
          }
          return null;
        });
  }

  inputPassword() {
    return BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
      return InputTextWrap(
          label: "Password...",
          controller: password,
          icon: const Icon(
            Icons.lock_outline,
            size: 20,
            color: Constants.BACKGROUND_COLOR,
          ),
          obscureText: state.obsText,
          iconSuffix: GestureDetector(
            child: Icon(
              // Based on passwordVisible state choose the icon
              state.obsText ? Icons.visibility_off : Icons.visibility,
              color: Constants.BACKGROUND_COLOR,
            ),
            onTap: () {
              _passwordVisible = !_passwordVisible;
              signUpCubit.obsText(_passwordVisible);
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

  conFirmPassword() {
    return BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
      return InputTextWrap(
          label: "ConfirmPassword...",
          controller: confirmPassword,
          icon: const Icon(
            Icons.lock_outline,
            size: 20,
            color: Constants.BACKGROUND_COLOR,
          ),
          obscureText: state.confirmObsText,
          iconSuffix: GestureDetector(
            child: Icon(
              state.confirmObsText ? Icons.visibility_off : Icons.visibility,
              color: Constants.BACKGROUND_COLOR,
            ),
            onTap: () {
              passwordVisibleConfirm = !passwordVisibleConfirm;
              signUpCubit.confirmObsText(passwordVisibleConfirm);
            },
          ),
          validator: (str) {
            if (str!.isNotEmpty) {
              if (str != password.text) {
                return "Incorrect Password";
              }
            } else if (str.isEmpty) {
              return "Confirm Password is required";
            }
            return null;
          });
    });
  }

  Widget fullName(){
    return InputTextWrap(
        label: "FullName...",
        controller: name,
        obscureText: false,
        icon: const Icon(
          Icons.person_outline,
          size: 20,
          color: Constants.BACKGROUND_COLOR,
        ),
        validator: (str) {
          if (str!.isEmpty) {
            return "FullName is required";
          }
          return null;
        });
  }

  signUpButton() {
    return BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state.status == SignUpStatus.loading) {
            // return const CircularProgressIndicator();
          } else if (state.status == SignUpStatus.success) {
            Navigator.pushNamed(context, AppRouter.HOME_SCREEN);
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return BlocProvider<HomeCubit>.value(
            //     value: HomeCubit(MovieUseCase(MovieImpl(RestClient(
            //         Dio(BaseOptions(contentType: "application/json")))))),
            //     child: const HomeScreen(),
            //   );
            // }));
            AlertDropdown.success("Sign up success");
          } else if (state.status == SignUpStatus.failed) {
            AlertDropdown.error(state.errorMessage);
          }
        },
        child: RounedButton(
          onPress: () {
            if(_key.currentState!.validate()){
              context.read<SignUpCubit>().success(email.text, password.text,name.text);
            }
          },
          text: 'Sign up',
        ));
  }
}
