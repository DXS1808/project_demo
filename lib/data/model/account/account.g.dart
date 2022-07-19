// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      json['avatar'] == null
          ? null
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      json['id'] as int?,
      json['iso6391'] as String?,
      json['iso31661'] as String?,
      json['name'] as String?,
      json['includeAdult'] as bool?,
      json['username'] as String?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'avatar': instance.avatar,
      'id': instance.id,
      'iso6391': instance.iso6391,
      'iso31661': instance.iso31661,
      'name': instance.name,
      'includeAdult': instance.includeAdult,
      'username': instance.username,
    };

Avatar _$AvatarFromJson(Map<String, dynamic> json) => Avatar(
      json['gravatar'] == null
          ? null
          : Gravatar.fromJson(json['gravatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
      'gravatar': instance.gravatar,
    };

Gravatar _$GravatarFromJson(Map<String, dynamic> json) => Gravatar(
      json['hash'] as String?,
    );

Map<String, dynamic> _$GravatarToJson(Gravatar instance) => <String, dynamic>{
      'hash': instance.hash,
    };
