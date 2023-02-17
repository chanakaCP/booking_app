import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../common_widgets/containers/custom_container.dart';
import '../../../../styles/app_colors.dart';
import '../../../../utils/extentions/border_radius_ex.dart';

class HotelLoadingWidget extends StatelessWidget {
  const HotelLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomContainer(
        marginTop: 25,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => CustomContainer(
            margin: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 15),
            bgColor: transparent,
            child: SkeletonItem(
              child: SkeletonAvatar(
                style: SkeletonAvatarStyle(
                  width: double.infinity,
                  height: 175,
                  borderRadius: 10.fullRadius,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
