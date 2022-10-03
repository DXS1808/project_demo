import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import '../../services/network_services/network_services_cubit.dart';
import '../view/home_screen/home_cubit/home_cubit.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Center(
      // alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/no-internet.png",
              height: 200,
              width: 200,
            ),
            const Text(
              "No Internet Connection ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: Constants.textFontFamily),
            ),
            const Text(
              "You are not connected to the internet. Make sure Wi-Fi is on, Airplane Mode is Off ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: Constants.textFontFamily),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                elevation: MaterialStateProperty.all<double>(10),
                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
              ),
              onPressed: () {
                context.read<NetworkServicesCubit>().checkNetWork();
                context.read<HomeCubit>().getPopularList(false, 1);
                context.read<HomeCubit>().getTopRatedList(false, 1);
                context.read<HomeCubit>().getNowPlayingList(false, 1);
                context.read<HomeCubit>().getUpComingList(false, 1);
              },
              child: const Text(
                " Try Again",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: Constants.textFontFamily),
              ),
            )
          ],
        ),
      ),
    );
  }
}
