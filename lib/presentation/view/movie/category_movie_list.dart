import 'package:flutter/material.dart';

import '../../common/movie_item.dart';

class CategoryMovieList extends StatelessWidget {
  final List<dynamic> movieListItem;
  final String? searchText;

  const CategoryMovieList({
    Key? key,
    required this.movieListItem,
    this.searchText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> itemList = [];
    movieListItem
        .map((e) => itemList.add(
              MovieItem(
                movieListItem: e,
              ),
              // BlocProvider<MovieFavoriteCubit>.value(
              //   value: MovieFavoriteCubit(FavoriteUseCase(FavoriteImpl())),
              //   child: MovieItem(
              //     movieListItem: e,
              //   ),
              // ),
            ))
        .toList();
    return itemList.isEmpty && searchText != null
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${itemList.length} ",
                    style: const TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 12,
                        decoration: TextDecoration.underline),
                  ),
                  const Text(
                    "results with keyword ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "$searchText",
                    style: const TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 12,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
              Image.asset("assets/nodata.png")
            ],
          )
        : SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (searchText != null)
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Text(
                        "${itemList.length} ",
                        style: const TextStyle(
                            color: Colors.tealAccent,
                            fontSize: 12,
                            decoration: TextDecoration.underline),
                      ),
                      const Text(
                        "results with keyword ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "$searchText",
                        style: const TextStyle(
                            color: Colors.tealAccent,
                            fontSize: 12,
                            decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                ),
              Column(
                children: itemList,
              ),
            ],
          ));
  }
}
