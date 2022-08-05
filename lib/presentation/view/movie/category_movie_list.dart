import 'package:flutter/material.dart';

import '../../common/movie_item.dart';

class CategoryMovieList extends StatefulWidget {
  final List<dynamic> movieListItem;
  final String? searchText;
  // ScrollController ? scrollController;

  CategoryMovieList({
    Key? key,
    required this.movieListItem,
    this.searchText,
  }) : super(key: key);

  @override
  State<CategoryMovieList> createState() => _CategoryMovieListState();
}

class _CategoryMovieListState extends State<CategoryMovieList> {

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> itemList = [];
    widget.movieListItem
        .map((e) => itemList.add(
              MovieItem(
                movieListItem: e,
              ),
            ))
        .toList();
    return itemList.isEmpty && widget.searchText != null
        ? Container(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
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
                      "${widget.searchText}",
                      style: const TextStyle(
                          color: Colors.tealAccent,
                          fontSize: 12,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
                Image.asset(
                  "assets/no-movie.png",
                  height: 200,
                  width: 200,
                )
              ],
            ),
          )
        : SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.searchText != null)
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
                          "${widget.searchText}",
                          style: const TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 12,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                Column(
                  children: [
                    Column(
                      children: itemList,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                )
              ],
            ));
  }
}
