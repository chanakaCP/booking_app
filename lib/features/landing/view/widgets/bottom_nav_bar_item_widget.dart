import 'package:flutter/material.dart';

import '../../../../common_widgets/images/custom_image.dart';
import '../../../../common_widgets/text/custom_text.dart';
import '../../../../styles/app_colors.dart';
import '../../../../styles/font_styles.dart';

class BottomNavBarItemWidget extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;

  const BottomNavBarItemWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImage(
            imagePath: icon,
            height: 20,
            iconColor: isSelected ? orange : gray,
          ),
          const SizedBox(height: 5),
          CustomText(
            text: title,
            containerAlignment: Alignment.center,
            textStyle: bottomNavbarFontStyle(fontColor: isSelected ? orange : gray),
          )
        ],
      ),
    );
  }
}
