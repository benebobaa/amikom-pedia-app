import 'package:amikompedia_app/domain/entities/login_entity.dart';
import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final LoginStatus? status;
  final String? message;
  final LoginEntity? loginEntity;

  const LoginState({
    this.status = LoginStatus.initial,
    this.message,
    this.loginEntity,
  });

  @override
  List<Object?> get props => [status, message, loginEntity];

  LoginState copyWith({
    LoginStatus? status,
    String? message,
    LoginEntity? loginEntity,
  }) {
    return LoginState(
      status: status ?? this.status,
      message: message ?? this.message,
      loginEntity: loginEntity ?? this.loginEntity,
    );
  }
}
