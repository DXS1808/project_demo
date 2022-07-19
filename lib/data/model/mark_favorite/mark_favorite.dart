
import 'package:json_annotation/json_annotation.dart';

part 'mark_favorite.g.dart';

@JsonSerializable()
class MarkFavorite {
  String mediaType;
  String mediaId;
  bool favorite;
  MarkFavorite(this.mediaType,this.mediaId,this.favorite);

  factory MarkFavorite.fromJson(Map<String,dynamic> json) => _$MarkFavoriteFromJson(json);

  Map<String, dynamic> toJson() => _$MarkFavoriteToJson(this);

}