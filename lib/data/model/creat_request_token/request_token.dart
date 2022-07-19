import 'package:json_annotation/json_annotation.dart';

part 'request_token.g.dart';

@JsonSerializable()
class RequestToken{
  bool success;
  @JsonKey(name:"expires_at")
  String expiresAt;
  @JsonKey(name:"request_token")
  String  requestToken;

  RequestToken(this.success,this.expiresAt,this.requestToken);

  factory RequestToken.fromJson(Map<String,dynamic>json) => _$RequestTokenFromJson(json);

  Map<String ,dynamic> toJson() => _$RequestTokenToJson(this);

}


