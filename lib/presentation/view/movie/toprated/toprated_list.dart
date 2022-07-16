import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_demo/data/model/movie.dart';
import 'package:project_demo/presentation/view/movie/toprated/toprated_item.dart';

import '../../../common/movie_item.dart';

class TopRatedList extends StatelessWidget {
  List<MovieListItem> movieListItem;

  TopRatedList({Key? key, required this.movieListItem}) : super(key: key);

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
