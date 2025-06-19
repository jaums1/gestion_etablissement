
// import 'package:ecommerce/cammon/widgets/containers/rounded_container.dart';
// import 'package:ecommerce/cammon/widgets/brands/t_brand_card.dart';
// import 'package:ecommerce/utils/Constant/colors.dart';
// import 'package:ecommerce/utils/Constant/helper_function.dart';
// import 'package:ecommerce/utils/Constant/sizes.dart';
// import 'package:flutter/material.dart';

// class TBrandShowCase extends StatelessWidget {
//   const TBrandShowCase({super.key, required this.images,});

//   final List<String> images;

//   @override
//   Widget build(BuildContext context) {

//     return TRoundedContainer(
//       showBorder: true,
//       borderColor: TColors.darkGrey,
//       backgroundColor: Colors.transparent,
//       padding:const EdgeInsets.all(TSizes.md) ,
//       margin:const EdgeInsets.all(TSizes.spaceBtwItems),
//       child: Column(
//         children: [
//           //// Brands
//          const TBrandCard(showBorder: false,),
    
//           ///Brands 3 top products
//         Row( children: images.map((image)=> brandTopProductsImageWidget(image, context)).toList()),
      
//         ],
//       ),
//     );
//   }

//   Widget brandTopProductsImageWidget(String image,context){
//      final dark = THelperFunction.isDarkMode(context);
//     return Expanded(
//             child: TRoundedContainer(
//              height: 100,
//              backgroundColor: dark ? TColors.darkGrey : TColors.light,
//              margin: const EdgeInsets.only(right: TSizes.sm),
//              padding: const EdgeInsets.all( TSizes.md),
//              child:  Image(image: AssetImage(image),fit: BoxFit.cover,),
//              ),
//           ) ;
//   }
// }
