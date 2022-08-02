import 'package:hive/hive.dart';

part 'favorite.g.dart';

@HiveType(typeId: 0)
class Favorite {
  @HiveField(0)
  String? posterPath;
  @HiveField(1)
  String overview;
  @HiveField(2)
  int id;
  @HiveField(3)
  String ? releaseDate;
  @HiveField(4)
  String originalTitle;
  @HiveField(5)
  String title;
  @HiveField(6)
  int voteCount;
  @HiveField(7)
  num voteAverage;

  Favorite(this.posterPath, this.overview, this.id,this.releaseDate, this.originalTitle,
      this.title, this.voteCount, this.voteAverage);
}
