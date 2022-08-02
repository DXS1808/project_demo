// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVideo _$MovieVideoFromJson(Map<String, dynamic> json) => MovieVideo(
      json['id'] as int?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieVideoToJson(MovieVideo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      json['iso_639_1'] as String?,
      json['iso_3166_1'] as String?,
      json['name'] as String?,
      json['key'] as String?,
      json['site'] as String?,
      json['size'] as int?,
      json['type'] as String?,
      json['official'] as bool?,
      json['publishedAt'] as String?,
      json['id'] as String?,
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'iso_639_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'publishedAt': instance.publishedAt,
      'id': instance.id,
    };
