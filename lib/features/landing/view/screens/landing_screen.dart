import 'package:flutter/material.dart';

import 'landing_screen_view.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);
  static Page<void> page() => const MaterialPage<void>(child: LandingScreen());

  @override
  Widget build(BuildContext context) {
    return LandingScreenView();
  }
}
