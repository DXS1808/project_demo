import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/data/model/video_movie/video_movie.dart';
import 'package:project_demo/presentation/view/movie_detail/video_movie/ui/video_item.dart';
import 'package:project_demo/presentation/view/movie_detail/video_movie/video_movie_cubit/video_movie_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../common/category_text.dart';

class MovieVideo extends StatefulWidget {
  final int movieId;

  const MovieVideo({Key? key, required this.movieId}) : super(key: key);

  @override
  MovieVideoState createState() => MovieVideoState();
}

class MovieVideoState extends State<MovieVideo> {

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
        return state.movieVideo!.results!.isNotEmpty ? videoList(state.movieVideo!.results!,context): const Text("");
      }
      return Container();
    });
  }

  Widget videoList(List<Results> results,BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      shadowColor: Colors.black,
      elevation: 5.0,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(
              category: AppLocalizations.of(context)!.movie_trailer,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            ),

            CarouselSlider(
              items: results.map((e) => VideoItem(e)).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: false,
                enlargeCenterPage: true,
              ),
            )
          ],
        ),
      )
    );
  }
}
