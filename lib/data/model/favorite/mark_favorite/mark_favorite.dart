
import 'package:json_annotation/json_annotation.dart';

part 'mark_favorite.g.dart';

@JsonSerializable()
class MarkFavorite {
  @JsonKey(name: "media_type")
  String mediaType;
  @JsonKey(name:"media_id")
  int mediaId;
  bool favorite;
  MarkFavorite(this.mediaType,this.mediaId,this.favorite);

  factory MarkFavorite.fromJson(Map<String,dynamic> json) => _$MarkFavoriteFromJson(json);

  Map<String, dynamic> toJson() => _$MarkFavoriteToJson(this);

}