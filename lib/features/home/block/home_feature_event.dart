import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class HomeFeatureEvent extends Equatable {
  const HomeFeatureEvent();
}

class LoadHomeFeatureEvent extends HomeFeatureEvent {
  @override
  List<Object?> get props => [];
}

class ReloadHomeFeatureEvent extends HomeFeatureEvent {
  @override
  List<Object?> get props => [];
}
