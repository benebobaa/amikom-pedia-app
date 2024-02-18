import 'dart:convert';

import 'package:amikompedia_app/core/constants/constants.dart';
import 'package:amikompedia_app/core/data/remote/base_response.dart';
import 'package:amikompedia_app/core/error/exception.dart';
import 'package:amikompedia_app/data/models/login_model.dart';
import 'package:amikompedia_app/data/models/register_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<BaseResponse<RegisterModel>> register(UserRegisterModel body);
  Future<BaseResponse<LoginModel>> login(
      String usernameOrEmail, String password);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final http.Client client;
  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<BaseResponse<RegisterModel>> register(UserRegisterModel body) async {
    final response = await client
        .post(
          Uri.parse(Urls.register),
          body: body.toJson(),
        )
        .timeout(
          const Duration(seconds: 5),
          onTimeout: () => throw TimeoutException(),
        );

    if (response.statusCode == 201) {
      return BaseResponse<RegisterModel>.fromJson(
        jsonDecode(response.body),
        RegisterModel.fromJson as RegisterModel Function(dynamic),
      );
    }
    if (response.statusCode == 400) {
      throw BadRequestException();
    }

    throw Exception();
  }

  @override
  Future<BaseResponse<LoginModel>> login(
      String usernameOrEmail, String password) async {
    Map<String, dynamic> body = {
      "username_or_email": usernameOrEmail,
      "password": password
    };

    final response = await client
        .post(
          Uri.parse(Urls.login),
          body: body,
        )
        .timeout(
          const Duration(seconds: 5),
          onTimeout: () => throw TimeoutException(),
        );

    if (response.statusCode == 200) {
      return BaseResponse<LoginModel>.fromJson(
        jsonDecode(response.body),
        LoginModel.fromJson as LoginModel Function(dynamic),
      );
    }
    if (response.statusCode == 401) {
      throw BadRequestException();
    }

    throw Exception();
  }
}
