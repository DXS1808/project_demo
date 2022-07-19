import 'package:flutter/cupertino.dart';
import 'package:project_demo/data/model/movie/movie.dart';

import '../../common/movie_item.dart';

class CategoryMovieList extends StatelessWidget {
  final List<MovieListItem> movieListItem;

  const CategoryMovieList({Key? key, required this.movieListItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> itemList = [];
    movieListItem
        .map((e) => itemList.add(MovieItem(movieListItem: e)))
        .toList();
    return SingleChildScrollView(
      child: Column(
        children: itemList,
      ),
    );
  }
}
