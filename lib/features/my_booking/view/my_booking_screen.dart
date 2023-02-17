import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/view/widgets/hotel_error_widget.dart';
import '../../home/view/widgets/hotel_loading_widget.dart';
import '../bloc/my_booking_bloc.dart';
import 'my_booking_screen_view.dart';
import 'widgets/my_booking_empty_widget.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyBookingBloc()..add(GetMyBookingEvent()),
      child: BlocBuilder<MyBookingBloc, MyBookingState>(
        builder: (context, state) {
          if (state is MyBookingLoading) {
            return const HotelLoadingWidget();
          } else if (state is MyBookingError) {
            return const HotelErrorWidget();
          } else if (state is MyBookingEmptyState) {
            return const MyBookingemptyWidget();
          } else if (state is MyBookingLoaded) {
            return MyBookingScreenView(roomList: state.hotelRoomList);
          } else {
            return const HotelErrorWidget();
          }
        },
      ),
    );
  }
}
