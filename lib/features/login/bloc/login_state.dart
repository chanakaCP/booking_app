part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginInProgressState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginFailedState extends LoginState {
  LoginFailedState({required this.errorMessage});
  String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
