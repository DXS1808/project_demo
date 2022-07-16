
import 'package:flutter/material.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/movie.dart';
import 'package:project_demo/presentation/common/cache_image.dart';

class NowPlayingItem extends StatelessWidget {
  final MovieListItem movieListItem;

  const NowPlayingItem({Key? key, required this.movieListItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 160,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: CacheImage(movieListItem.posterPath!, 250, 150, BoxFit.cover),
            ),
            Text(movieListItem.originalTitle,
              softWrap: true,
              style:const TextStyle(
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
              ),
            ),
            Text(movieListItem.releaseDate,
              softWrap: true,
              style:const TextStyle(
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
              ),
            )
          ],
        )
    );
  }
}
