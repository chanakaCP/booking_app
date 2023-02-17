import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../../utils/extentions/border_radius_ex.dart';
import '../../utils/extentions/paddings_and_margins_ex.dart';
import '../containers/custom_container.dart';

class CustomNetwordImage extends StatelessWidget {
  final String imagePath;
  final BoxFit? fit;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;
  final double marginTop;
  final double? height;
  final double? width;
  final BoxShape? shape;
  final List<BoxShadow>? boxShadow;
  final Color bgColor;
  final Color? iconColor;
  final Alignment alignment;
  final Gradient? containerGradient;
  final Gradient? iconGradient;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;
  final bool isProgressSmall;
  final Color borderColor;
  final double bordersize;
  const CustomNetwordImage({
    Key? key,
    required this.imagePath,
    this.fit,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    this.marginTop = 0,
    this.height,
    this.width,
    this.shape,
    this.boxShadow,
    this.bgColor = transparent,
    this.iconColor,
    this.alignment = Alignment.center,
    this.containerGradient,
    this.iconGradient,
    this.borderRadius,
    this.margin,
    this.isProgressSmall = false,
    this.borderColor = gray,
    this.bordersize = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      bgColor: borderColor,
      padding: bordersize.all,
      borderRadius: borderRadius,
      child: ClipRRect(
        borderRadius: borderRadius ?? 0.fullRadius,
        child: CachedNetworkImage(
          imageUrl: imagePath,
          alignment: alignment,
          fit: fit,
          color: iconColor,
          height: height,
          width: width,
          placeholder: (context, url) => SizedBox(
            child: Center(
              child: SizedBox(
                height: isProgressSmall ? 40 : 70,
                width: isProgressSmall ? 40 : 70,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: gray,
            height: height,
            width: width,
            child: const SizedBox(
              width: 20,
              height: 20,
              child: Icon(
                Icons.broken_image_outlined,
                color: black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
