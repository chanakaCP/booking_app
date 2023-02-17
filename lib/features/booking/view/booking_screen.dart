// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:assignment_app/features/booking/bloc/booking_bloc.dart';
import 'package:assignment_app/models/Hotel/hotel_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'booking_screen_view.dart';

class BookingScreen extends StatelessWidget {
  final HotelRoom room;
  const BookingScreen({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingBloc()..add(OnBookingInitialEvent(pricePerNight: room.price)),
      child: BookingScreenView(room: room),
    );
  }
}
