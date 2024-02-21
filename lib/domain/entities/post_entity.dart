import 'package:amikompedia_app/domain/entities/image_entity.dart';
import 'package:amikompedia_app/domain/entities/login_entity.dart';
import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final List<PostDataEntity> posts;

  const PostEntity({required this.posts});

  @override
  List<Object?> get props => [posts];

  //to entity

  PostEntity toEntity() => PostEntity(posts: posts);

}

class PostDataEntity extends Equatable {
  final String id;
  final String refPostId;
  final String content;
  final UserEntity user;
  final List<ImageEntity> images;
  final String createdAt;
  final String updatedAt;

  const PostDataEntity({
    required this.id,
    required this.refPostId,
    required this.content,
    required this.user,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, refPostId, content, user, images, createdAt, updatedAt];


  //from json

  factory PostDataEntity.fromJson(Map<String, dynamic> json) {
    return PostDataEntity(
      id: json['id'],
      refPostId: json['refPostId'],
      content: json['content'],
      user: UserEntity.fromJson(json['user']),
      images: (json['images'] as List)
          .map((e) => ImageEntity.fromJson(e))
          .toList(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  //to json

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'refPostId': refPostId,
      'content': content,
      'user': user.toJson(),
      'images': images.map((e) => e.toJson()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
