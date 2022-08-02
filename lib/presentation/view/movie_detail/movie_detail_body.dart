import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/movie_detail/movie_detail.dart';
import 'package:project_demo/presentation/common/cache_image.dart';
import 'package:project_demo/presentation/view/movie_detail/image/ui/image_list.dart';
import 'package:project_demo/presentation/view/movie_detail/recommendation/recommendation_cubit/recommendation_cubit.dart';
import 'package:project_demo/presentation/view/movie_detail/recommendation/ui/recommendation.dart';
import 'package:project_demo/presentation/view/movie_detail/reviews/reviews_cubit/reviews_cubit.dart';
import 'package:project_demo/presentation/view/movie_detail/reviews/ui/reviews_list.dart';
import 'package:project_demo/presentation/view/movie_detail/similar/similar_cubit/similar_cubit.dart';
import 'package:project_demo/presentation/view/movie_detail/similar/ui/similar.dart';
import 'package:project_demo/presentation/view/movie_detail/video_movie/ui/video_movie_ui.dart';
import 'package:project_demo/presentation/view/movie_detail/video_movie/video_movie_cubit/video_movie_cubit.dart';
import 'package:readmore/readmore.dart';

import '../../../data/impl/movie_impl.dart';
import '../../../domain/usecase/movie_usecase.dart';
import '../../common/image_url_null.dart';
import '../../common/ultis/rest_client_dio.dart';
import 'cast/cast_cubit/cast_cubit.dart';
import 'cast/ui/cast_list.dart';
import 'image/image_cubit/image_cubit.dart';

class MovieDetailBody extends StatefulWidget {
  MovieDetail movieDetail;

  MovieDetailBody({Key? key, required this.movieDetail}) : super(key: key);

  @override
  _MovieDetailBodyState createState() => _MovieDetailBodyState();
}

class _MovieDetailBodyState extends State<MovieDetailBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            child: widget.movieDetail.posterPath != null
                ? CacheImage(widget.movieDetail.posterPath!, size.height * 0.5,
                    size.width, BoxFit.fill)
                : ImageUrlNull(const Icon(Icons.image, size: 30),
                    size.height * 0.3, size.width),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            widget.movieDetail.originalTitle!,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: Constants.FONT_FAMILY,
                fontWeight: FontWeight.w400),
          ),
          if (widget.movieDetail.productionCountries!.isNotEmpty)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 1.0),
                  child: const Icon(
                    Icons.location_on_outlined,
                    color: Constants.BACKGROUND_COLOR,
                    size: 15,
                  ),
                ),
                const SizedBox(
                  width: 3.0,
                ),
                productionCountries(widget.movieDetail.productionCountries!),
              ],
            ),
          if (widget.movieDetail.productionCompanies!.isNotEmpty)
            Row(
              children: [
                const Icon(
                  Icons.factory,
                  color: Constants.BACKGROUND_COLOR,
                  size: 15,
                ),
                const SizedBox(
                  width: 3.0,
                ),
                productionCompanies(widget.movieDetail.productionCompanies!)
              ],
            ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  voteStar(
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 16,
                    ),
                    "${widget.movieDetail.voteAverage}/10",
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  voteStar(
                    const Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 16,
                    ),
                    "${widget.movieDetail.runtime} mins",
                  )
                ],
              ),
              Text(
                "Vote Count: ${widget.movieDetail.voteCount}",
                style: const TextStyle(fontSize: 11, color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          genres(widget.movieDetail.genres!),
          const SizedBox(
            height: 20.0,
          ),
          if (widget.movieDetail.overview!.isNotEmpty)
            elevationCategory(
              plotSummary(widget.movieDetail.overview!),
            ),
          const SizedBox(
            height: 20.0,
          ),
          BlocProvider<VideoMovieCubit>(
            create: (context) => VideoMovieCubit(
              MovieUseCase(MovieImpl(RestClientDio.restClient)),
            ),
            child: MovieVideo(movieId: widget.movieDetail.id!),
          ),
          const SizedBox(
            height: 15.0,
          ),
          BlocProvider<CreditCastCubit>(
            create: (context) => CreditCastCubit(
              MovieUseCase(MovieImpl(RestClientDio.restClient)),
            ),
            child: elevationCategory(
              CreditCastList(movieId: widget.movieDetail.id!),
            ),
          ),
          BlocProvider<RecommendationCubit>(
            create: (context) => RecommendationCubit(
              MovieUseCase(MovieImpl(RestClientDio.restClient)),
            ),
            child: elevationCategory(
                Recommendations(movieId: widget.movieDetail.id!)),
          ),
          Opacity(
            opacity: 0.5,
            child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                elevation: 5.0,
                color: Colors.grey,
                child: widget.movieDetail.backdropPath != null
                    ? ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30.0)),
                        child: CacheImage(widget.movieDetail.backdropPath!,
                            size.height * 0.3, size.width, BoxFit.cover),
                      )
                    : Container()),
          ),
          const SizedBox(
            height: 15.0,
          ),
          BlocProvider<SimilarCubit>(
            create: (context) => SimilarCubit(
              MovieUseCase(MovieImpl(RestClientDio.restClient)),
            ),
            child: elevationCategory(Similar(movieId: widget.movieDetail.id!)),
          ),
          const SizedBox(
            height: 15.0,
          ),
          BlocProvider<ImageCubit>(
            create: (context) => ImageCubit(
              MovieUseCase(MovieImpl(RestClientDio.restClient)),
            ),
            child:
                elevationCategory(ImageList(movieId: widget.movieDetail.id!)),
          ),
          const SizedBox(
            height: 15.0,
          ),
          BlocProvider<ReviewsCubit>(
              create: (context) => ReviewsCubit(
                    MovieUseCase(MovieImpl(RestClientDio.restClient)),
                  ),
              child: elevationCategory(
                  ReviewsList(movieId: widget.movieDetail.id!))),
        ],
      ),
    );
  }

  Widget voteStar(Widget widget, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        widget,
        const SizedBox(
          width: 5.0,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 11, color: Colors.white),
        ),
      ],
    );
  }

  Widget genres(List<Genres> genres) {
    List<Widget> lstGenres = genres.map((e) => genre(e)).toList();
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Wrap(
          children: lstGenres,
        ));
  }

  Widget genre(Genres genres) {
    return Container(
        margin: const EdgeInsets.only(right: 10.0, top: 5.0),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.white)),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            genres.name!,
            softWrap: true,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: Constants.FONT_FAMILY),
          ),
        ));
  }

  Widget plotSummary(String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Plot Summary',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        ReadMoreText(
          content,
          trimLines: 4,
          trimCollapsedText: 'Read more',
          trimExpandedText: 'Less',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
          moreStyle: const TextStyle(color: Constants.BACKGROUND_COLOR),
          lessStyle: const TextStyle(color: Constants.BACKGROUND_COLOR),
        )
      ],
    );
  }

  Widget productionCountries(List<ProductionCountries> productionCountries) {
    List<Widget> listProductionCountries =
        productionCountries.map((e) => productionCountry(e)).toList();
    return Flexible(
      child: Wrap(
        children: listProductionCountries,
      ),
    );
  }

  Widget productionCountry(ProductionCountries productionCountry) {
    return Text(
      "${productionCountry.name!} ",
      softWrap: true,
      style: const TextStyle(
          fontSize: 10,
          color: Colors.grey,
          fontFamily: Constants.FONT_FAMILY,
          fontWeight: FontWeight.w400),
    );
  }

  //production_companies
  Widget productionCompanies(List<ProductionCompanies> productionCompanies) {
    int length = productionCompanies.isEmpty ? 0 : 1;

    List<Widget> list = List<Widget>.generate(
        length, (index) => productionCompany(productionCompanies[index]));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: list,
      ),
    );
  }

  Widget productionCompany(ProductionCompanies productionCompanies) {
    return Text(
      "${productionCompanies.name!} ",
      softWrap: true,
      style: const TextStyle(
          fontSize: 10,
          color: Colors.grey,
          fontFamily: Constants.FONT_FAMILY,
          fontWeight: FontWeight.w400),
    );
  }

  Widget elevationCategory(Widget widget) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      shadowColor: Colors.black12,
      elevation: 5.0,
      color: Colors.grey.withOpacity(0.3),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: widget,
      ),
    );
  }
}
