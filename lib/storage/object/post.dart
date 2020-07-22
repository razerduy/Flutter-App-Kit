import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable(nullable: true)
class Post {

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String tiTle;

  @JsonKey(name: 'body')
  String boDy;

  Post({this.userId, this.id, this.tiTle, this.boDy});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}