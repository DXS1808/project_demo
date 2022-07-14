
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie{
  int page;
  List<MovieListItem> results;
  int total_result;
  int total_pages;
  Movie(this.page,this.results,this.total_pages,this.total_result);

  factory Movie.fromJson(Map<String,dynamic>json) => _$MovieFromJson(json);

  Map<String ,dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class MovieListItem{
  String ? poster_path;
  bool boolean;
  String overview;
  String release_date;
  List<int> genre_ids;
  int id;
  String original_title;
  String original_language;
  String title;
  String ? backdrop_path;
  num popularity;
  int vote_count;
  bool video;
  num vote_average;

  MovieListItem(
      this.poster_path,
      this.boolean,
      this.overview,
      this.release_date,
      this.genre_ids,
      this.id,
      this.original_title,
      this.original_language,
      this.title,
      this.backdrop_path,
      this.popularity,
      this.vote_count,
      this.video,
      this.vote_average);

  factory MovieListItem.fromJson(Map<String,dynamic>json) => _$MovieListItemFromJson(json);

  Map<String ,dynamic> toJson() => _$MovieListItemToJson(this);
}