


import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class OnGetPosts extends PostEvent {
  const OnGetPosts();
} 