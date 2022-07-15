import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_demo/data/model/movie.dart';

class MovieItem extends StatefulWidget {
  Movie movie;
  MovieItem({Key? key,required this.movie}) : super(key: key);

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(widget.movie.totalResult.toString()),
    );
  }
}
