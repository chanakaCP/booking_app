import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/auth_repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository = AuthRepository();

  LoginBloc() : super(LoginInitialState()) {
    on<UserAnnonLoginEvent>((event, emit) async {
      emit(LoginInProgressState());
      try {
        await authRepository.anonymousLogin();
        emit(LoginSuccessState());
      } catch (e) {
        emit(LoginFailedState(errorMessage: e.toString()));
      }
    });
  }
}
