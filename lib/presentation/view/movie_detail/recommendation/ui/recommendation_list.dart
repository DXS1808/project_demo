import 'package:flutter/material.dart';
import 'package:project_demo/data/model/movie/movie.dart';
import 'package:project_demo/presentation/common/category_text.dart';
import 'package:project_demo/presentation/common/movie_detail_item.dart';
import 'package:project_demo/presentation/common/movie_item.dart';

class RecommendationList extends StatelessWidget {
  List<MovieListItem> movieListItem;

  RecommendationList({Key? key, required this.movieListItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return movieListItem.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryText(
                category: "Recommendations",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
              const SizedBox(
                height: 5.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: movieListItem
                      .map((e) => MovieItemDetail(
                          movieListItem: e, colorText: Colors.white))
                      .toList(),
                ),
              )

            ],
          )
        : Container();
  }
}
