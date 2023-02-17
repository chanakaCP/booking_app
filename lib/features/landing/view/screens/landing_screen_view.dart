import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common_widgets/app_bars/common_app_bar.dart';
import '../../../../common_widgets/bottom_nav_bar/bottom_navbar_item.dart';
import '../../../../repositories/home_repository/home_feature_repository.dart';
import '../../../../styles/styles.dart';
import '../../../../utils/constants/asset_const.dart';
import '../../../home/view/screens/home_screen.dart';
import '../../../menu/view/menu_screen.dart';
import '../../../my_booking/view/my_booking_screen.dart';
import '../../bloc/bottom_nav_cubit.dart';
import '../../bloc/bottom_nav_state.dart';

class LandingScreenView extends StatefulWidget {
  LandingScreenView({super.key});

  @override
  State<LandingScreenView> createState() => _LandingScreenViewState();
}

class _LandingScreenViewState extends State<LandingScreenView> {
  final List<Widget> navbarBody = const [
    HomeScreen(),
    MyBookingScreen(),
    MenuScreen(),
  ];

  int _currentnavBarBody = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavCubit>(
        create: (context) => BottomNavCubit(),
        child: BlocBuilder<BottomNavCubit, BottomNavState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: white,
              appBar: CommonAppBar(title: BlocProvider.of<BottomNavCubit>(context).appbarTitle),
              bottomNavigationBar: BottomNavigationBar(
                elevation: 15,
                currentIndex: state.index,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                type: BottomNavigationBarType.fixed,
                backgroundColor: white,
                onTap: (index) {
                  BlocProvider.of<BottomNavCubit>(context).getNavBarItem(index);
                  setState(() => _currentnavBarBody = index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: BottomNavbarItem(
                      icon: findBlackIcon,
                      selectedIcon: findColorIcon,
                      isSelected: (state.index == 0),
                      title: 'Home',
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: BottomNavbarItem(
                      icon: bookingBlackIcon,
                      selectedIcon: bookingColorIcon,
                      isSelected: (state.index == 1),
                      title: 'My Bookings',
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: BottomNavbarItem(
                      icon: menuBlackIcon,
                      selectedIcon: menuColorIcon,
                      isSelected: (state.index == 4),
                      title: 'Menu',
                    ),
                    label: '',
                  ),
                ],
              ),
              body: BlocBuilder<BottomNavCubit, BottomNavState>(
                builder: (context, state) {
                  return RepositoryProvider(
                    create: (context) => HomeFeatureRepository(),
                    child: navbarBody[_currentnavBarBody],
                  );
                },
              ),
            );
          },
        ));
  }
}
