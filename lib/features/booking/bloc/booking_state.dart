part of 'booking_bloc.dart';

abstract class BookingState extends Equatable {
  String fromDate;
  String toDate;
  String totalPrice;
  BookingState(this.fromDate, this.toDate, this.totalPrice);

  @override
  List<Object> get props => [fromDate, toDate, totalPrice];
}

class BookingInitial extends BookingState {
  BookingInitial(super.fromDate, super.toDate, super.totalPrice);
}

class BookingLoading extends BookingState {
  BookingLoading(super.fromDate, super.toDate, super.totalPrice);
}

class BookingSuccessed extends BookingState {
  BookingSuccessed(super.fromDate, super.toDate, super.totalPrice);
}

class BookingFailed extends BookingState {
  String errorMessage;
  BookingFailed(super.fromDate, super.toDate, super.totalPrice, {required this.errorMessage});
}

class DateChanged extends BookingState {
  DateChanged(super.fromDate, super.toDate, super.totalPrice);
}
