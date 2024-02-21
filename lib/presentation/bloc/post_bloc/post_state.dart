

import 'package:amikompedia_app/domain/entities/post_entity.dart';
import 'package:equatable/equatable.dart';

enum PostStatus { initial, loading, success, failure }

class PostState extends Equatable {
  final PostStatus? status;
  final String? message;
  final PostEntity? posts;


  const PostState({
    this.status = PostStatus.initial,
    this.message,
    this.posts,
  });

  @override
  List<Object?> get props => [status, message, posts];

  PostState copyWith({
    PostStatus? status,
    String? message,
    PostEntity? posts,
  }) {
    return PostState(
      status: status ?? this.status,
      message: message ?? this.message,
      posts: posts ?? this.posts,
    );
  }
}