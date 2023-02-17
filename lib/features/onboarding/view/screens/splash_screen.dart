import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../common_widgets/images/custom_image.dart';
import '../../../../repositories/auth_repository/auth_repository.dart';
import '../../../../styles/app_colors.dart';
import '../../../../utils/constants/asset_const.dart';
import '../../../landing/view/screens/landing_screen.dart';
import '../../../login/view/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double? _width;
  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    _onInitAnimations();
    _serTimer();
  }

  _onInitAnimations() {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _width = MediaQuery.of(context).size.width - 150;
        _opacity = 1;
      });
    });
  }

  _serTimer() async {
    Timer(const Duration(seconds: 3), () async {
      bool isLoggedIn = await AuthRepository().isLoggedIn();
      if (isLoggedIn) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LandingScreen(),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gray,
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 3),
          width: _width ?? MediaQuery.of(context).size.width - 20,
          child: AnimatedOpacity(
            duration: const Duration(seconds: 3),
            opacity: _opacity,
            child: const CustomImage(
              imagePath: logo,
            ),
          ),
        ),
      ),
    );
  }
}
