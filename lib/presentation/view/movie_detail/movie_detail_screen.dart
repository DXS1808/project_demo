import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/presentation/common/skeleton/skeleton_movie_detail.dart';
import 'package:project_demo/presentation/view/movie_detail/movie_detail_body.dart';
import 'package:project_demo/presentation/view/movie_detail/movie_detail_cubit/movie_detail_cubit.dart';
import 'package:project_demo/presentation/view/movie_detail/movie_detail_header.dart';

class MovieDetailScreen extends StatefulWidget {
  final int movieId;
  // int userId;
  const MovieDetailScreen({Key? key,required this.movieId}) : super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {


  @override
  void initState() {
    // TODO: implement initState
    context.read<MovieDetailCubit>().getDetail(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit,MovieDetailState>(builder: (context, state) {
      if(state.movieDetailStatus == MovieDetailStatus.loading){
        return const SkeletonMovieDetail();
      }if(state.movieDetailStatus == MovieDetailStatus.success){
        return Scaffold(
          backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          appBar: MovieDetailHeader(state.movieDetail!),
          body: SingleChildScrollView(
            child: Column(
              children: [
                MovieDetailBody(movieDetail: state.movieDetail!),
              ],
            ),
          )
        );
      }
      return const SkeletonMovieDetail();
    });
  }
}
