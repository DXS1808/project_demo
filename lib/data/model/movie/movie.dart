import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  int page;
  List<MovieListItem> results;
  @JsonKey(name: "total_results")
  int totalResult;
  @JsonKey(name: "total_pages")
  int totalPages;
  Movie(this.page, this.results, this.totalPages, this.totalResult);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class MovieListItem {
  @JsonKey(name: "poster_path")
  String? posterPath;
  bool adult;
  String overview;
  @JsonKey(name: "release_date")
  String releaseDate;
  @JsonKey(name: "genre_ids")
  List<int> genreIds;
  int id;
  @JsonKey(name: "original_title")
  String originalTitle;
  @JsonKey(name: "original_language")
  String originalLanguage;
  String title;
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  num popularity;
  @JsonKey(name: "vote_count")
  int voteCount;
  bool video;
  @JsonKey(name: "vote_average")
  num voteAverage;

  MovieListItem(
      this.posterPath,
      this.adult,
      this.overview,
      this.releaseDate,
      this.genreIds,
      this.id,
      this.originalTitle,
      this.originalLanguage,
      this.title,
      this.backdropPath,
      this.popularity,
      this.voteCount,
      this.video,
      this.voteAverage);

  factory MovieListItem.fromJson(Map<String, dynamic> json) =>
      _$MovieListItemFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListItemToJson(this);
}
