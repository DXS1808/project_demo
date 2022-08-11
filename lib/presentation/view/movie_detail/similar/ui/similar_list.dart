import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:project_demo/data/model/movie/movie.dart';
import 'package:project_demo/presentation/common/movie_see_all.dart';

import '../../../../../core/router/moive_router_data.dart';
import '../../../../../core/router/router.dart';
import '../../../../../data/impl/favorite_impl.dart';
import '../../../../../domain/usecase/favorite_usecase.dart';
import '../../../../common/category_text.dart';
import '../../../../common/movie_detail_item.dart';
import '../../../movie/movie_favorite/movie_favorite_cubit/movie_favorite_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SimilarList extends StatelessWidget {
  List<MovieListItem> movieListItem;

  SimilarList({Key? key, required this.movieListItem}) : super(key: key);

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
                    category: AppLocalizations.of(context)!.similar,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  GestureDetector(
                    onTap: () {
                      showMaterialModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return BlocProvider<MovieFavoriteCubit>.value(
                              value: MovieFavoriteCubit(
                                  FavoriteUseCase(FavoriteImpl())),
                              child: MovieSeeAll(
                                  movieListItem: movieListItem,
                                  category:
                                      AppLocalizations.of(context)!.similar),
                            );
                          });
                      // Navigator.pushNamed(context, AppRouter.MOVIE_SEE_ALL,
                      //     arguments: MovieRouterData("Similar", movieListItem));
                    },
                    child: CategoryText(
                      category: AppLocalizations.of(context)!.see_all,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: movieListItem
                      .map((e) => MovieItemDetail(
                          movieListItem: e, colorText: Colors.black))
                      .toList(),
                ),
              )
            ],
          )
        : Container(
            width: MediaQuery.of(context).size.width,
            child: CategoryText(
              category: "No Similar",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          );
  }
}
