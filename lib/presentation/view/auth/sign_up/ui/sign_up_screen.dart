import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_demo/core/router/router.dart';
import 'package:project_demo/presentation/allert_dropdown/allert_dropdown.dart';
import 'package:project_demo/presentation/common/ultis/string_ultis.dart';
import '../../../../../config/constants.dart';
import '../../../../common/image_picker.dart';
import '../../../../common/input_text_wrap.dart';
import '../../../../common/rouned_button.dart';
import '../sign_up_cubit/sign_up_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
  String? imagePath;
  late SignUpCubit signUpCubit;

  @override
  void initState() {
    signUpCubit = context.read<SignUpCubit>();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Constants.BACKGROUND,
      child: Form(
        key: _key,
        child:  body(),
      ),
    );
  }

  Widget body() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 40,
                ),
                Text(
                  "SignUp",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
              child: Container(
                height: size.height*0.85,
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(50.0))
                ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                imagePath != null
                    ? Stack(
                        children: [
                          CircleAvatar(
                            maxRadius: 50,
                            child: ClipOval(
                              child: Image.file(
                                File(imagePath!),
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 10,
                              right: 20,
                              child: GestureDetector(
                                onTap: () {
                                  PickImage.imagePicker(context).then((value) {
                                    setState(() {
                                      imagePath = value!.path;
                                      // print(value);
                                    });
                                  });
                                },
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ))
                        ],
                      )
                    : uploadImage((str) {
                        if (str == null) {
                          return "Image is required";
                        }
                        return null;
                      }),
                const SizedBox(
                  height: 20.0,
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
                    const Text(
                      'You have account ? ',
                      style: TextStyle(color: Colors.black),
                    ),
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
                              color: Constants.BACKGROUND,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                )
              ],
            ),
          ))
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
          color: Constants.BACKGROUND,
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
            color: Constants.BACKGROUND,
          ),
          obscureText: state.obsText,
          iconSuffix: GestureDetector(
            child: Icon(
              // Based on passwordVisible state choose the icon
              state.obsText ? Icons.visibility_off : Icons.visibility,
              color: Constants.BACKGROUND,
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
            color: Constants.BACKGROUND,
          ),
          obscureText: state.confirmObsText,
          iconSuffix: GestureDetector(
            child: Icon(
              state.confirmObsText ? Icons.visibility_off : Icons.visibility,
              color: Constants.BACKGROUND,
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

  Widget fullName() {
    return InputTextWrap(
        label: "FullName...",
        controller: name,
        obscureText: false,
        icon: const Icon(
          Icons.person_outline,
          size: 20,
          color: Constants.BACKGROUND,
        ),
        validator: (str) {
          if (str!.isEmpty) {
            return "FullName is required";
          }
          return null;
        });
  }

  Widget uploadImage(String? Function(XFile?)? validator) {
    return FormField<XFile>(
        validator: validator,
        builder: (formFieldState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  PickImage.imagePicker(context).then((value) {
                    setState(() {
                      imagePath = value!.path;
                      // print(value);
                    });
                  });
                },
                child: CircleAvatar(
                  maxRadius: 50,
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
              if (formFieldState.hasError)
                Text(
                  formFieldState.errorText!,
                  style: const TextStyle(fontSize: 14, color: Colors.red),
                ),
            ],
          );
        });
  }

  signUpButton() {
    return BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state.status == SignUpStatus.loading) {
            // return const CircularProgressIndicator();
          } else if (state.status == SignUpStatus.success) {
            AlertDropdown.success("Sign up success");
            Navigator.pushNamed(context, AppRouter.HOME_SCREEN);
          } else if (state.status == SignUpStatus.failed) {
            AlertDropdown.error(state.errorMessage);
          }
        },
        child: RounedButton(
          onPress: () {
            if (_key.currentState!.validate()) {
              context
                  .read<SignUpCubit>()
                  .success(email.text, password.text, name.text, imagePath!);
            }
          },
          text: 'Sign up',
        ));
  }
}
