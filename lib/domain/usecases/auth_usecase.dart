import 'package:amikompedia_app/core/error/failure.dart';
import 'package:amikompedia_app/domain/entities/login_entity.dart';
import 'package:amikompedia_app/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthUsecase {
  final AuthRepository repository;

  AuthUsecase(this.repository);

  Future<Either<Failure, LoginEntity>> login(
      String email, String password) async {
    return await repository.login(email, password);
  }
}
