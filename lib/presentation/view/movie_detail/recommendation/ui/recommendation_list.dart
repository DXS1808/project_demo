import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:project_demo/core/router/moive_router_data.dart';
import 'package:project_demo/data/model/movie/movie.dart';
import 'package:project_demo/presentation/common/category_text.dart';
import 'package:project_demo/presentation/common/movie_detail_item.dart';
import 'package:project_demo/presentation/common/movie_item.dart';

import '../../../../../core/router/router.dart';
import '../../../../../data/impl/favorite_impl.dart';
import '../../../../../domain/usecase/favorite_usecase.dart';
import '../../../../common/movie_see_all.dart';
import '../../../movie/movie_favorite/movie_favorite_cubit/movie_favorite_cubit.dart';

class RecommendationList extends StatelessWidget {
  List<MovieListItem> movieListItem;

  RecommendationList({Key? key, required this.movieListItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return movieListItem.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryText(
                    category: "Recommendations",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  GestureDetector(
                    onTap: () {
                      showMaterialModalBottomSheet(context: context, builder: (context){
                        return BlocProvider<MovieFavoriteCubit>.value(
                          value: MovieFavoriteCubit(FavoriteUseCase(FavoriteImpl())),
                          child: MovieSeeAll(movieListItem: movieListItem, category: "Recommendations")
                        );
                      });
                      // Navigator.pushNamed(context, AppRouter.MOVIE_SEE_ALL,
                      //     arguments: MovieRouterData(
                      //         "Recommendations", movieListItem));
                    },
                    child: CategoryText(
                      category: "See all",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.tealAccent,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: movieListItem
                      .map((e) => MovieItemDetail(
                          movieListItem: e, colorText: Colors.white))
                      .toList(),
                ),
              )
            ],
          )
        : Container(
            width: MediaQuery.of(context).size.width,
            child: CategoryText(
              category: "No Recommendation",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          );
  }
}
