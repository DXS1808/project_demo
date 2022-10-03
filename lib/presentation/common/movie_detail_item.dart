import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/core/router/router.dart';
import '../../config/constants.dart';
import '../../core/router/movie_favorite_router.dart';
import '../view/movie/movie_favorite/movie_favorite_cubit/movie_favorite_cubit.dart';
import 'cache_image.dart';
import 'image_url_null.dart';

class MovieItemDetail extends StatelessWidget {
  final Color colorText;
  final dynamic movieListItem;

  const MovieItemDetail(
      {Key? key, required this.movieListItem, required this.colorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.movieDetail,
            arguments: MovieFavoriteRouter(
                context.read<MovieFavoriteCubit>(), movieListItem.id));
      },
      child: Container(
        padding: const EdgeInsets.only(right: 5.0),
        width: 120,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: movieListItem.posterPath != null
                            ? CacheImage(movieListItem.posterPath!, 150, 100,
                                BoxFit.cover)
                            : const ImageUrlNull(
                                Icon(
                                  Icons.movie_creation_outlined,
                                  size: 30,
                                ),
                                150,
                                100)),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Opacity(
                        opacity: 0.8,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          child: Column(
                            children: [
                              Text(
                                movieListItem.voteAverage.toStringAsFixed(1),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.black,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  movieListItem.originalTitle,
                  style: TextStyle(
                      color: colorText,
                      fontSize: 10,
                      fontFamily: Constants.fontFamily),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
