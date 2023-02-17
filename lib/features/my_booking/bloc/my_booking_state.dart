// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'my_booking_bloc.dart';

abstract class MyBookingState extends Equatable {
  const MyBookingState();
}

class MyBookingLoading extends MyBookingState {
  @override
  List<Object?> get props => [];
}

class MyBookingLoaded extends MyBookingState {
  final List<HotelRoom> hotelRoomList;
  const MyBookingLoaded({
    required this.hotelRoomList,
  });

  @override
  List<Object?> get props => [hotelRoomList];
}

class MyBookingError extends MyBookingState {
  final String error;
  const MyBookingError({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}

class MyBookingEmptyState extends MyBookingState {
  const MyBookingEmptyState();
  @override
  List<Object?> get props => [];
}
