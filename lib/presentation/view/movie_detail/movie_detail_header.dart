import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:project_demo/config/constants.dart';
import 'package:project_demo/data/model/movie_detail/movie_detail.dart';

import '../../../data/model/favorite/mark_favorite/mark_favorite.dart';
import '../../allert_dropdown/allert_dropdown.dart';
import '../mark_favorite_cubit/mark_favorite_cubit.dart';

class MovieDetailHeader extends AppBar {
  MovieDetail movieDetail;

  MovieDetailHeader(this.movieDetail);

  @override
  State<MovieDetailHeader> createState() => _MovieDetailHeaderState();
}

class _MovieDetailHeaderState extends State<MovieDetailHeader> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: Container(
        padding: const EdgeInsets.all(5.0),
        child: CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.5),
          child: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,color: Colors.tealAccent,),
          ),
        ),
      ),
      // title: const Text(
      //   "MovieDetail",
      //   style: TextStyle(
      //       fontWeight: FontWeight.w400,
      //       fontSize: 18,
      //       fontFamily: Constants.FONT_FAMILY),
      // ),
      actions: [
        Container(
          padding:  const EdgeInsets.all(5.0),
          child: LikeButton(
            likeBuilder: (bool isLike) {
              context.read<MarkFavoriteCubit>().isFavorite(isLike);
              return BlocBuilder<MarkFavoriteCubit, MarkFavoriteState>(
                // buildWhen: (previous, current) =>
                // (current.comment!=null&&current.comment!.id == widget.comment.id) ||
                //     (previous.comment != null &&
                //         previous.comment!.id == widget.comment.id),
                  builder: (context, state) {
                    return Icon(
                      Icons.favorite,
                      color: state.isFavorite! ? Colors.pinkAccent : Colors.grey,
                      size: 30,
                    );
                  });
            },
            onTap: (bool isLike) {
              MarkFavorite markFavorite = MarkFavorite(
                  Constants.MEDIA_TYPE, widget.movieDetail.id!, true);
              context.read<MarkFavoriteCubit>().markFavorite(markFavorite);
              BlocListener<MarkFavoriteCubit, MarkFavoriteState>(
                listener: (context, state) {
                  if (state.markFavoriteStatus == MarkFavoriteStatus.success) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },);
              return onLikeButtonTapped(false);
            },
          ),
        )
      ],
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    return !isLiked;
  }
}
