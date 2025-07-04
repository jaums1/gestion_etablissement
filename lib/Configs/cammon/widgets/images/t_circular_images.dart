import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:flutter/material.dart';
import '../../../utils/Constant/colors.dart';
import '../../../utils/Constant/helper_function.dart';
import '../../../utils/Constant/sizes.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.imageType = ImageType.asset,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final ImageType imageType;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor ?? (dark ? TColors.black : TColors.white),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Image(
          fit: fit,
          image: imageType == ImageType.network
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          color: dark ? TColors.white : TColors.black,
        ),
      ),
    );
  }
}
