// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkFavorite _$MarkFavoriteFromJson(Map<String, dynamic> json) => MarkFavorite(
      json['mediaType'] as String,
      json['mediaId'] as String,
      json['favorite'] as bool,
    );

Map<String, dynamic> _$MarkFavoriteToJson(MarkFavorite instance) =>
    <String, dynamic>{
      'mediaType': instance.mediaType,
      'mediaId': instance.mediaId,
      'favorite': instance.favorite,
    };
