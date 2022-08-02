import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/data/model/favorite/favorite.dart';
import 'package:project_demo/data/model/movie_detail/movie_detail.dart';
import 'package:project_demo/presentation/common/alert_dialog.dart';
import '../movie/movie_favorite/check_favorite_cubit/check_favorite_cubit.dart';
import '../movie/movie_favorite/movie_favorite_cubit/movie_favorite_cubit.dart';

class MovieDetailHeader extends AppBar {
  MovieDetail movieDetail;

  MovieDetailHeader(this.movieDetail);

  @override
  State<MovieDetailHeader> createState() => _MovieDetailHeaderState();
}

class _MovieDetailHeaderState extends State<MovieDetailHeader> {
  @override
  void initState() {
    context.read<CheckFavoriteCubit>().checkFavorite(
        widget.movieDetail.id!, FirebaseAuth.instance.currentUser!.uid);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: Container(
        padding: const EdgeInsets.all(5.0),
        child: CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.5),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.tealAccent,
            ),
          ),
        ),
      ),
      actions: [
        Container(
            padding: const EdgeInsets.all(5.0),
            child: BlocBuilder<CheckFavoriteCubit, CheckFavoriteState>(
              builder: (context, state) {
                Favorite favorite = Favorite(
                    widget.movieDetail.posterPath,
                    widget.movieDetail.overview!,
                    widget.movieDetail.id!,
                    widget.movieDetail.releaseDate!,
                    widget.movieDetail.originalTitle!,
                    widget.movieDetail.title!,
                    widget.movieDetail.voteCount!,
                    widget.movieDetail.voteAverage!);
                return state.checkFavoriteStatus == CheckFavoriteStatus.marked
                    ? BlocListener<MovieFavoriteCubit, MovieFavoriteState>(
                        listener: (context, state) {
                          if (state.movieFavoriteStatus ==
                              MovieFavoriteStatus.success) {
                            AlertShowMessage.success(context, "Remove Favorite Success");
                            context
                                .read<CheckFavoriteCubit>()
                                .checkFavorite(widget.movieDetail.id!,FirebaseAuth.instance.currentUser!.uid);
                          }
                        },
                        child: IconButton(
                            onPressed: () {
                              context.read<MovieFavoriteCubit>().removeFavorite(
                                  FirebaseAuth.instance.currentUser!.uid,
                                  widget.movieDetail.id!);
                            },
                            splashRadius: 15.0,
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.pinkAccent,
                            )),
                      )
                    : BlocListener<MovieFavoriteCubit, MovieFavoriteState>(
                        listener: (context, state) {
                          if (state.movieFavoriteStatus ==
                              MovieFavoriteStatus.markedSuccess) {
                            AlertShowMessage.success(context,"Add Favorite Success");
                            context
                                .read<CheckFavoriteCubit>()
                                .checkFavorite(widget.movieDetail.id!,FirebaseAuth.instance.currentUser!.uid);
                          }
                        },
                        child: IconButton(
                            onPressed: () {
                              context.read<MovieFavoriteCubit>().markFavorite(
                                  FirebaseAuth.instance.currentUser!.uid, widget.movieDetail.id!, favorite);
                            },
                            splashRadius: 15.0,
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.grey,
                            )),
                      );
              },
            ))
      ],
    );
  }
}
