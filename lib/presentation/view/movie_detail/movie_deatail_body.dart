import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/movie_detail/movie_detail.dart';
import 'package:project_demo/presentation/common/cache_image.dart';
import 'package:project_demo/presentation/common/ultis/rest_client_dio.dart';
import 'package:readmore/readmore.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            child: CacheImage(widget.movieDetail.backdropPath!,
                size.height * 0.3, size.width, BoxFit.cover),
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
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.tealAccent,
                size: 15,
              ),
              const SizedBox(
                width: 5.0,
              ),
              productionCountries(widget.movieDetail.productionCountries!),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.factory,
                color: Colors.tealAccent,
                size: 15,
              ),
              const SizedBox(
                width: 5.0,
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
                    "${widget.movieDetail.runtime}min",
                  )
                ],
              ),
              voteStar(
                const Icon(
                  Icons.where_to_vote_outlined,
                  color: Colors.white,
                  size: 16,
                ),
                "${widget.movieDetail.voteCount}",
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
          plotSummary(widget.movieDetail.overview!),

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
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
      ],
    );
  }

  Widget genres(List<Genres> genres) {
    List<Widget> lstGenres = genres.map((e) => genre(e)).toList();
    return Row(
      children: lstGenres,
    );
  }

  Widget genre(Genres genres) {
    return Container(
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.white)),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            genres.name!,
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
          moreStyle: const TextStyle(color: Colors.tealAccent),
          lessStyle: const TextStyle(color: Colors.tealAccent),
        )
      ],
    );
  }

  Widget productionCountries(List<ProductionCountries> productionCountries) {
    List<Widget> listProductionCountries =
        productionCountries.map((e) => productionCountry(e)).toList();
    return Row(
      children: listProductionCountries,
    );
  }

  Widget productionCountry(ProductionCountries productionCountry) {
    return Text(
      productionCountry.name!,
      style: const TextStyle(
          fontSize: 10,
          color: Colors.grey,
          fontFamily: Constants.FONT_FAMILY,
          fontWeight: FontWeight.w400),
    );
  }
  //production_companies
  Widget productionCompanies(List<ProductionCompanies> productionCompanies){

    List<Widget> list = productionCompanies.map((e) => productionCompany(e)).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: list,
      ),
    );
  }

  Widget productionCompany(ProductionCompanies productionCompanies){
    return Text(
      productionCompanies.name!,
      style: const TextStyle(
        fontSize: 10,
        color: Colors.grey,
        fontFamily: Constants.FONT_FAMILY,
        fontWeight: FontWeight.w400),
    );
  }
}
