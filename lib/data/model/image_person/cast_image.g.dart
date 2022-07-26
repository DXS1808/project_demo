// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastImage _$CastImageFromJson(Map<String, dynamic> json) => CastImage(
      json['id'] as int?,
      (json['profiles'] as List<dynamic>?)
          ?.map((e) => Profiles.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CastImageToJson(CastImage instance) => <String, dynamic>{
      'id': instance.id,
      'profiles': instance.profiles,
    };

Profiles _$ProfilesFromJson(Map<String, dynamic> json) => Profiles(
      (json['aspect_ratio'] as num?)?.toDouble(),
      json['file_path'] as String?,
      json['height'] as int?,
      json['iso_639_1'] as String?,
      json['vote_average'] as num?,
      json['vote_count'] as int?,
      json['width'] as int?,
    );

Map<String, dynamic> _$ProfilesToJson(Profiles instance) => <String, dynamic>{
      'aspect_ratio': instance.aspectRatio,
      'file_path': instance.filePath,
      'height': instance.height,
      'iso_639_1': instance.iso6391,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'width': instance.width,
    };
