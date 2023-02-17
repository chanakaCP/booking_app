// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();
}

class OnBookingInitialEvent extends BookingEvent {
  String pricePerNight;
  OnBookingInitialEvent({
    required this.pricePerNight,
  });
  @override
  List<Object?> get props => [pricePerNight];
}

class OnFromDateChangeEvent extends BookingEvent {
  DateTime pickedDate;
  OnFromDateChangeEvent({
    required this.pickedDate,
  });

  @override
  List<Object?> get props => [pickedDate];
}

class OnToDateChangeEvent extends BookingEvent {
  DateTime pickedDate;
  OnToDateChangeEvent({
    required this.pickedDate,
  });
  @override
  List<Object?> get props => [pickedDate];
}

class OnBookingStartEvent extends BookingEvent {
  String username;
  String roomId;
  OnBookingStartEvent({
    required this.username,
    required this.roomId,
  });
  @override
  List<Object?> get props => [
        username,
        roomId,
      ];
}
