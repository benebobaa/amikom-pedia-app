

import 'package:amikompedia_app/data/models/image_model.dart';
import 'package:amikompedia_app/data/models/login_model.dart';
import 'package:amikompedia_app/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({required List<PostDataEntity> posts}) : super(posts: posts);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      posts: (json['posts'] as List)
          .map((e) => PostDataEntity.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'posts': posts.map((e) => e.toJson()).toList(),
    };
  }
}

class PostDataModel extends PostDataEntity {
  PostDataModel({
    required String id,
    required String refPostId,
    required String content,
    required UserModel user,
    required List<ImageModel> images,
    required String createdAt,
    required String updatedAt,
  }) : super(
          id: id,
          refPostId: refPostId,
          content: content,
          user: user,
          images: images,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory PostDataModel.fromJson(Map<String, dynamic> json) {
    return PostDataModel(
      id: json['id'],
      refPostId: json['refPostId'],
      content: json['content'],
      user: UserModel.fromJson(json['user']),
      images: (json['images'] as List)
          .map((e) => ImageModel.fromJson(e))
          .toList(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

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

  //to entity

  PostDataEntity toEntity() => PostDataEntity(
        id: id,
        refPostId: refPostId,
        content: content,
        user: user.toEntity(),
        images: images.map((e) => e.toEntity()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}