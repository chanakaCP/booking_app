import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common_widgets/containers/custom_container.dart';
import '../../../models/Hotel/hotel_room.dart';
import '../../home/view/widgets/hotel_card_widget.dart';
import '../bloc/my_booking_bloc.dart';

class MyBookingScreenView extends StatelessWidget {
  final List<HotelRoom> roomList;
  MyBookingScreenView({
    Key? key,
    required this.roomList,
  }) : super(key: key);
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: () {
        BlocProvider.of<MyBookingBloc>(context).add(ReloadMyBookingEvent());
        _refreshController.refreshCompleted();
      },
      child: SingleChildScrollView(
        child: CustomContainer(
          marginTop: 25,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: roomList.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return HotelCardWidget(room: roomList[index]);
            },
          ),
        ),
      ),
    );
  }
}
