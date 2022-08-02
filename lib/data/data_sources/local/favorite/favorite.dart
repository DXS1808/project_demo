import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:project_demo/data/model/favorite/favorite.dart';

class LocalFavorite{

  static Future addFavorite(int movieId,String userId,Favorite favorite) async {
    await Hive.box<Favorite>("favorite_$userId").put("${userId}_$movieId",favorite);
  }
  static Future removeFavorite(int movieId,String userId) async {
    await Hive.box<Favorite>("favorite_$userId").delete("${userId}_$movieId");
  }

}