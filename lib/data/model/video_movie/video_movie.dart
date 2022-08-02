
import 'package:json_annotation/json_annotation.dart';
part 'video_movie.g.dart';
@JsonSerializable()
class MovieVideo {
  int? id;
  List<Results>? results;

  MovieVideo(this.id, this.results);

  factory MovieVideo.fromJson(Map<String,dynamic>json) => _$MovieVideoFromJson(json);

  Map<String ,dynamic> toJson() => _$MovieVideoToJson(this);
}

@JsonSerializable()
class Results {
  @JsonKey(name: "iso_639_1")
  String? iso6391;
  @JsonKey(name: "iso_3166_1")
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? publishedAt;
  String? id;

  Results(this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id);

  factory Results.fromJson(Map<String,dynamic>json) => _$ResultsFromJson(json);

  Map<String ,dynamic> toJson() => _$ResultsToJson(this);
}
