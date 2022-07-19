
import 'package:json_annotation/json_annotation.dart';

part 'status_favorite.g.dart';

@JsonSerializable()
class StatusFavorite {
    @JsonKey(name:"statusCode")
    int statusCode;
    @JsonKey(name:"status_message")
    String statusMessage;

    StatusFavorite(this.statusCode,this.statusMessage);

    factory StatusFavorite.fromJson(Map<String,dynamic> json) => _$StatusFavoriteFromJson(json);
    Map<String, dynamic> toJson() => _$StatusFavoriteToJson(this);
}