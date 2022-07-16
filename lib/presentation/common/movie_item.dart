import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_demo/data/model/movie.dart';
import 'package:project_demo/presentation/common/cache_image.dart';
import 'package:project_demo/presentation/common/category_text.dart';

class MovieItem extends StatefulWidget {
  MovieListItem movieListItem;

  MovieItem({Key? key, required this.movieListItem}) : super(key: key);

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
          color: Colors.white24,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: CacheImage(
                      widget.movieListItem.posterPath!, 150, 100, BoxFit.cover),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryText(
                      category: widget.movieListItem.originalTitle,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 5.0,),
                    Text(
                      widget.movieListItem.overview,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 11,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.grey
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    CategoryText(
                      category: "Date: ${widget.movieListItem.releaseDate} ",
                    ),
                    CategoryText(
                        category:
                            "Vote Count : ${widget.movieListItem.voteCount}"),
                    CategoryText(
                        category:
                            "Vote Average : ${widget.movieListItem.voteAverage}")
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
