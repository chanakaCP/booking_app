import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/Hotel/hotel_room.dart';
import '../../../repositories/my_booking_repository/my_booking_repo.dart';

part 'my_booking_event.dart';
part 'my_booking_state.dart';

class MyBookingBloc extends Bloc<MyBookingEvent, MyBookingState> {
  final MyBookingRepo _bookingRepo = MyBookingRepo();
  MyBookingBloc() : super(MyBookingLoading()) {
    on<GetMyBookingEvent>((event, emit) async {
      emit(MyBookingLoading());

      try {
        final hotelList = await _bookingRepo.getMyBookings();
        if (hotelList.isEmpty) {
          emit(const MyBookingEmptyState());
        } else {
          emit(MyBookingLoaded(hotelRoomList: hotelList));
        }
      } catch (e) {
        emit(MyBookingError(error: e.toString()));
      }
    });

    on<ReloadMyBookingEvent>((event, emit) async {
      emit(MyBookingLoading());
      try {
        final hotelList = await _bookingRepo.getMyBookings();
        if (hotelList.isEmpty) {
          emit(const MyBookingEmptyState());
        } else {
          emit(MyBookingLoaded(hotelRoomList: hotelList));
        }
      } catch (e) {
        emit(MyBookingError(error: e.toString()));
      }
    });
  }
}
