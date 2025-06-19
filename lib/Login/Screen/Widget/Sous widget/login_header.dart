
import 'package:flutter/material.dart';

import '../../../../Configs/utils/Constant/image_string.dart';
import '../../../../Configs/utils/Constant/sizes.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({super.key, this.titre, this.soustitre});
  final String? titre;
  final String? soustitre;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /////IMAGE DE LOGO APP
          Image.asset(TImages.appLogo,width: 100,height: 100,),
          /////SPACE ENTRE IMAGE ET TITRE = 16
          
          titre==""?Container(): SizedBox(height: TSizes.spaceBtwItems,),
          ///// TITRE 
          titre==""?Container():Text(titre!,style: Theme.of(context).textTheme.headlineMedium,),
           /////SPACE ENTRE TITRE ET SOUS-TITRE = 8
          soustitre==""?Container(): SizedBox(height: TSizes.sm,),
          ///// SOUS TITRE
           soustitre==""?Container():Text(soustitre!,style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
    );
  }
}