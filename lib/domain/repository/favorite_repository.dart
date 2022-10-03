import 'package:project_demo/data/model/favorite/favorite.dart';

abstract class FavoriteRepository {
  Future addFavorite(String userId, int movieId, Favorite favorite);
  Future removeFavorite(String userId, int movieId);
}
