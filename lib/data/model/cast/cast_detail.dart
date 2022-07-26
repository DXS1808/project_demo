
import 'package:json_annotation/json_annotation.dart';
part 'cast_detail.g.dart';

@JsonSerializable()

  class CastDetail {
  String? birthday;
  @JsonKey(name:"known_for_department")
  String? knownForDepartment;
  String? deathday;
  int? id;
  String? name;
  @JsonKey(name:"also_known_as")
  List<String>? alsoKnownAs;
  int? gender;
  String? biography;
  double? popularity;
  @JsonKey(name:"place_of_birth")
  String? placeOfBirth;
  @JsonKey(name:"profile_path")
  String? profilePath;
  bool? adult;
  @JsonKey(name:"imdb_id")
  String? imdbId;
  String? homepage;

  CastDetail(
  {this.birthday,
  this.knownForDepartment,
  this.deathday,
  this.id,
  this.name,
  this.alsoKnownAs,
  this.gender,
  this.biography,
  this.popularity,
  this.placeOfBirth,
  this.profilePath,
  this.adult,
  this.imdbId,
  this.homepage});

  factory CastDetail.fromJson(Map<String,dynamic>json) => _$CastDetailFromJson(json);

  Map<String ,dynamic> toJson() => _$CastDetailToJson(this);
  }
