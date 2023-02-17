import 'package:flutter/material.dart';

import '../../../../common_widgets/containers/custom_container.dart';
import '../../../../common_widgets/images/custom_netword_image.dart';
import '../../../../common_widgets/text/custom_text.dart';
import '../../../../models/Hotel/hotel_room.dart';
import '../../../../styles/styles.dart';
import '../../../../utils/extentions/border_radius_ex.dart';

class HotelCardWidget extends StatelessWidget {
  final HotelRoom room;
  const HotelCardWidget({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 15),
      borderRadius: 10.fullRadius,
      width: double.infinity,
      bgColor: cardColor,
      height: 175,
      child: Row(
        children: [
          CustomNetwordImage(
            imagePath: room.image,
            height: 175,
            width: (MediaQuery.of(context).size.width - 25) * 0.375,
            borderRadius: 10.leftRadius,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: CustomContainer(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              height: 135,
              alignment: Alignment.centerLeft,
              child: room.features.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: room.features.length > 5 ? 5 : room.features.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 7.5),
                          child: Row(
                            children: [
                              CustomContainer(
                                height: 7.5,
                                width: 7.5,
                                borderRadius: 50.fullRadius,
                                bgColor: black,
                              ),
                              Expanded(
                                child: CustomText(
                                  text: room.features[index],
                                  textAlign: TextAlign.left,
                                  containerAlignment: Alignment.centerLeft,
                                  marginLeft: 5,
                                  textStyle: customFontStyle(
                                    fontHeight: 13,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                  : CustomText(
                      text: "Sorry! we couldn't find any details about this hotel",
                      containerAlignment: Alignment.center,
                      textAlign: TextAlign.center,
                      textStyle: customFontStyle(
                        fontSize: 14,
                        fontHeight: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
