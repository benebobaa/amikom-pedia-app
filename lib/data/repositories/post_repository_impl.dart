import 'package:amikompedia_app/core/error/exception.dart';
import 'package:amikompedia_app/core/error/failure.dart';
import 'package:amikompedia_app/data/data_sources/remote_data_sources/post_remote_data_source.dart';
import 'package:amikompedia_app/domain/entities/post_entity.dart';
import 'package:amikompedia_app/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl extends PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, PostEntity>> getPosts() async {
    try {
      final result = await remoteDataSource.getPosts();
      return Right(result.data.toEntity());
    } on BadRequestException {
      return const Left(NotFoundFailure('City not found'));
    } on ServerException {
      return const Left(
          ServerFailure('An error occurred while getting weather data'));
    } on TimeoutException {
      return const Left(
          ConnectionFailure('Timeout, failed to connect to the network'));
    }
  }
}
