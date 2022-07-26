
import 'package:json_annotation/json_annotation.dart';

part 'cast_image.g.dart';

@JsonSerializable()
class CastImage {
  int? id;
  List<Profiles>? profiles;

  CastImage(this.id, this.profiles);
  factory CastImage.fromJson(Map<String,dynamic>json) => _$CastImageFromJson(json);

  Map<String ,dynamic> toJson() => _$CastImageToJson(this);
}

@JsonSerializable()
class Profiles {
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

  Profiles(this.aspectRatio,
    this.filePath,
    this.height,
    this.iso6391,
    this.voteAverage,
    this.voteCount,
    this.width);
  factory Profiles.fromJson(Map<String,dynamic>json) => _$ProfilesFromJson(json);

  Map<String ,dynamic> toJson() => _$ProfilesToJson(this);
}