import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../models/booking/booking.dart';
import '../../../repositories/booking_repository/booking_repo.dart';
import '../../../services/user_service.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepository bookingRepo = BookingRepository();

  BookingBloc() : super(BookingInitial("", "", "")) {
    String fromDate = DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 1)));
    String toDate = DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 2)));
    String pricePerNight = "";
    String totalPrice = "";

    on<OnBookingInitialEvent>((event, emit) {
      pricePerNight = event.pricePerNight;
      totalPrice = event.pricePerNight;
      emit(BookingInitial(fromDate, toDate, totalPrice));
    });

    on<OnFromDateChangeEvent>((event, emit) {
      fromDate = DateFormat('yyyy-MM-dd').format(event.pickedDate);
      if (toDate.isNotEmpty && DateTime.parse(fromDate).isAfter(DateTime.parse(toDate))) {
        toDate = "";
      }
      if (fromDate.isNotEmpty && toDate.isNotEmpty) {
        totalPrice = (DateTime.parse(toDate).difference(DateTime.parse(fromDate)).inDays * int.parse(pricePerNight)).toString();
      }
      emit(DateChanged(fromDate, toDate, totalPrice));
    });

    on<OnToDateChangeEvent>((event, emit) {
      toDate = DateFormat('yyyy-MM-dd').format(event.pickedDate);
      if (fromDate.isNotEmpty && toDate.isNotEmpty) {
        totalPrice = (DateTime.parse(toDate).difference(DateTime.parse(fromDate)).inDays * int.parse(pricePerNight)).toString();
      }
      emit(DateChanged(fromDate, toDate, totalPrice));
    });

    on<OnBookingStartEvent>((event, emit) async {
      emit(BookingLoading(fromDate, toDate, totalPrice));

      if (fromDate.isEmpty) {
        emit(BookingFailed(fromDate, toDate, totalPrice, errorMessage: "Please Select From Date"));
      } else if (toDate.isEmpty) {
        emit(BookingFailed(fromDate, toDate, totalPrice, errorMessage: "Please Select To Date"));
      } else {
        Booking booking = Booking(
          bookingId: "",
          from: DateTime.parse(fromDate),
          to: DateTime.parse(toDate),
          roomId: event.roomId,
          totalPrice: totalPrice,
          userId: userState.value.userId,
          userName: event.username,
        );

        try {
          await bookingRepo.saveBooking(booking);
          emit(BookingSuccessed(fromDate, toDate, totalPrice));
        } catch (e) {
          emit(BookingFailed(fromDate, toDate, totalPrice, errorMessage: e.toString()));
        }
      }
    });
  }
}
