
import 'package:amikompedia_app/core/error/failure.dart';
import 'package:amikompedia_app/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Failure, PostEntity>> getPosts();
}