
import 'package:ecole/Code_Projet/Controller/code_projet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/routes/route.dart';
import '../../../../../Configs/utils/Constant/colors.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Configs/utils/Constant/texte_string.dart';

class TCodeEtablissementForm extends StatelessWidget {
   TCodeEtablissementForm({super.key});

  @override
  final code = TextEditingController();
  Widget build(BuildContext context) {
    final controller = Get.put(TCodeProjetController());
    return  Form(
              child: Padding(padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
               child: Column(
                children: [
                  ////FORMULAIRE
                  TextFormField(
                    controller:code ,
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
          child:ElevatedButton(onPressed: (){
            //  controller.H_RecupeData(param:code.text );
            Get.toNamed(TRoutes.register);
            }, child:  Text("Valider code",style:const TextStyle(
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