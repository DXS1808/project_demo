
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/presentation/allert_dropdown/allert_dropdown.dart';
import 'package:project_demo/presentation/common/rouned_button.dart';
import 'package:project_demo/presentation/view/profile/change_password/change_password_cubit/change_password_cubit.dart';

import '../../../../common/input_text_wrap.dart';

class ChangePassWord extends StatefulWidget {
  const ChangePassWord({Key? key}) : super(key: key);

  @override
  _ChangePassWordState createState() => _ChangePassWordState();
}

class _ChangePassWordState extends State<ChangePassWord> {
  bool obsTextConfirm = true;
  bool obsTextOld = true;
  bool obsTextNew = true;
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  late ChangePasswordCubit changePasswordCubit;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    changePasswordCubit = context.read<ChangePasswordCubit>();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Reset Password",
          style: TextStyle(
            color: Colors.white,
            fontFamily: Constants.FONT_FAMILY,
          ),
        ),
      ),
      body: Form(
          key: _key,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 150),
                inputPasswordOld(),
                const SizedBox(height: 20),
                inputPasswordNew(),
                const SizedBox(height: 20),
                conFirmPassword(),
                const SizedBox(height: 25),
                btnUpdate(),
              ],
            ),
          )),
    );
  }

  inputPasswordOld() {
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
        builder: (context, state) {
      return InputTextWrap(
          label: "Old Password...",
          controller: oldPassword,
          icon: const Icon(
            Icons.lock_outline,
            size: 20,
            color: Constants.BACKGROUND_COLOR,
          ),
          obscureText: state.obsTextOld,
          iconSuffix: GestureDetector(
            child: Icon(
              // Based on passwordVisible state choose the icon
              state.obsTextOld ? Icons.visibility_off : Icons.visibility,
              color: Constants.BACKGROUND_COLOR,
            ),
            onTap: () {
              obsTextOld = !obsTextOld;
              changePasswordCubit.obsTextOld(obsTextOld);
            },
          ),
          validator: (str) {
            if (str!.isEmpty) {
              return "Old Password is required";
            }
            return null;
          });
    });
  }

  inputPasswordNew() {
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
        builder: (context, state) {
      return InputTextWrap(
          label: "New Password...",
          controller: newPassword,
          icon: const Icon(
            Icons.lock_outline,
            size: 20,
            color: Constants.BACKGROUND_COLOR,
          ),
          obscureText: state.obsTextNew,
          iconSuffix: GestureDetector(
            child: Icon(
              state.obsTextNew ? Icons.visibility_off : Icons.visibility,
              color: Constants.BACKGROUND_COLOR,
            ),
            onTap: () {
              obsTextNew = !obsTextNew;
              changePasswordCubit.obsTextNew(obsTextNew);
            },
          ),
          validator: (str) {
            if (str!.isEmpty) {
              return "New Password is required";
            } else if (str == oldPassword.text) {
              return "The new password is different from the old password ";
            }
            return null;
          });
    });
  }

  conFirmPassword() {
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
        builder: (context, state) {
      return InputTextWrap(
          label: "ConfirmPassword...",
          controller: confirmPassword,
          icon: const Icon(
            Icons.lock_outline,
            size: 20,
            color: Constants.BACKGROUND_COLOR,
          ),
          obscureText: state.obsTextConfirm,
          iconSuffix: GestureDetector(
            child: Icon(
              state.obsTextConfirm ? Icons.visibility_off : Icons.visibility,
              color: Constants.BACKGROUND_COLOR,
            ),
            onTap: () {
              obsTextConfirm = !obsTextConfirm;
              changePasswordCubit.confirmObsText(obsTextConfirm);
            },
          ),
          validator: (str) {
            if (str!.isNotEmpty) {
              if (str != newPassword.text) {
                return "Incorrect Password";
              }
            } else if (str.isEmpty) {
              return "Confirm Password is required";
            }
            return null;
          });
    });
  }

  btnUpdate() {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state.changePasswordStatus == ChangePasswordStatus.success) {
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("abc")));
          AlertDropdown.success(state.messageSuccess);
          print("done");
        } else if (state.changePasswordStatus == ChangePasswordStatus.failed) {
          AlertDropdown.error(state.messageFailed);
        }
      },
      child: RounedButton(
          onPress: () {
            if (_key.currentState!.validate()) {
              context
                  .read<ChangePasswordCubit>()
                  .changePassword(newPassword.text);

              clear();
            }
          },
          text: "Reset Password"),
    );
  }

  clear() {
    oldPassword.clear();
    newPassword.clear();
    confirmPassword.clear();
  }
}
