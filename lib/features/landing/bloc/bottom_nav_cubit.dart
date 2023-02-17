import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/stirng_const.dart';
import 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  String appbarTitle = appbarHome;

  BottomNavCubit()
      : super(const BottomNavState(
          index: 0,
          appbarTitle: appbarHome,
        ));

  void getNavBarItem(int index) {
    setAppbarTitle(index);
    emit(BottomNavState(index: index, appbarTitle: appbarTitle));
  }

  setAppbarTitle(int index) {
    switch (index) {
      case 0:
        appbarTitle = appbarHome;
        break;
      case 1:
        appbarTitle = appbarMyBookings;
        break;
      case 2:
        appbarTitle = appbarMenu;
        break;
      default:
        appbarTitle = "";
        break;
    }
  }
}
