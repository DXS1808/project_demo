import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/core/router/movie_favorite_router.dart';
import 'package:project_demo/core/router/router.dart';
import 'package:project_demo/presentation/common/cache_image.dart';
import 'package:project_demo/presentation/common/category_text.dart';
import 'package:project_demo/presentation/common/star_vote_average.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../config/constants.dart';
import '../../data/model/favorite/favorite.dart';
import '../view/movie/movie_favorite/check_favorite_cubit/check_favorite_cubit.dart';
import '../view/movie/movie_favorite/movie_favorite_cubit/movie_favorite_cubit.dart';

class MovieItem extends StatefulWidget {
  dynamic movieListItem;
  bool favorite = false;

  MovieItem({Key? key, required this.movieListItem, this.favorite = false})
      : super(key: key);

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<CheckFavoriteCubit>().checkFavorite(
        widget.movieListItem.id!, FirebaseAuth.instance.currentUser!.uid);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.MOVIE_DETAIL,
            arguments: MovieFavoriteRouter(
                context.read<MovieFavoriteCubit>(), widget.movieListItem.id));
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                color: Colors.white,
                elevation: 10.0,
                shadowColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      widget.movieListItem.posterPath != null
                          ? ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              child: CacheImage(
                                  widget.movieListItem.posterPath!,
                                  150,
                                  100,
                                  BoxFit.cover),
                            )
                          : Container(
                              height: 150,
                              width: 100,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.grey,
                              ),
                              child: const Icon(
                                Icons.movie_creation_outlined,
                                size: 30,
                              ),
                            ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CategoryText(
                            category: widget.movieListItem.originalTitle,
                            fontSize: 15,
                            fontWeight: Constants.FONTWEIGHT,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            widget.movieListItem.overview,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 11,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          CategoryText(
                            category: "${widget.movieListItem.releaseDate} ",
                          ),
                          CategoryText(
                              category:
                                  "${AppLocalizations.of(context)!.vote_count} : ${widget.movieListItem.voteCount}"),
                          voteAverage(widget.movieListItem.voteAverage),
                          const SizedBox(width: 8.0),
                        ],
                      ))
                    ],
                  ),
                )),
          ),
          Positioned(
              top: 0,
              right: 10,
              child: Column(
                children: [
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      padding: const EdgeInsets.only(
                          bottom: 5.0, right: 5.0, left: 5.0),
                      decoration: const BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.movieListItem.voteAverage.toStringAsFixed(1),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                          const Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  if (widget.favorite == true)
                    Container(
                        padding: const EdgeInsets.all(5.0),
                        child: BlocListener<MovieFavoriteCubit,
                            MovieFavoriteState>(
                          listenWhen: (previous, current) =>
                              (previous.movieId == widget.movieListItem.id!) &&
                              (current.movieId == widget.movieListItem.id!),
                          listener: (context, state) {
                            if (state.movieFavoriteStatus ==
                                MovieFavoriteStatus.success) {
                              // AlertShowMessage.success(
                              //     context, "Remove Favorite Success");
                              print("test remove MovieFavorite");
                              context.read<CheckFavoriteCubit>().checkFavorite(
                                  widget.movieListItem.id!,
                                  FirebaseAuth.instance.currentUser!.uid);
                            }
                            if (state.movieFavoriteStatus ==
                                MovieFavoriteStatus.markedSuccess) {
                              // AlertShowMessage.success(
                              //     context, "Add Favorite Success");
                              print("test add MovieFavorite");
                              context.read<CheckFavoriteCubit>().checkFavorite(
                                  widget.movieListItem.id!,
                                  FirebaseAuth.instance.currentUser!.uid);
                            }
                          },
                          child: BlocBuilder<CheckFavoriteCubit,
                              CheckFavoriteState>(
                            buildWhen: (previous, current) =>
                                (previous.id == widget.movieListItem.id) &&
                                (current.id == widget.movieListItem.id),
                            builder: (context, state) {
                              Favorite favorite = Favorite(
                                  widget.movieListItem.posterPath,
                                  widget.movieListItem.overview!,
                                  widget.movieListItem.id!,
                                  widget.movieListItem.releaseDate!,
                                  widget.movieListItem.originalTitle!,
                                  widget.movieListItem.title!,
                                  widget.movieListItem.voteCount!,
                                  widget.movieListItem.voteAverage!);
                              return state.checkFavoriteStatus ==
                                      CheckFavoriteStatus.marked
                                  ? IconButton(
                                      onPressed: () {
                                        print(state.checkFavoriteStatus);
                                        context
                                            .read<MovieFavoriteCubit>()
                                            .removeFavorite(
                                                FirebaseAuth
                                                    .instance.currentUser!.uid,
                                                widget.movieListItem.id!);
                                      },
                                      splashRadius: 15.0,
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: Colors.pinkAccent,
                                      ))
                                  : IconButton(
                                      onPressed: () {
                                        print(state.checkFavoriteStatus);
                                        context
                                            .read<MovieFavoriteCubit>()
                                            .markFavorite(
                                                FirebaseAuth
                                                    .instance.currentUser!.uid,
                                                widget.movieListItem.id!,
                                                favorite);
                                      },
                                      splashRadius: 15.0,
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: Colors.grey,
                                      ));
                            },
                          ),
                        ))
                ],
              ))
        ],
      ),
    );
  }

  Widget voteAverage(num voteAverage) {
    if (voteAverage == 0) {
      return const StarVoteAverage(length: 0);
    } else if (0 < voteAverage && voteAverage <= 5) {
      return const StarVoteAverage(length: 1);
    } else if (5 < voteAverage && voteAverage <= 6) {
      return const StarVoteAverage(length: 2);
    } else if (5 < voteAverage && voteAverage <= 7) {
      return const StarVoteAverage(length: 3);
    } else if (7 < voteAverage && voteAverage < 8.5) {
      return const StarVoteAverage(length: 4);
    } else {
      return const StarVoteAverage(length: 5);
    }
  }
}
