import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/presentation/view/login/login_cubit/login_cubit.dart';
import 'package:project_demo/presentation/view/sign_up/sign_up_cubit/sign_up_cubit.dart';
import 'package:project_demo/presentation/view/sign_up/ui/sign_up_screen.dart';
import '../../../../config/constants.dart';
import '../../../common/input_text_wrap.dart';
import '../../../common/rouned_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _passwordVisible = true;
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
              child: body(),
              // child: BlocBuilder<LoginCubit,LoginState>(
              //     builder: (context, state) {
              //       if(state.loginStatus == LoginStatus.loading){
              //         return const CircularProgressIndicator();
              //
              //       }else if(state.loginStatus == LoginStatus.success){
              //         return body();
              //       }
              //       return const Text("Email is exist");
              //     }),
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
          inputUserName(),
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
                    fontSize: Constants.kFontSize,
                    fontFamily: Constants.kFontFamily),
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
                      color: Constants.kBackgroundColor,
                      fontSize: Constants.kFontSize,
                      fontFamily: Constants.kFontFamily),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  inputUserName() {
    var input = RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
    return InputTextWrap(
        label: "Email...",
        controller: email,
        obscureText: false,
        icon: const Icon(
          Icons.person_outline,
          size: 20,
          color: Constants.kBackgroundColor,
        ),
        validator: (str) {
          if (input.hasMatch(str!) == false && str.isNotEmpty) {
            return "Wrong email format";
          } else if (str.isEmpty) {
            return "Email is required";
          }
          // else if(users.isNotEmpty){
          //   for(int i =0 ;i<= users.length-1;i++){
          //     if(str != users[i].email) {
          //       return "Password or Email wrong";
          //     }
          //   }
          // }
          return null;
        });
  }

  inputPassword() {
    return InputTextWrap(
        label: "Password...",
        controller: password,
        icon: const Icon(
          Icons.lock_outline,
          size: 20,
          color: Constants.kBackgroundColor,
        ),
        obscureText: _passwordVisible,
        iconSuffix: GestureDetector(
          child: Icon(
            _passwordVisible ? Icons.visibility_off : Icons.visibility,
            color: Constants.kBackgroundColor,
          ),
          onTap: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
        validator: (str) {
          if (str!.isEmpty) {
            return "Password is required";
          }
          // else if(users.isNotEmpty){
          //   for(int i =0 ;i<= users.length-1;i++){
          //     if(str != users[i].password) {
          //       return "Password or Email wrong";
          //     }
          //   }
          // }
          return null;
          // else if(str.isNotEmpty){
          //   for(var user in users){
          //     if(str != user.password) {
          //       return "Password or Email wrong";
          //     }
          //   }
          // }
        });
  }

  loginButton() {
    Size size = MediaQuery.of(context).size;
    return RounedButton(
      onPress: () {
        if (_key.currentState!.validate()) {
          loginCubit.success(email.text, password.text);
          // signInUser(context).then((value) {
          // });
          // for (int i = 0; i <= users.length - 1; i++) {
          //   if (users[i].email == email.value.text &&
          //       users[i].password == password.value.text) {
          //     AllertDropdown.success("Login Success");
          //     Navigator.pushNamed(context, "/homeScreen");
          //   }
          // }
        }
      },
      text: 'Login',
    );
  }

  // Future<void> signInUser(BuildContext context) async {
  //   try {
  //     await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email.text, password: password.text);
  //     // AlertDropdown.success("Login Success");
  //     // Navigator.pushNamed(context, AppRouter.homeScreen);
  //   } catch (e){
  //     // AlertDropdown.error(e.toString());
  //   }
  // }

  @override
  void dispose() {
    email.clear();
    password.clear();
    super.dispose();
  }
}
