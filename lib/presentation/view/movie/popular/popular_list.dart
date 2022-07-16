import 'package:flutter/cupertino.dart';
import 'package:project_demo/data/model/movie.dart';
import 'package:project_demo/presentation/view/movie/popular/popular_item.dart';

class PopularList extends StatefulWidget {
  List<MovieListItem> movieListItem;

  PopularList({Key? key, required this.movieListItem}) : super(key: key);

  @override
  _PopularListState createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.movieListItem.length,
          itemBuilder: (context, index) {
            return PopularItem(movieListItem: widget.movieListItem[index]);
          }),
    );
  }
}
