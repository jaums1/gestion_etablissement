
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/routes/route.dart';
import '../../../../../Configs/utils/Constant/colors.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Configs/utils/Constant/texte_string.dart';

class TCodeEtablissementForm extends StatelessWidget {
  const TCodeEtablissementForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Form(
              child: Padding(padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
               child: Column(
                children: [
                  ////FORMULAIRE
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Iconsax.code),
                      labelText: TText.codeEtatblissement
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwInputfields/2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     Expanded(child: Align(alignment: Alignment.centerRight,child: TextButton(onPressed: ()=>Get.back(), child: Text("J'ai déjà mon code!",style: Theme.of(context).textTheme.bodyMedium,)))),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections,),
                    //// VALIDER
         SizedBox(
          width: double.infinity,
          child:ElevatedButton(onPressed: ()=>Get.toNamed(TRoutes.register), child:  Text("Valider code",style:const TextStyle(
            color: TColors.white,fontFamily: TText.fontFamilyPrimary,
          ) ),
          
          ) ,
         ),
                ],
               ),
              ),
            );
  }
}