import 'package:equatable/equatable.dart';

class BaseResponse<T> extends Equatable {
  final int code;
  final String status;
  final T data;

  BaseResponse({required this.code, required this.status, required this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonData) {
    return BaseResponse(
      code: json['code'],
      status: json['status'],
      data: fromJsonData(json['data']),
    );
  }

  @override
  List<Object?> get props => [code, status, data];
}
