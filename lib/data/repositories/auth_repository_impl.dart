import 'package:amikompedia_app/core/error/exception.dart';
import 'package:amikompedia_app/core/error/failure.dart';
import 'package:amikompedia_app/data/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'package:amikompedia_app/domain/entities/login_entity.dart';
import 'package:amikompedia_app/domain/entities/register_entity.dart';
import 'package:amikompedia_app/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, RegisterEntity>> register(
      UserRegisterEntity request) async {
    try {
      final result = await remoteDataSource.register(request.toModel());
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

  @override
  Future<Either<Failure, LoginEntity>> login(
      String emailOrUsername, String password) async {
    try {
      final result = await remoteDataSource.login(emailOrUsername, password);
      return Right(result.data.toEntity());
    } on BadRequestException {
      return const Left(NotFoundFailure('Email or username not found'));
    } on NotFoundException {
      return const Left(NotFoundFailure('Email or username not found'));
    } on ServerException {
      return const Left(
          ServerFailure('An error occurred while getting weather data'));
    } on TimeoutException {
      return const Left(
          ConnectionFailure('Timeout, failed to connect to the network'));
    }
  }
}
