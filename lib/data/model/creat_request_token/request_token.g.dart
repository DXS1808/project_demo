// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestToken _$RequestTokenFromJson(Map<String, dynamic> json) => RequestToken(
      json['success'] as bool,
      json['expires_at'] as String,
      json['request_token'] as String,
    );

Map<String, dynamic> _$RequestTokenToJson(RequestToken instance) =>
    <String, dynamic>{
      'success': instance.success,
      'expires_at': instance.expiresAt,
      'request_token': instance.requestToken,
    };
