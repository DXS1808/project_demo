// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieImage _$MovieImageFromJson(Map<String, dynamic> json) => MovieImage(
      json['id'] as int?,
      (json['backdrops'] as List<dynamic>?)
          ?.map((e) => Backdrops.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['posters'] as List<dynamic>?)
          ?.map((e) => Posters.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieImageToJson(MovieImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrops': instance.backdrops,
      'posters': instance.posters,
    };

Backdrops _$BackdropsFromJson(Map<String, dynamic> json) => Backdrops(
      (json['aspect_ratio'] as num?)?.toDouble(),
      json['file_path'] as String?,
      json['height'] as int?,
      json['iso_639_1'] as String?,
      json['vote_average'] as num?,
      json['vote_count'] as int?,
      json['width'] as int?,
    );

Map<String, dynamic> _$BackdropsToJson(Backdrops instance) => <String, dynamic>{
      'aspect_ratio': instance.aspectRatio,
      'file_path': instance.filePath,
      'height': instance.height,
      'iso_639_1': instance.iso6391,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'width': instance.width,
    };

Posters _$PostersFromJson(Map<String, dynamic> json) => Posters(
      (json['aspect_ratio'] as num?)?.toDouble(),
      json['file_path'] as String?,
      json['height'] as int?,
      json['iso_639_1'] as String?,
      json['vote_average'] as num?,
      json['vote_count'] as int?,
      json['width'] as int?,
    );

Map<String, dynamic> _$PostersToJson(Posters instance) => <String, dynamic>{
      'aspect_ratio': instance.aspectRatio,
      'file_path': instance.filePath,
      'height': instance.height,
      'iso_639_1': instance.iso6391,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'width': instance.width,
    };
