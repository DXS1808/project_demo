import 'package:flutter/material.dart';
import 'package:project_demo/data/model/movie/movie.dart';

import '../../common/movie_item.dart';

class CategoryMovieList extends StatelessWidget {
  final List<MovieListItem> movieListItem;
  String? searchText;

  CategoryMovieList({Key? key, required this.movieListItem, this.searchText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> itemList = [];
    movieListItem
        .map((e) => itemList.add(MovieItem(movieListItem: e)))
        .toList();
    return itemList.isEmpty && searchText != null ? Column(
      children: [
        Text("${itemList.length} results with keyword: $searchText",
          style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              decoration: TextDecoration.underline),
        ),
        Image.asset("assets/nodata.png")
      ],
    ):SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (searchText != null)
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "${itemList.length} results with keyword: $searchText ",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      decoration: TextDecoration.underline),
                ),
              ),
            Column(
              children: itemList,
            ),
          ],
        ));
  }
}
