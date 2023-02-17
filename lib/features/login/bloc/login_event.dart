part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class UserAnnonLoginEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}
