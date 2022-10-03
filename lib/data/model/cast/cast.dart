import 'package:json_annotation/json_annotation.dart';
part 'cast.g.dart';

@JsonSerializable()
class CreditCast {
  int? id;
  List<Cast>? cast;
  List<Crew>? crew;

  CreditCast(this.id, this.cast, this.crew);
  factory CreditCast.fromJson(Map<String, dynamic> json) =>
      _$CreditCastFromJson(json);

  Map<String, dynamic> toJson() => _$CreditCastToJson(this);
}

@JsonSerializable()
class Cast {
  bool? adult;
  int? gender;
  int? id;
  @JsonKey(name: "known_for_department")
  String? knownForDepartment;
  String? name;
  @JsonKey(name: "original_name")
  String? originalName;
  double? popularity;
  @JsonKey(name: "profile_path")
  String? profilePath;
  @JsonKey(name: "cast_id")
  int? castId;
  String? character;
  @JsonKey(name: "credit_id")
  String? creditId;
  int? order;

  Cast(
      this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order);
  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}

@JsonSerializable()
class Crew {
  bool? adult;
  int? gender;
  int? id;
  @JsonKey(name: "known_for_department")
  String? knownForDepartment;
  String? name;
  @JsonKey(name: "original_name")
  String? originalName;
  double? popularity;
  String? profilePath;
  @JsonKey(name: "profile_path")
  String? creditId;
  @JsonKey(name: "credit_id")
  String? department;
  String? job;

  Crew(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.creditId,
      this.department,
      this.job});
  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
