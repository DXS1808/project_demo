// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkFavorite _$MarkFavoriteFromJson(Map<String, dynamic> json) => MarkFavorite(
      json['media_type'] as String,
      json['media_id'] as int,
      json['favorite'] as bool,
    );

Map<String, dynamic> _$MarkFavoriteToJson(MarkFavorite instance) =>
    <String, dynamic>{
      'media_type': instance.mediaType,
      'media_id': instance.mediaId,
      'favorite': instance.favorite,
    };
