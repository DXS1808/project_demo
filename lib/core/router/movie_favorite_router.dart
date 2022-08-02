import 'package:project_demo/presentation/view/movie/movie_favorite/movie_favorite_cubit/movie_favorite_cubit.dart';

class MovieFavoriteRouter {
  MovieFavoriteCubit movieFavoriteCubit;
  int movieId;
  MovieFavoriteRouter(this.movieFavoriteCubit,this.movieId);
}