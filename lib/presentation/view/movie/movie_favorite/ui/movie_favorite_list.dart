import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/presentation/common/skeleton/skeleton_home_screen.dart';
import 'package:project_demo/presentation/view/movie/category_movie_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_demo/presentation/view/movie/movie_favorite/movie_favorite_cubit/movie_favorite_cubit.dart';

class MovieFavoriteList extends StatefulWidget {
  const MovieFavoriteList({Key? key}) : super(key: key);

  @override
  MovieFavoriteListState createState() => MovieFavoriteListState();
}

class MovieFavoriteListState extends State<MovieFavoriteList> {
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
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.4,
                  0.2,
                ],
                colors: [
                  Constants.backgroundColor,
                  Colors.white,
                ],
              )
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Constants.backgroundColor,
              centerTitle: true,
              title:Text(
                AppLocalizations.of(context)!.movie_favorite,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontFamily: Constants.fontFamily),
              ),
            ),
            body:
                BlocBuilder<MovieFavoriteCubit, MovieFavoriteState>(
                    builder: (context, state) {
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
                                    color: Colors.black,
                                    fontFamily: Constants.textFontFamily,
                                    fontSize: 14),
                              )
                            ],
                          ),
                        )
                            : CategoryMovieList(
                          movieListItem: state.getListFavorite.reversed.toList(),isLoading: false,favorite: true,
                        );
                      }
                      return const SkeletonScreen();
                    }),
        )
      ],
    );
  }
}
