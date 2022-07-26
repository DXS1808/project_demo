// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditMovie _$CreditMovieFromJson(Map<String, dynamic> json) => CreditMovie(
      (json['cast'] as List<dynamic>?)
          ?.map((e) => CastMovie.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>?)
          ?.map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as int?,
    );

Map<String, dynamic> _$CreditMovieToJson(CreditMovie instance) =>
    <String, dynamic>{
      'cast': instance.cast,
      'crew': instance.crew,
      'id': instance.id,
    };

CastMovie _$CastMovieFromJson(Map<String, dynamic> json) => CastMovie(
      json['character'] as String?,
      json['credit_id'] as String?,
      json['release_date'] as String?,
      json['vote_count'] as int?,
      json['video'] as bool?,
      json['adult'] as bool?,
      json['vote_average'] as num?,
      json['title'] as String?,
      (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['original_language'] as String?,
      json['original_title'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['id'] as int?,
      json['backdrop_path'] as String?,
      json['overview'] as String?,
      json['poster_path'] as String?,
    );

Map<String, dynamic> _$CastMovieToJson(CastMovie instance) => <String, dynamic>{
      'character': instance.character,
      'credit_id': instance.creditId,
      'release_date': instance.releaseDate,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'adult': instance.adult,
      'vote_average': instance.voteAverage,
      'title': instance.title,
      'genre_ids': instance.genreIds,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'popularity': instance.popularity,
      'id': instance.id,
      'backdrop_path': instance.backdropPath,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
    };

Crew _$CrewFromJson(Map<String, dynamic> json) => Crew(
      json['id'] as int?,
      json['department'] as String?,
      json['originalLanguage'] as String?,
      json['originalTitle'] as String?,
      json['job'] as String?,
      json['overview'] as String?,
      json['voteCount'] as int?,
      json['video'] as bool?,
      json['posterPath'] as String?,
      json['backdropPath'] as String?,
      json['title'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      (json['genreIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
      (json['voteAverage'] as num?)?.toDouble(),
      json['adult'] as bool?,
      json['releaseDate'] as String?,
      json['creditId'] as String?,
    );

Map<String, dynamic> _$CrewToJson(Crew instance) => <String, dynamic>{
      'id': instance.id,
      'department': instance.department,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'job': instance.job,
      'overview': instance.overview,
      'voteCount': instance.voteCount,
      'video': instance.video,
      'posterPath': instance.posterPath,
      'backdropPath': instance.backdropPath,
      'title': instance.title,
      'popularity': instance.popularity,
      'genreIds': instance.genreIds,
      'voteAverage': instance.voteAverage,
      'adult': instance.adult,
      'releaseDate': instance.releaseDate,
      'creditId': instance.creditId,
    };
