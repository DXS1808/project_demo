import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/data/model/video_movie/video_movie.dart';
import 'package:project_demo/presentation/view/movie_detail/video_movie/ui/video_item.dart';
import 'package:project_demo/presentation/view/movie_detail/video_movie/video_movie_cubit/video_movie_cubit.dart';
import 'package:video_player/video_player.dart';

import '../../../../common/category_text.dart';
import '../../../../common/movie_item.dart';

class MovieVideo extends StatefulWidget {
  int movieId;

  MovieVideo({Key? key, required this.movieId}) : super(key: key);

  @override
  _MovieVideoState createState() => _MovieVideoState();
}

class _MovieVideoState extends State<MovieVideo> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    context.read<VideoMovieCubit>().get(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoMovieCubit, VideoMovieState>(
        builder: (context, state) {
      if (state.videoMovieStatus == VideoMovieStatus.loading) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      } else if (state.videoMovieStatus == VideoMovieStatus.success) {
        return state.movieVideo!.results!.isNotEmpty ? videoList(state.movieVideo!.results!):Text("");
      }
      return Container();
    });
  }

  Widget videoList(List<Results> results) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10.0),
          child: CategoryText(
            category: "Movie Trailer",
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        CarouselSlider(
          items: results.map((e) => VideoItem(e)).toList(),
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
          ),
        )
      ],
    );
  }
}
