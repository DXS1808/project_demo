import 'package:json_annotation/json_annotation.dart';

part 'creat_request_token.g.dart';

@JsonSerializable()
class CreatRequestToken{
  bool ? success;
  @JsonKey(name:"expires_at")
  String ? expiresAt;
  @JsonKey(name:"request_token")
  String ? requestToken;

  CreatRequestToken(this.success,this.expiresAt,this.requestToken);

  factory CreatRequestToken.fromJson(Map<String,dynamic>json) => _$CreatRequestTokenFromJson(json);

  Map<String ,dynamic> toJson() => _$CreatRequestTokenToJson(this);

}


