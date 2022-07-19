import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/favorite/mark_favorite/mark_favorite.dart';
import 'package:project_demo/data/model/movie/movie.dart';
import 'package:project_demo/data/model/movie_detail/movie_detail.dart';
import 'package:project_demo/presentation/allert_dropdown/allert_dropdown.dart';
import 'package:project_demo/presentation/common/cache_image.dart';
import 'package:project_demo/presentation/common/category_text.dart';
import 'package:project_demo/presentation/common/star_vote_average.dart';
import 'package:project_demo/presentation/common/ultis/rest_client_dio.dart';
import 'package:project_demo/presentation/view/home_screen/home_cubit/home_cubit.dart';
import 'package:project_demo/presentation/view/mark_favorite_cubit/mark_favorite_cubit.dart';
import 'package:project_demo/presentation/view/movie_detail/movie_detail_screen.dart';

import '../../data/data_sources/remote/rest_client.dart';
import '../../data/impl/movie_impl.dart';
import '../../domain/usecase/movie_usecase.dart';
import '../view/movie/movie_favorite/movie_favorite_cubit/movie_favorite_cubit.dart';
import '../view/movie_detail/movie_detail_cubit/movie_detail_cubit.dart';

class MovieItem extends StatefulWidget {
  MovieListItem movieListItem;

  MovieItem({Key? key, required this.movieListItem}) : super(key: key);

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(providers: [
            BlocProvider<MovieDetailCubit>(
              create: (context) => MovieDetailCubit(
                MovieUseCase(MovieImpl(RestClientDio.restClient)),
              ),
            ),
            BlocProvider<MarkFavoriteCubit>(
              create: (context) => MarkFavoriteCubit(
                MovieUseCase(MovieImpl(RestClientDio.restClient)),
              ),
            ),
          ], child: MovieDetailScreen(movieId: widget.movieListItem.id));
        }));
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                color: Colors.white24,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: CacheImage(widget.movieListItem.posterPath!, 150,
                            100, BoxFit.cover),
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
                            color: Colors.white,
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
                                color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          CategoryText(
                            category: "${widget.movieListItem.releaseDate} ",
                          ),
                          CategoryText(
                              category:
                                  "Vote Count : ${widget.movieListItem.voteCount}"),
                          voteAverage(widget.movieListItem.voteAverage),
                          const SizedBox(width: 8.0),
                        ],
                      ))
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Future<bool> markFavoriteMovie() async {
    return true;
  }

  Widget voteAverage(num voteAverage) {
    if (voteAverage <= 5) {
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

  String takeDecimalNumber(num average) {
    return average.toStringAsFixed(1);
  }
}
