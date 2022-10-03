import 'package:json_annotation/json_annotation.dart';

part 'reviews.g.dart';

@JsonSerializable()
class Reviews {
  int? id;
  int? page;
  List<Results>? results;
  @JsonKey(name: "total_pages")
  num? totalPages;
  @JsonKey(name: "total_results")
  num? totalResults;

  Reviews(this.id, this.page, this.results, this.totalPages, this.totalResults);
  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsToJson(this);
}

@JsonSerializable()
class Results {
  String? author;
  @JsonKey(name: "author_details")
  AuthorDetails? authorDetails;
  String? content;
  @JsonKey(name: "created_at")
  String? createdAt;
  String? id;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  String? url;

  Results(this.author, this.authorDetails, this.content, this.createdAt,
      this.id, this.updatedAt, this.url);
  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}

@JsonSerializable()
class AuthorDetails {
  String? name;
  String? username;
  @JsonKey(name: "avatar_path")
  String? avatarPath;
  num? rating;

  AuthorDetails(this.name, this.username, this.avatarPath, this.rating);

  factory AuthorDetails.fromJson(Map<String, dynamic> json) =>
      _$AuthorDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDetailsToJson(this);
}
