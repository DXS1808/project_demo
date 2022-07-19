import 'package:json_annotation/json_annotation.dart';
part 'creat_session.g.dart';

@JsonSerializable()
class CreatSession{
  bool ? success;
  @JsonKey(name:"session_id")
  String ? sessionId;

  CreatSession(this.success,this.sessionId);
  factory CreatSession.fromJson(Map<String,dynamic>json) => _$CreatSessionFromJson(json);

  Map<String ,dynamic> toJson() => _$CreatSessionToJson(this);
}