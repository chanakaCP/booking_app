import 'package:equatable/equatable.dart';

class BottomNavState extends Equatable {
  final int index;
  final String appbarTitle;

  const BottomNavState({
    required this.index,
    required this.appbarTitle,
  });

  @override
  List<Object?> get props => [
        index,
        appbarTitle,
      ];
}
