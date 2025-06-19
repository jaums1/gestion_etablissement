import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:ecole/Configs/utils/Device/devices_utility.dart';
import 'package:ecole/Eleves/Controller/eleve_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/Coupe Ssection/coupe_section.dart';
import '../../../../../Configs/cammon/widgets/formulaire/form.dart';

class TInformationContactEleve extends StatelessWidget {
  const TInformationContactEleve({super.key});

  @override
  Widget build(BuildContext context) {
    final formulaire = TFormulaire();
    final controller = Get.find<TEleveController>();
    return   Column(
      children: [
        TCoupeSectionTitre(titre: "Information Contact",),
            SizedBox(height: TSizes.spaceBtwItems,),
        TDeviceUtility.isMobileScreen(context)==true?
        SizedBox(child: Column(
          children: [
             formulaire.formulaireTextCheval(label: "Tel 1",iconPrefix: Iconsax.call,
             textEditingController:controller.variable.phoneEleve1 ,isphone: true
             ), 
             SizedBox(height: TSizes.spaceBtwItems,),
             formulaire.formulaireTextCheval(label: "Tel 2",iconPrefix: Iconsax.call,
             textEditingController:controller.variable.phoneEleve2 ,isphone: true
             ),
          ],
        ))
         :
         SizedBox(child: Row(
                children: [
            Expanded(child:  formulaire.formulaireTextCheval(label: "Tel 1",iconPrefix: Iconsax.call,
            textEditingController:controller.variable.phoneEleve1 ,isphone: true
            ),), 
            SizedBox(width: TSizes.spaceBtwItems,),
             Expanded(child:  formulaire.formulaireTextCheval(label: "Tel 2",iconPrefix: Iconsax.call,
             textEditingController:controller.variable.phoneEleve2 ,isphone: true
             ),)
             
                ],
              ))
      ],
    );
  }
}

