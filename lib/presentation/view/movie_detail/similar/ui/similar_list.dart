import 'package:flutter/material.dart';
import 'package:project_demo/data/model/movie/movie.dart';

import '../../../../common/category_text.dart';
import '../../../../common/movie_detail_item.dart';

class SimilarList extends StatelessWidget {
  List<MovieListItem> movieListItem;

  SimilarList({Key? key, required this.movieListItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryText(
          category: "Similar",
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: movieListItem
                .map((e) =>
                    MovieItemDetail(movieListItem: e, colorText: Colors.white))
                .toList(),
          ),
        )
      ],
    );
  }
}
