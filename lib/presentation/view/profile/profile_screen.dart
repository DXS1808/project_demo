import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/core/router/router.dart';
import 'package:project_demo/presentation/common/profile_item.dart';
import 'package:project_demo/presentation/view/auth/sign_out/sign_out_cubit/sign_out_cubit.dart';

import '../../common/custorm_clipper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late SignOutCubit signOutCubit;

  @override
  void initState() {
    signOutCubit = context.read();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider<SignOutCubit>(
      create: (context) => SignOutCubit(),
      child: Scaffold(
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            // leading: IconButton(
            //   icon: const Icon(Icons.arrow_back,
            //   color: Colors.white,),
            //   onPressed: (){
            //     Navigator.pop(context);
            //   },
            // ),
            title: const Text(
              "Profile",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: Constants.FONT_FAMILY),
            ),
            backgroundColor: Colors.transparent,
          ),
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
              child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipPath(
                  clipper: Customshape(),
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                  ),
                ),
                const SizedBox(
                  height: 300,
                ),
                // TextButton(
                //   onPressed: () async {
                //     await FirebaseAuth.instance.signOut().then((value) {
                //       Navigator.pushNamed(context, "/home_Screen");
                //     });
                //   },
                //   child: const Text("Sign out"),
                // )
              ],
            ),
            Positioned(
              top: 200,
              left: 10,
              child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  elevation: 5.0,
                  child: Container(
                    padding: const EdgeInsets.only(top: 80, bottom: 20),
                    width: size.width - 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (FirebaseAuth.instance.currentUser?.displayName != null)
                          Text(
                            FirebaseAuth.instance.currentUser!.displayName!,
                            style: const TextStyle(
                              fontFamily: Constants.FONTFAMILY,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        if (FirebaseAuth.instance.currentUser?.email != null)
                        Text(
                          FirebaseAuth.instance.currentUser!.email!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: Constants.FONTFAMILY,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        // ProfileItem(
                        //     content: "Account",
                        //     icon: Icons.person,
                        //     onTap: () {}),
                        ProfileItem(
                            content: "Change password",
                            icon: Icons.lock,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRouter.CHANGE_PASSWORD);
                            }),
                        ProfileItem(
                            content: "Change email",
                            icon: Icons.edit,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRouter.CHANGE_EMAIL);
                            }),
                        ProfileItem(
                            content: "Sign out",
                            icon: Icons.logout,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return BlocProvider<SignOutCubit>(
                                      create: (context) => SignOutCubit(),
                                      child: SizedBox(
                                        height: 200,
                                        child: AlertDialog(
                                          content: const Text(
                                            "Do you want sign out?",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: Constants.FONT_FAMILY,
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Constants
                                                        .BACKGROUND_COLOR),
                                              ),
                                            ),
                                            BlocListener<SignOutCubit,
                                                SignOutState>(
                                              listener: (context, state) {
                                                if (state.signOutStatus ==
                                                    SignOutStatus.success) {
                                                  // ScaffoldMessenger.of(context)
                                                  //     .showSnackBar(SnackBar(
                                                  //         content: Text(state
                                                  //             .successMessage)));
                                                  Navigator.pushNamed(context,
                                                      AppRouter.SPLASH);
                                                }
                                              },
                                              child: TextButton(
                                                onPressed: () {
                                                  signOutCubit.signOut();
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "OK",
                                                  style: TextStyle(
                                                      color: Constants
                                                          .BACKGROUND_COLOR),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            })
                      ],
                    ),
                  )),
            ),
            Positioned(
              top: 160,
              left: size.width * 0.5 - 50,
              child: const CircleAvatar(
                maxRadius: 50,
              ),
            )
          ]))),
    );
  }
}
