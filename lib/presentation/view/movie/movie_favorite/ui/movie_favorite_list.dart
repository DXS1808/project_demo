import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/presentation/view/movie/category_movie_list.dart';
import 'package:project_demo/presentation/view/movie/movie_favorite/movie_favorite_cubit/movie_favorite_cubit.dart';

class MovieFavoriteList extends StatefulWidget {
  String sessionId;
  int accountId;

  MovieFavoriteList(
      {Key? key, required this.accountId, required this.sessionId})
      : super(key: key);

  @override
  _MovieFavoriteListState createState() => _MovieFavoriteListState();
}

class _MovieFavoriteListState extends State<MovieFavoriteList> {
  @override
  void initState() {
    context
        .read<MovieFavoriteCubit>()
        .get(widget.accountId, widget.sessionId);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("MovieFavorite",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              fontFamily: Constants.FONT_FAMILY
          ),
        ),
      ),
      body: BlocBuilder<MovieFavoriteCubit, MovieFavoriteState>(
          builder: (context, state) {
            if (state.movieFavoriteStatus == MovieFavoriteStatus.loading) {
              return const Center(
                widthFactor: 40,
                heightFactor: 40,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else if (state.movieFavoriteStatus == MovieFavoriteStatus.success) {
              return state.getListFavorite == []
                    ? Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.movie,
                        color: Colors.grey,
                        size: 25,
                      ),
                      Text("No Movie Favorite")
                    ],
                  ),
                )
                    : CategoryMovieList(movieListItem: state.getListFavorite.reversed.toList());
            }
            return Container();
          }),
    );
  }
}
