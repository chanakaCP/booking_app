import 'package:flutter/material.dart';

import '../../../../common_widgets/text/custom_text.dart';
import '../../../../styles/font_styles.dart';
import '../../../../utils/extentions/paddings_and_margins_ex.dart';

class HotelEmptyWidget extends StatelessWidget {
  const HotelEmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: "Sorry !",
            textAlign: TextAlign.center,
            containerAlignment: Alignment.center,
            margin: 25.horizontal,
            textStyle: customFontStyle(
              fontSize: 22,
              fontHeight: 26,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          CustomText(
            text: "We are unable to find any hotels",
            textAlign: TextAlign.center,
            containerAlignment: Alignment.center,
            margin: 25.horizontal,
            textStyle: customFontStyle(
              fontSize: 18,
              fontHeight: 22,
            ),
          ),
        ],
      ),
    );
  }
}
