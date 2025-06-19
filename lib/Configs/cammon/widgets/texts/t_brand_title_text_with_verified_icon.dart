
// import 'package:flutter/material.dart';

// import 'package:iconsax/iconsax.dart';
// import '../../../utils/Constant/colors.dart';
// import '../../../utils/Constant/enums.dart';
// import '../../../utils/Constant/sizes.dart';

// class TBrandTitleTextWithVerifiedIcon extends StatelessWidget {
//   const TBrandTitleTextWithVerifiedIcon({super.key, required this.title, this.maxLines = 1,
//    this.textColor,
//     this.iconColor = TColors.primary,
//     this.textAlign = TextAlign.center,
//     this.brandTextSize = TextSizes.small});
  
//   final String title;
//   final int maxLines;
//   final Color? textColor, iconColor;
//   final TextAlign? textAlign;
//   final TextSizes brandTextSize;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//        Flexible(child: TBrandTitleText(
//         title: title,
//         color: textColor,
//         maxLines: maxLines,
//         textAlign: textAlign,
//         brandTextSize: brandTextSize,
//        )),
//        const SizedBox(height: TSizes.xs,),
//        Icon(Iconsax.verify5,color: iconColor,size: TSizes.iconXs,)
//       ],
//     );
//   }
// }