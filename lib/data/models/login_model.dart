import 'package:amikompedia_app/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required TokenModel tokenModel,
    required UserModel userModel,
  }) : super(
          tokenEntity: tokenModel,
          userEntity: userModel,
        );

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      tokenModel: TokenModel.fromJson(json['token']),
      userModel: UserModel.fromJson(json['user']),
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'token': tokenEntity.toJson(),
  //     'user': userEntity.toJson(),
  //   };
  // }
}

class TokenModel extends TokenEntity {
  TokenModel({
    required String accessToken,
    required String accessTokenExpiresAt,
    required String refreshToken,
    required String refreshTokenExpiresAt,
  }) : super(
          accessToken: accessToken,
          accessTokenExpiresAt: accessTokenExpiresAt,
          refreshToken: refreshToken,
          refreshTokenExpiresAt: refreshTokenExpiresAt,
        );

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['access_token'],
      accessTokenExpiresAt: json['access_token_expires_at'],
      refreshToken: json['refresh_token'],
      refreshTokenExpiresAt: json['refresh_token_expires_at'],
    );
  }
}

class UserModel extends UserEntity {
  UserModel({
    required String email,
    required String nim,
    required String name,
    required String username,
    required String bio,
  }) : super(
          email: email,
          nim: nim,
          name: name,
          username: username,
          bio: bio,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      nim: json['nim'],
      name: json['name'],
      username: json['username'],
      bio: json['bio'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'nim': nim,
      'name': name,
      'username': username,
      'bio': bio,
    };
  }
}
