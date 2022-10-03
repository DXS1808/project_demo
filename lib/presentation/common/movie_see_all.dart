import 'package:flutter/material.dart';
import 'package:project_demo/data/model/movie/movie.dart';
import 'package:project_demo/presentation/view/movie/category_movie_list.dart';

import '../../config/constants.dart';

class MovieSeeAll extends StatefulWidget {
  final List<MovieListItem> movieListItem;
  final String category;
  const MovieSeeAll({Key? key,required this.movieListItem,required this.category}) : super(key: key);

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
        backgroundColor: Constants.backgroundColor,
        centerTitle: true,
        title: Text(
          widget.category,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              fontFamily: Constants.fontFamily),
        ),
      ),
      body: CategoryMovieList(movieListItem: widget.movieListItem,isLoading: false,)
    );
  }
}
