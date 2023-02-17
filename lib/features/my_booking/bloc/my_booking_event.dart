part of 'my_booking_bloc.dart';

abstract class MyBookingEvent extends Equatable {
  const MyBookingEvent();
}

class GetMyBookingEvent extends MyBookingEvent {
  @override
  List<Object?> get props => [];
}

class ReloadMyBookingEvent extends MyBookingEvent {
  @override
  List<Object?> get props => [];
}
