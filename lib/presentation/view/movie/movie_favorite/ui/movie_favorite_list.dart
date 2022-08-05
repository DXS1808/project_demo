import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/presentation/common/skeleton/skeleton_home_screen.dart';
import 'package:project_demo/presentation/view/movie/category_movie_list.dart';
import 'package:project_demo/presentation/view/movie/movie_favorite/movie_favorite_cubit/movie_favorite_cubit.dart';
import 'package:skeletons/skeletons.dart';

class MovieFavoriteList extends StatefulWidget {
  const MovieFavoriteList({Key? key}) : super(key: key);

  @override
  _MovieFavoriteListState createState() => _MovieFavoriteListState();
}

class _MovieFavoriteListState extends State<MovieFavoriteList> {
  @override
  void initState() {
    context
        .read<MovieFavoriteCubit>()
        .get(FirebaseAuth.instance.currentUser!.uid);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Movie Favorite",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              fontFamily: Constants.FONT_FAMILY),
        ),
      ),
      body: BlocBuilder<MovieFavoriteCubit, MovieFavoriteState>(
          builder: (context, state) {
        print(state.movieFavoriteStatus);
        if (state.movieFavoriteStatus == MovieFavoriteStatus.loading) {
          return const SkeletonScreen();
        } else if (state.movieFavoriteStatus == MovieFavoriteStatus.success ||
            state.movieFavoriteStatus == MovieFavoriteStatus.markedSuccess) {
          return state.getListFavorite.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    children:  [
                      Image.asset("assets/logo-image.png",
                      height: 150,),
                      const Text(
                        "No Movie Favorite",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: Constants.FONTFAMILY,
                            fontSize: 14),
                      )
                    ],
                  ),
                )
              : CategoryMovieList(
                  movieListItem: state.getListFavorite.reversed.toList(),
                );
        }
        return const Text(
          "",
          style: TextStyle(color: Colors.white),
        );
      }),
    );
  }
}
