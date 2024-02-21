import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final TokenEntity tokenEntity;

  final UserEntity userEntity;

  const LoginEntity({
    required this.tokenEntity,
    required this.userEntity,
  });

  @override
  List<Object?> get props => [tokenEntity, userEntity];

  LoginEntity toEntity() => LoginEntity(
        tokenEntity: tokenEntity,
        userEntity: userEntity,
      );
}

class TokenEntity extends Equatable {
  final String accessToken;
  final String accessTokenExpiresAt;
  final String refreshToken;
  final String refreshTokenExpiresAt;

  const TokenEntity({
    required this.accessToken,
    required this.accessTokenExpiresAt,
    required this.refreshToken,
    required this.refreshTokenExpiresAt,
  });

  @override
  List<Object?> get props => [
        accessToken,
        accessTokenExpiresAt,
        refreshToken,
        refreshTokenExpiresAt,
      ];

  TokenEntity toEntity() => TokenEntity(
        accessToken: accessToken,
        accessTokenExpiresAt: accessTokenExpiresAt,
        refreshToken: refreshToken,
        refreshTokenExpiresAt: refreshTokenExpiresAt,
      );
}

class UserEntity extends Equatable {
  final String email;
  final String nim;
  final String name;
  final String username;
  final String bio;

  const UserEntity({
    required this.email,
    required this.nim,
    required this.name,
    required this.username,
    required this.bio,
  });

  @override
  List<Object?> get props => [email, nim, name, username, bio];

  UserEntity toEntity() => UserEntity(
        email: email,
        nim: nim,
        name: name,
        username: username,
        bio: bio,
      );

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      email: json['email'],
      nim: json['nim'],
      name: json['name'],
      username: json['username'],
      bio: json['bio'],
    );
  }

  //to json

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
