
// import 'package:ecommerce/cammon/widgets/containers/rounded_container.dart';
// import 'package:ecommerce/cammon/widgets/images/t_circular_images.dart';
// import 'package:ecommerce/cammon/widgets/texts/t_brand_title_text_with_verified_icon.dart';
// import 'package:ecommerce/utils/Constant/colors.dart';
// import 'package:ecommerce/utils/Constant/enums.dart';
// import 'package:ecommerce/utils/Constant/image_string.dart';
// import 'package:ecommerce/utils/Constant/sizes.dart';
// import 'package:flutter/material.dart';

// class TBrandCard extends StatelessWidget {
//   const TBrandCard({
//     super.key, required this.showBorder, this.onTap,
//   });
//  final bool showBorder;
//  final void Function() ? onTap;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//     onTap: onTap,
//     child: TRoundedContainer(
//       padding: const EdgeInsets.all(TSizes.sm),
//       showBorder: showBorder,
//       borderColor: TColors.grey,
//       backgroundColor: Colors.transparent,
//       child: Row(
//         children: [
//           //// ICON
//          const Flexible(child: TCircularImage(image: TImages.google,backgroundColor: Colors.transparent,isNetworkImage: false,)),
//          const SizedBox(height: TSizes.spaceBtwItems / 2),
    
//          //// -- TEXT
//          Expanded(
//            child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
              
//               const TBrandTitleTextWithVerifiedIcon(title: "Nike",brandTextSize: TextSizes.large,),
//               const SizedBox(height: TSizes.spaceBtwItems / 4),
//               Text("26 products",overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.labelMedium,)
//             ],
//            ),
//          )
//         ],
//       ),
//     ),
//                   );
//   }
// }
