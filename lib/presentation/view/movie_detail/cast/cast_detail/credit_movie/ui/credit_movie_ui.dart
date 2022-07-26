import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/data/model/credit_movie/credit_movie.dart';
import 'package:project_demo/presentation/common/category_text.dart';
import 'package:project_demo/presentation/common/movie_detail_item.dart';
import 'package:project_demo/presentation/view/movie_detail/cast/cast_cubit/cast_cubit.dart';
import 'package:project_demo/presentation/view/movie_detail/cast/cast_detail/credit_movie/credit_movie_cubit/credit_movie_cubit.dart';

class CreditMovieUI extends StatefulWidget {
  int castId;

  CreditMovieUI({Key? key, required this.castId}) : super(key: key);

  @override
  _CreditMovieUIState createState() => _CreditMovieUIState();
}

class _CreditMovieUIState extends State<CreditMovieUI> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<CreditMovieCubit>().getCreditCubit(widget.castId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditMovieCubit, CreditMovieState>(
        builder: (context, state) {
      if (state.creditMovieStatus == CreditMovieStatus.loading) {
        return Container();
      } else if (state.creditMovieStatus == CreditMovieStatus.success) {
        return Card(
          elevation: 5.0,
          child: Container(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryText(category: "Credit Movie",color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15,),
                Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  height: 220,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: state.castMovie.map((e) => castMovieItem(e)).toList(),
                    ),
                  ),
                )
              ],
            ),
          )
        );
      }
      return Container();
    });
  }

  Widget castMovieItem(CastMovie castMovie) {
    return SingleChildScrollView(
      child: MovieItemDetail(movieListItem: castMovie,colorText: Colors.black,),
    );
  }
}
