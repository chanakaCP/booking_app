import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../models/Hotel/hotel_room.dart';

@immutable
abstract class HomeFeatureState extends Equatable {}

// Data Loading state
class HomeFeatureLoadingState extends HomeFeatureState {
  @override
  List<Object?> get props => [];
}

// Data Loaded state
class HomeFeatureLoadedState extends HomeFeatureState {
  HomeFeatureLoadedState(this.hotelRoomList);
  final List<HotelRoom> hotelRoomList;

  @override
  List<Object?> get props => [hotelRoomList];
}

// Data Empty state
class HomeFeatureEmptyState extends HomeFeatureState {
  HomeFeatureEmptyState();

  @override
  List<Object?> get props => [];
}

// On error State
class HomeFeatureErrorState extends HomeFeatureState {
  final String errorMessage;
  HomeFeatureErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
