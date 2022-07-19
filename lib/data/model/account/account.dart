
import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

@JsonSerializable()
class Account {
  Avatar ? avatar;
  int? id;
  String? iso6391;
  String? iso31661;
  String? name;
  bool? includeAdult;
  String? username;
  Account(this.avatar,this.id,this.iso6391,this.iso31661,this.name,this.includeAdult,this.username);

  factory Account.fromJson(Map<String,dynamic>json) => _$AccountFromJson(json);

  Map<String ,dynamic> toJson() => _$AccountToJson(this);
}
@JsonSerializable()
class Avatar{
    Gravatar ? gravatar;
    Avatar(this.gravatar);
    factory Avatar.fromJson(Map<String,dynamic>json) => _$AvatarFromJson(json);

    Map<String ,dynamic> toJson() => _$AvatarToJson(this);

}
@JsonSerializable()
class Gravatar{
  String? hash;
  Gravatar(this.hash);
  factory Gravatar.fromJson(Map<String,dynamic>json) => _$GravatarFromJson(json);

  Map<String ,dynamic> toJson() => _$GravatarToJson(this);
}