import 'package:amikompedia_app/data/models/register_model.dart';
import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String refCode;
  final UserRegisterEntity userRegister;

  const RegisterEntity({
    required this.refCode,
    required this.userRegister,
  });

  @override
  List<Object?> get props => [refCode, userRegister];

  RegisterEntity toEntity() => RegisterEntity(
        refCode: refCode,
        userRegister: userRegister,
      );
}

class UserRegisterEntity extends Equatable {
  final String name;
  final String email;
  final String nim;
  final bool isVerified;

  const UserRegisterEntity({
    required this.name,
    required this.email,
    required this.nim,
    required this.isVerified,
  });

  @override
  List<Object?> get props => [name, email, nim, isVerified];

  UserRegisterEntity toEntity() => UserRegisterEntity(
        name: name,
        email: email,
        nim: nim,
        isVerified: isVerified,
      );

  UserRegisterModel toModel() => UserRegisterModel(
        name: name,
        email: email,
        nim: nim,
        isVerified: isVerified,
      );
}
