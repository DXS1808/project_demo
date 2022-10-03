import 'package:json_annotation/json_annotation.dart';
part 'credit_movie.g.dart';

@JsonSerializable()
class CreditMovie {
  List<CastMovie>? cast;
  List<Crew>? crew;
  int? id;

  CreditMovie(this.cast, this.crew, this.id);
  factory CreditMovie.fromJson(Map<String, dynamic> json) =>
      _$CreditMovieFromJson(json);

  Map<String, dynamic> toJson() => _$CreditMovieToJson(this);
}

@JsonSerializable()
class CastMovie {
  String? character;
  @JsonKey(name: "credit_id")
  String? creditId;
  @JsonKey(name: "release_date")
  String? releaseDate;
  @JsonKey(name: "vote_count")
  int? voteCount;
  bool? video;
  bool? adult;
  @JsonKey(name: "vote_average")
  num? voteAverage;
  String? title;
  @JsonKey(name: "genre_ids")
  List<int>? genreIds;
  @JsonKey(name: "original_language")
  String? originalLanguage;
  @JsonKey(name: "original_title")
  String? originalTitle;
  double? popularity;
  int? id;
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  String? overview;
  @JsonKey(name: "poster_path")
  String? posterPath;

  CastMovie(
      this.character,
      this.creditId,
      this.releaseDate,
      this.voteCount,
      this.video,
      this.adult,
      this.voteAverage,
      this.title,
      this.genreIds,
      this.originalLanguage,
      this.originalTitle,
      this.popularity,
      this.id,
      this.backdropPath,
      this.overview,
      this.posterPath);
  factory CastMovie.fromJson(Map<String, dynamic> json) =>
      _$CastMovieFromJson(json);

  Map<String, dynamic> toJson() => _$CastMovieToJson(this);
}

@JsonSerializable()
class Crew {
  int? id;
  String? department;
  String? originalLanguage;
  String? originalTitle;
  String? job;
  String? overview;
  int? voteCount;
  bool? video;
  String? posterPath;
  String? backdropPath;
  String? title;
  double? popularity;
  List<int>? genreIds;
  double? voteAverage;
  bool? adult;
  String? releaseDate;
  String? creditId;

  Crew(
      this.id,
      this.department,
      this.originalLanguage,
      this.originalTitle,
      this.job,
      this.overview,
      this.voteCount,
      this.video,
      this.posterPath,
      this.backdropPath,
      this.title,
      this.popularity,
      this.genreIds,
      this.voteAverage,
      this.adult,
      this.releaseDate,
      this.creditId);
  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
