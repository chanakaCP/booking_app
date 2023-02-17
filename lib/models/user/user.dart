import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String userId;

  const AppUser({
    required this.userId,
  });

  static const empty = AppUser(userId: "");

  @override
  List<Object> get props => [userId];
}
