import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common_widgets/containers/custom_container.dart';
import '../../../../models/Hotel/hotel_room.dart';
import '../../../booking/view/booking_screen.dart';
import '../../block/home_feature.dart';
import '../widgets/widgets.dart';

class HomeScreenView extends StatelessWidget {
  final List<HotelRoom> roomList;

  HomeScreenView({
    Key? key,
    required this.roomList,
  }) : super(key: key);

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: () {
        BlocProvider.of<HomeFeatureBlock>(context).add(ReloadHomeFeatureEvent());
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
              return GestureDetector(
                child: HotelCardWidget(room: roomList[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingScreen(room: roomList[index]),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
