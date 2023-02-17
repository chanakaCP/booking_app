import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/onboarding/view/screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Hotel Room Booking App",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: LandingScreen(),
    );
  }
}
