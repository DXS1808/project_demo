
import 'package:flutter/material.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/core/router/router.dart';
import 'package:project_demo/data/model/movie/movie.dart';
import 'package:project_demo/presentation/common/cache_image.dart';
import 'package:project_demo/presentation/common/category_text.dart';
import 'package:project_demo/presentation/common/star_vote_average.dart';


class MovieItem extends StatefulWidget {
  MovieListItem movieListItem;

  MovieItem({Key? key, required this.movieListItem}) : super(key: key);

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.MOVIE_DETAIL,arguments: widget.movieListItem.id);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                color: Colors.white24.withOpacity(0.2),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      widget.movieListItem.posterPath != null ?
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: CacheImage(widget.movieListItem.posterPath!, 150,
                            100, BoxFit.cover),
                      ): Container(
                        height: 150,
                        width: 100,
                        decoration: const BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.grey,
                        ),
                        child: const Icon(Icons.person,
                        size: 30,
                        ),
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
                            fontWeight: Constants.FONTWEIGHT,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            widget.movieListItem.overview,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 11,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          CategoryText(
                            category: "${widget.movieListItem.releaseDate} ",
                          ),
                          CategoryText(
                              category:
                                  "Vote Count : ${widget.movieListItem.voteCount}"),
                          voteAverage(widget.movieListItem.voteAverage),
                          const SizedBox(width: 8.0),
                        ],
                      ))
                    ],
                  ),
                )),
          ),
          Positioned(
              top: 0,
              right: 10,
              child: Opacity(
                opacity: 0.8,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 5.0,right: 5.0,left: 5.0),
                  decoration: const BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.movieListItem.voteAverage.toStringAsFixed(1),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                      ),
                      const Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Future<bool> markFavoriteMovie() async {
    return true;
  }

  Widget voteAverage(num voteAverage) {
    if (voteAverage <= 5) {
      return const StarVoteAverage(length: 1);
    } else if (5 < voteAverage && voteAverage <= 6) {
      return const StarVoteAverage(length: 2);
    } else if (5 < voteAverage && voteAverage <= 7) {
      return const StarVoteAverage(length: 3);
    } else if (7 < voteAverage && voteAverage < 8.5) {
      return const StarVoteAverage(length: 4);
    } else {
      return const StarVoteAverage(length: 5);
    }
  }

  String takeDecimalNumber(num average) {
    return average.toStringAsFixed(1);
  }
}
