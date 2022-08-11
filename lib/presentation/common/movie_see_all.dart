import 'package:flutter/material.dart';
import 'package:project_demo/data/model/movie/movie.dart';
import 'package:project_demo/presentation/view/movie/category_movie_list.dart';

import '../../config/constants.dart';

class MovieSeeAll extends StatefulWidget {
  List<MovieListItem> movieListItem;
  String category;
  MovieSeeAll({Key? key,required this.movieListItem,required this.category}) : super(key: key);

  @override
  State<MovieSeeAll> createState() => _MovieSeeAllState();
}

class _MovieSeeAllState extends State<MovieSeeAll> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Constants.BACKGROUND_COLOR,
        centerTitle: true,
        title: Text(
          widget.category,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              fontFamily: Constants.FONT_FAMILY),
        ),
      ),
      body: CategoryMovieList(movieListItem: widget.movieListItem,isLoading: false,)
    );
  }
}
