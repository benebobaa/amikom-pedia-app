import 'package:amikompedia_app/core/error/failure.dart';
import 'package:amikompedia_app/domain/entities/login_entity.dart';
import 'package:amikompedia_app/domain/entities/register_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterEntity>> register(UserRegisterEntity request);

  Future<Either<Failure, LoginEntity>> login(
      String emailOrUsername, String password);
}
