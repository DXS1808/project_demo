import 'package:project_demo/data/model/favorite/favorite.dart';
import 'package:project_demo/domain/repository/favorite_repository.dart';

class FavoriteUseCase {
  FavoriteRepository favoriteRepository;

  FavoriteUseCase(this.favoriteRepository);

  Future addFavorite(String userId, int movieId, Favorite favorite) async {
    try {
      return favoriteRepository.addFavorite(userId, movieId, favorite);
    } catch (e) {
      print(e);
    }
  }

  Future removeFavorite(String userId, int movieId) async {
    try {
      return favoriteRepository.removeFavorite(userId, movieId);
    } catch (e) {
      print(e);
    }
  }
}
