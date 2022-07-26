import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/presentation/allert_dropdown/allert_dropdown.dart';
import 'package:project_demo/presentation/common/rouned_button.dart';
import 'package:project_demo/presentation/view/profile/change_email/change_email_cubit/change_email_cubit.dart';

import '../../../../../config/constants.dart';
import '../../../../common/input_text_wrap.dart';
import '../../../../common/ultis/string_ultis.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  _ChangeEmailState createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {


  TextEditingController email = TextEditingController();
  TextEditingController emailNew = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late User user;
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser!;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Change Email",
            style: TextStyle(
              color: Colors.white,
              fontFamily: Constants.FONT_FAMILY,
            ),
          ),
        ),
        body: Form(
          key: _key,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                inputEmail(),
                const SizedBox(height: 20),
                inputEmailNew(),
                const SizedBox(
                  height: 25,
                ),
                btnUpdate()
              ],
            ),
          ),
        ));
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
          } else if(str != user.email){
            return "Email failed";
          }
          return null;
        });
  }

  inputEmailNew() {
    return InputTextWrap(
        label: "Email New...",
        controller: emailNew,
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
          } else if (str == email.text) {
            return "Incorrect Email";
          }
          return null;
        });
  }

  btnUpdate() {
    return BlocListener<ChangeEmailCubit, ChangeEmailState>(
      listener: (context, state) {
        if (state.changeEmailStatus == ChangeEmailStatus.success) {
          AlertDropdown.success(state.message);
        } else if (state.changeEmailStatus == ChangeEmailStatus.failed) {
          AlertDropdown.error(state.message);
        }
      },
      child: RounedButton(
          onPress: () {
            if (_key.currentState!.validate()) {
              context.read<ChangeEmailCubit>().changeEmail(emailNew.text);
              email.clear();
              emailNew.clear();
            }
          },
          text: "Update Email"),
    );
  }
}
