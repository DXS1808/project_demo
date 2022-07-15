import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/data_sources/remote/rest_client.dart';
import '../../../../data/model/movie.dart';
import '../../../movie/movie_item.dart';
import '../home_cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Future callApi() async {
  //   Movie a;
  //   try{
  //     final result = await restClient.getListMovie(Constants.apiKey);
  //     a = result;
  //   }catch(e){
  //     print(e.toString());
  //   }
  // }

  @override
  void initState() {
    // callApi();
    context.read<HomeCubit>().get();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state.status == HomeStatus.loading) {
        return const CircularProgressIndicator();
      } else if (state.status == HomeStatus.success) {
        return state.movie != null
            ? MovieItem(movie: state.movie!)
            : Container();
      }
      return Text(" Error :${state.movie}");
    });
  }
}
