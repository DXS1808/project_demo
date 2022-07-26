
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/core/router/router.dart';
import 'package:project_demo/presentation/common/ultis/rest_client_dio.dart';

import '../../config/constants.dart';
import '../../data/impl/movie_impl.dart';
import '../../data/model/movie/movie.dart';
import '../../domain/usecase/movie_usecase.dart';
import '../view/mark_favorite_cubit/mark_favorite_cubit.dart';
import '../view/movie_detail/cast/cast_cubit/cast_cubit.dart';
import '../view/movie_detail/image/image_cubit/image_cubit.dart';
import '../view/movie_detail/movie_detail_cubit/movie_detail_cubit.dart';
import '../view/movie_detail/movie_detail_screen.dart';
import '../view/movie_detail/recommendation/recommendation_cubit/recommendation_cubit.dart';
import '../view/movie_detail/reviews/reviews_cubit/reviews_cubit.dart';
import '../view/movie_detail/similar/similar_cubit/similar_cubit.dart';
import 'cache_image.dart';
import 'image_url_null.dart';

class MovieItemDetail extends StatelessWidget {
    Color colorText;
    dynamic movieListItem;
    MovieItemDetail({required this.movieListItem,required this.colorText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.MOVIE_DETAIL,arguments: movieListItem.id!);
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
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        child: movieListItem.posterPath != null
                            ? CacheImage(
                            movieListItem.posterPath!, 150, 100, BoxFit.cover)
                            : ImageUrlNull(
                            const Icon(
                              Icons.image,
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
                              borderRadius: BorderRadius.only(bottomRight:Radius.circular(10),
                                  bottomLeft: Radius.circular(10)
                              )
                          ),
                          child: Column(
                            children: [
                              Text(
                                movieListItem.voteAverage.toStringAsFixed(1),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Icon(Icons.star,
                                color: Colors.black,
                                size: 15,)
                            ],
                          ),
                        ),
                      ))
                ],
              ),
              Text(
                movieListItem.originalTitle,
                style: TextStyle(
                    color: colorText,
                    fontSize: 10,
                    fontFamily: Constants.FONT_FAMILY),
              )
            ],
          ),
        ),
      ),
    );
  }
}
