// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastDetail _$CastDetailFromJson(Map<String, dynamic> json) => CastDetail(
      birthday: json['birthday'] as String?,
      knownForDepartment: json['known_for_department'] as String?,
      deathday: json['deathday'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      alsoKnownAs: (json['also_known_as'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      gender: json['gender'] as int?,
      biography: json['biography'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      placeOfBirth: json['place_of_birth'] as String?,
      profilePath: json['profile_path'] as String?,
      adult: json['adult'] as bool?,
      imdbId: json['imdb_id'] as String?,
      homepage: json['homepage'] as String?,
    );

Map<String, dynamic> _$CastDetailToJson(CastDetail instance) =>
    <String, dynamic>{
      'birthday': instance.birthday,
      'known_for_department': instance.knownForDepartment,
      'deathday': instance.deathday,
      'id': instance.id,
      'name': instance.name,
      'also_known_as': instance.alsoKnownAs,
      'gender': instance.gender,
      'biography': instance.biography,
      'popularity': instance.popularity,
      'place_of_birth': instance.placeOfBirth,
      'profile_path': instance.profilePath,
      'adult': instance.adult,
      'imdb_id': instance.imdbId,
      'homepage': instance.homepage,
    };
