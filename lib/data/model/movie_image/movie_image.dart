import 'package:json_annotation/json_annotation.dart';

part 'movie_image.g.dart';
@JsonSerializable()
class MovieImage {
  int? id;
  List<Backdrops>? backdrops;
  List<Posters>? posters;

  MovieImage(this.id, this.backdrops, this.posters);
  factory MovieImage.fromJson(Map<String,dynamic>json) => _$MovieImageFromJson(json);

  Map<String ,dynamic> toJson() => _$MovieImageToJson(this);
}

@JsonSerializable()
class Backdrops {
  @JsonKey(name: "aspect_ratio")
  double? aspectRatio;
  @JsonKey(name: "file_path")
  String? filePath;
  int? height;
  @JsonKey(name: "iso_639_1")
  String? iso6391;
  @JsonKey(name: "vote_average")
  num? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;
  int? width;

  Backdrops(this.aspectRatio, this.filePath, this.height, this.iso6391,
      this.voteAverage, this.voteCount, this.width);
  factory Backdrops.fromJson(Map<String,dynamic>json) => _$BackdropsFromJson(json);

  Map<String ,dynamic> toJson() => _$BackdropsToJson(this);
}

@JsonSerializable()
class Posters {
  @JsonKey(name: "aspect_ratio")
  double? aspectRatio;
  @JsonKey(name: "file_path")
  String? filePath;
  int? height;
  @JsonKey(name: "iso_639_1")
  String? iso6391;
  @JsonKey(name: "vote_average")
  num? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;
  int? width;

  Posters(this.aspectRatio, this.filePath, this.height, this.iso6391,
      this.voteAverage, this.voteCount, this.width);
  factory Posters.fromJson(Map<String,dynamic>json) => _$PostersFromJson(json);

  Map<String ,dynamic> toJson() => _$PostersToJson(this);
}
