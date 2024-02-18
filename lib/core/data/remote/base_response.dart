import 'package:equatable/equatable.dart';

class BaseResponse extends Equatable {
  final int code;
  final String message;
  final dynamic data;

  BaseResponse({required this.code, required this.message, this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      code: json['code'],
      message: json['message'],
      data: json['data'],
    );
  }

  @override
  List<Object> get props => [code, message, data];
}
