import 'package:amikompedia_app/domain/usecases/auth_usecase.dart';
import 'package:amikompedia_app/presentation/bloc/login_bloc/login_event.dart';
import 'package:amikompedia_app/presentation/bloc/login_bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUsecase _usecase;
  LoginBloc(this._usecase) : super(const LoginState()) {
    on<OnLogin>(_onLogin);
  }

  Future<void> _onLogin(OnLogin event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));
    final result = await _usecase.login(event.email, event.password);
    result.fold(
      (failure) => emit(state.copyWith(
        status: LoginStatus.failure,
        message: failure.message,
      )),
      (loginEntity) => emit(state.copyWith(
        status: LoginStatus.success,
        loginEntity: loginEntity,
      )),
    );
  }
}
