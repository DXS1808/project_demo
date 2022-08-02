
import 'package:project_demo/data/data_sources/local/favorite/favorite.dart';
import 'package:project_demo/data/model/favorite/favorite.dart';
import 'package:project_demo/domain/repository/favorite_repository.dart';

class FavoriteImpl implements FavoriteRepository {
  @override
  Future addFavorite(String userId, int movieId, Favorite favorite) {
    // TODO: implement addFavorite
    return LocalFavorite.addFavorite(movieId, userId, favorite);
  }

  @override
  Future removeFavorite(String userId, int movieId) {
    // TODO: implement removeFavorite
    return LocalFavorite.removeFavorite(movieId, userId);
  }

}
