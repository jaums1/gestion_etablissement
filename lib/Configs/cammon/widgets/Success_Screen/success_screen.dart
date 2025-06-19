// import 'package:ecommerce/cammon/styles/spacing_style.dart';
// import 'package:ecommerce/utils/Constant/helper_function.dart';
// import 'package:ecommerce/utils/Constant/sizes.dart';
// import 'package:ecommerce/utils/Constant/texte_string.dart';
// import 'package:flutter/material.dart';




// class SuccessScreen extends StatelessWidget {
//   const SuccessScreen({super.key, required this.title, required this.subTitle, required this.image, this.onPressed});
// final String title,subTitle,image;
// final VoidCallback? onPressed;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(padding: TSpacingStyle.paddingWithAppBarHeight*2,
//         child: Column(
//           children: [
//              ///// IMAGE
//            Align(alignment: Alignment.center,child: Image(image: AssetImage(image),width: THelperFunction.screenWidth()*0.6,)),
//            const SizedBox(height: TSizes.spaceBtwSections,),
//            //// TITLE
//             Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
//             const SizedBox(height: TSizes.spaceBtwItems,),
//             Text(subTitle,style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
            
//              const SizedBox(height: TSizes.spaceBtwSections,),

//               ////// BOUTTON 
//              SizedBox(width: double.infinity,child:ElevatedButton(onPressed: onPressed,child:const Text(TText.tContinue),) ,),
//              const SizedBox(height: TSizes.spaceBtwItems,),

//           ],
//         ),
//         ),
//       ),
//     );
//   }
// }