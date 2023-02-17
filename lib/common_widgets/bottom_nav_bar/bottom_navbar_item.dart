import 'package:flutter/material.dart';

import '../../styles/styles.dart';
import '../images/custom_image.dart';
import '../text/custom_text.dart';

class BottomNavbarItem extends StatelessWidget {
  final String title;
  final String icon;
  final String selectedIcon;
  final bool isSelected;

  const BottomNavbarItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.selectedIcon,
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
            imagePath: isSelected ? selectedIcon : icon,
            height: 20,
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
