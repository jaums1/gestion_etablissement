
// import 'package:ecommerce/utils/Constant/sizes.dart';
// import 'package:flutter/material.dart';

// class TGridLayout extends StatelessWidget {
//   const TGridLayout({super.key, required this.itemCount, this.mainAxisExtent = 270, required this.itemBuilder});
//    final int itemCount;
//    final double? mainAxisExtent;
//    final Widget? Function(BuildContext, int) itemBuilder;
//   @override
//   Widget build(BuildContext context) {
//     return  GridView.builder(
//           itemCount: itemCount ,
//           shrinkWrap: true,
//           padding:  EdgeInsets.zero,
//           physics: const NeverScrollableScrollPhysics(),
//           gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: TSizes.gridViewSpacing,
//           mainAxisExtent: mainAxisExtent,
//           crossAxisSpacing: TSizes.gridViewSpacing
//           ), 
//         itemBuilder: itemBuilder ,
//           );
//   }
// }