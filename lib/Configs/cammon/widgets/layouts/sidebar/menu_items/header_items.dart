import 'package:flutter/material.dart';

import '../../../../../utils/Constant/image_string.dart';
import '../../../../../utils/Constant/sizes.dart';

class THeaderItems extends StatelessWidget {
  const THeaderItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(TImages.appLogo,width: 80,height: 80,),
         SizedBox(height: TSizes.spaceBtwItems,),
          Padding(padding: const EdgeInsets.symmetric(horizontal:  4.0),
                 child: Text("LYCEE MUNICIPAL DE ZOUAN-HOUNIEN",textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  letterSpacing: 1.2,fontWeight : FontWeight.w600,color: Colors.orange.withValues(alpha: 0.7)
                               ),),
               ) ,
      ],
    );
  }
}