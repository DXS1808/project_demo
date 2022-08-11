import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/core/router/router.dart';
import 'package:project_demo/presentation/common/avatar_null.dart';
import 'package:project_demo/presentation/common/profile_item.dart';
import 'package:project_demo/presentation/view/auth/sign_out/sign_out_cubit/sign_out_cubit.dart';
import 'package:project_demo/presentation/view/profile/profile_cubit/profile_cubit.dart';
import '../../../l10n/locale_cubit/locale_cubit.dart';
import '../../common/custorm_clipper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common/utils/string_ultis.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late SignOutCubit signOutCubit;
  late LocaleCubit localeCubit;

  @override
  void initState() {
    context.read<ProfileCubit>().status();
    signOutCubit = context.read<SignOutCubit>();
    localeCubit = context.read<LocaleCubit>();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state.profileStatus == ProfileStatus.loading) {
        return const Center(
          child: CircularProgressIndicator(
            color: Constants.BACKGROUND_COLOR,
          ),
        );
      } else if (state.profileStatus == ProfileStatus.success) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              AppLocalizations.of(context)!.profile,
              style: const TextStyle(
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
                        decoration: BoxDecoration(
                            color: Constants.BACKGROUND_COLOR.withOpacity(0.8),
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                      ),
                    ),
                    const SizedBox(
                      height: 300,
                    ),
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
                            if (FirebaseAuth.instance.currentUser?.displayName !=
                                null)
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
                            ProfileItem(
                                content:
                                AppLocalizations.of(context)!.change_password,
                                icon: Icons.lock,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRouter.CHANGE_PASSWORD);
                                }),
                            ProfileItem(
                                content: AppLocalizations.of(context)!.change_email,
                                icon: Icons.edit,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRouter.CHANGE_EMAIL);
                                }),
                            ProfileItem(
                                content: AppLocalizations.of(context)!.language,
                                icon: Icons.language,
                                onTap: () {
                                  showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15.0),
                                              topRight: Radius.circular(15.0))),
                                      context: context,
                                      builder: (context) {
                                        return BlocConsumer<LocaleCubit,
                                            LocaleState>(
                                          builder: (context, state) {
                                            return state.localeStatus ==
                                                LocaleStatus.loading
                                                ? const Center(
                                              child:
                                              CircularProgressIndicator(
                                                color: Constants.BACKGROUND_COLOR,
                                              ),
                                            )
                                                : SizedBox(
                                              height: 100,
                                              child: Column(
                                                children: [
                                                  languages(onTap: () {
                                                    localeCubit.setLocale("en");
                                                  }, url: "assets/english.png", language: "English"),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 3.0),
                                                    child: languages(onTap: () {
                                                      localeCubit.setLocale("vi");
                                                    }, url: "assets/vietnam.png", language: "Vietnamese"),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                          listener: (context, state) {
                                            if (state.localeStatus ==
                                                LocaleStatus.success) {
                                              Navigator.pop(context);
                                            }
                                          },
                                        );
                                      });
                                }),
                            ProfileItem(
                                content: AppLocalizations.of(context)!.sign_out,
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
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(20.0))),
                                              content: Text(
                                                AppLocalizations.of(context)!
                                                    .pop_up,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: Constants.FONT_FAMILY,
                                                ),
                                              ),
                                              actions: [
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 20),
                                                    Expanded(
                                                        child: button(() {
                                                          Navigator.pop(context);
                                                        }, "Cancel")
                                                    ),
                                                    const Expanded(
                                                      child: Text(""),
                                                    ),
                                                    Expanded(
                                                        child: BlocListener<
                                                            SignOutCubit,
                                                            SignOutState>(
                                                          listener: (context, state) {
                                                            if (state.signOutStatus == SignOutStatus.success) {
                                                              Navigator.pushNamed(context, AppRouter.LOGIN_SCREEN);
                                                            }
                                                          },
                                                          child: button(() {
                                                            signOutCubit.signOut();
                                                            Navigator.pop(context);
                                                          }, "OK"),
                                                        )),
                                                    const SizedBox(width: 20),
                                                  ],
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
                    child: FirebaseAuth.instance.currentUser?.photoURL != null &&
                        StringUltis.isImage(
                            FirebaseAuth.instance.currentUser!.photoURL!) ==
                            true
                        ? CircleAvatar(
                      maxRadius: 50,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.file(
                          File(FirebaseAuth.instance.currentUser!.photoURL!),
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                        : AvatarNull(
                      name: FirebaseAuth.instance.currentUser!.displayName!,
                    )),
              ]))
        );
      }
      return Container();
    });
  }

  Widget languages({required VoidCallback onTap, required String url, required String language}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            url,
            height: 35,
            width: 35,
          ),
          const SizedBox(
            width: 3.0,
          ),
          Text(language),
        ],
      ),
    );
  }

  Widget button(VoidCallback onPress, String text) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        elevation: MaterialStateProperty.all(15),
        side: MaterialStateProperty.all(
          const BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      onPressed: onPress,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 13),
      ),
    );
  }
}
