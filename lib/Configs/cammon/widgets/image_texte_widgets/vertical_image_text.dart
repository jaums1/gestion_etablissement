
// import 'package:ecommerce/utils/Constant/colors.dart';
// import 'package:ecommerce/utils/Constant/helper_function.dart';
// import 'package:ecommerce/utils/Constant/sizes.dart';
// import 'package:flutter/material.dart';

// class TVerticalImageTexte extends StatelessWidget {
//   const TVerticalImageTexte({
//     super.key, required this.image, required this.title,  this.textColor=TColors.white, this.backgroundColor, this.onTap,
//   });
// final String image,title;
// final Color textColor;
// final Color? backgroundColor;
// final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     final dark=THelperFunction.isDarkMode(context);
//     return GestureDetector(
//       onTap: onTap,
//       child:  Padding(
//               padding: const EdgeInsets.only(right: TSizes.defaultSpace),
//               child: Column(
//                children: [
//                  //// ICON
//                  Container(
//                    width: 56,
//                    height: 56,
//                    padding: const EdgeInsets.all(TSizes.sm),
//                    decoration:  BoxDecoration(
//                      color: backgroundColor ?? (dark ? TColors.black:TColors.white),
//                      borderRadius:BorderRadius.circular(100)
//                    ),
//                    child:  Center(
//                      child: Image(image: AssetImage(image),fit: BoxFit.cover,color:dark? TColors.light : TColors.dark,),
//                    ),
//                  ),
              
//                  ////// TEXTE
//                  const SizedBox(height: TSizes.spaceBtwItems/2,),
//                  Text(title,style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
//                  maxLines: 1,
//                  overflow: TextOverflow.ellipsis,
//                  )
//                ],
//               ),
//             )
//            );
//   }
// }