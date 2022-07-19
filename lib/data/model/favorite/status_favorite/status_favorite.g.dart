// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusFavorite _$StatusFavoriteFromJson(Map<String, dynamic> json) =>
    StatusFavorite(
      json['statusCode'] as int,
      json['status_message'] as String,
    );

Map<String, dynamic> _$StatusFavoriteToJson(StatusFavorite instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'status_message': instance.statusMessage,
    };
