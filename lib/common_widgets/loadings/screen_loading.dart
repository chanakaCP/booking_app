import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../containers/custom_container.dart';

class ScreenLoading {
  void startLoading(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.black45,
      context: context,
      builder: (context) {
        return const Center(
          child: CustomContainer(
            bgColor: white,
          ),
        );
      },
    );
  }

  void stopLoading(BuildContext context) {
    Navigator.of(context).pop();
  }
}
