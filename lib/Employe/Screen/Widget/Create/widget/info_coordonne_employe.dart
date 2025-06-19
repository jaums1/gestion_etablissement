import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:ecole/Configs/utils/Device/devices_utility.dart';
import 'package:ecole/Employe/Controller/employe_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/Coupe Ssection/coupe_section.dart';
import '../../../../../Configs/cammon/widgets/formulaire/form.dart';

class TInformationCoordonneeEmploye extends StatelessWidget {
  const TInformationCoordonneeEmploye({super.key});

  @override
  Widget build(BuildContext context) {
    final formulaire = TFormulaire();
    final controller = Get.find<TEmployeController>();
    return   FocusTraversalGroup(
      child: Column(
        children: [
          TCoupeSectionTitre(titre: "Coordonnées",),
              SizedBox(height: TSizes.spaceBtwItems,),
          TDeviceUtility.isMobileScreen(context)==true?
          SizedBox(child: Column(
            children: [
               formulaire.formulaireTextCheval(label: "Tel 1",iconPrefix: Iconsax.call,
               textEditingController:controller.variable.Telephone ,isphone: true
               ), 
               formulaire.formulaireTextCheval(label: "Tel 2",iconPrefix: Iconsax.call,
               textEditingController:controller.variable.Telephone2 ,isphone: true
               ),
            ],
          ))
           :
           SizedBox(child: Row(
                  children: [
              Expanded(child:  formulaire.formulaireTextCheval(label: "Tel 1",iconPrefix: Iconsax.call,
              textEditingController:controller.variable.Telephone ,isphone: true
              ),), 
              SizedBox(width: TSizes.spaceBtwItems,),
               Expanded(child:  formulaire.formulaireTextCheval(label: "Tel 2",iconPrefix: Iconsax.call,
               textEditingController:controller.variable.Telephone2 ,isphone: true
               ),)
               
                  ],
                )),
                  formulaire.formulaireTextCheval(label: "Email",iconPrefix: Iconsax.message,
               textEditingController:controller.variable.Email 
               ), 
               formulaire.formulaireTextCheval(label: "Adresse",iconPrefix: Iconsax.location,
               textEditingController:controller.variable.Adresse 
               ),
        ],
      ),
    );
  }
}

