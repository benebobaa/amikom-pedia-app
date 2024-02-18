import 'package:amikompedia_app/domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({
    required String refCode,
    required UserRegisterModel userRegister,
  }) : super(
          refCode: refCode,
          userRegister: userRegister,
        );

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      refCode: json['ref_code'],
      userRegister: UserRegisterModel.fromJson(json['user_register']),
    );
  }



  RegisterEntity toEntity() => RegisterEntity(
        refCode: refCode,
        userRegister: userRegister.toEntity(),
      );
}

class UserRegisterModel extends UserRegisterEntity {
  const UserRegisterModel({
    required String name,
    required String email,
    required String nim,
    required bool isVerified,
  }) : super(
          name: name,
          email: email,
          nim: nim,
          isVerified: isVerified,
        );

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterModel(
      name: json['name'],
      email: json['email'],
      nim: json['nim'],
      isVerified: json['is_verified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'nim': nim,
      'is_verified': isVerified,
    };
  }

  UserRegisterEntity toEntity() => UserRegisterEntity(
        name: name,
        email: email,
        nim: nim,
        isVerified: isVerified,
      );
}
