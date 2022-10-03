import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/movie_item.dart';

class CategoryMovieList extends StatefulWidget {
  final List<dynamic> movieListItem;
  final String? searchText;
  final ScrollController? scrollController;
  final bool? isLoading;
  final bool favorite;

  const CategoryMovieList(
      {Key? key,
      required this.movieListItem,
      this.searchText,
      this.isLoading,
      this.favorite = false,
      this.scrollController})
      : super(key: key);

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
    Size size = MediaQuery.of(context).size;
    List<Widget> itemList = [];
    widget.movieListItem
        .map((e) => itemList.add(
              MovieItem(
                movieListItem: e,
                favorite: widget.favorite,
              ),
            ))
        .toList();
    return itemList.isEmpty && widget.searchText != null
        ? Container(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                if (widget.searchText != "")
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
                      Text(
                        AppLocalizations.of(context)!.search,
                        style: const TextStyle(
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
                        Text(
                          AppLocalizations.of(context)!.search,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          " ${widget.searchText}",
                          style: const TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 12,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                SizedBox(
                  height: widget.isLoading == true
                      ? size.height * 0.8 + 20
                      : size.height * 0.9,
                  child: ListView.builder(
                      controller: widget.scrollController,
                      itemCount: widget.isLoading == true
                          ? itemList.length + 1
                          : itemList.length,
                      itemBuilder: (context, index) {
                        return index == itemList.length &&
                                widget.isLoading == true
                            ? const CupertinoActivityIndicator(
                                color: Colors.black,
                              )
                            : itemList[index];
                      }),
                )
              ],
            ));
  }
}
