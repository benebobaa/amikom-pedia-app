import 'package:amikompedia_app/core/error/failure.dart';
import 'package:amikompedia_app/domain/entities/post_entity.dart';
import 'package:amikompedia_app/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostUsecase {
  final PostRepository repository;

  PostUsecase(this.repository);

  Future<Either<Failure, PostEntity>> getPosts() async {
    return await repository.getPosts();
  }
}
