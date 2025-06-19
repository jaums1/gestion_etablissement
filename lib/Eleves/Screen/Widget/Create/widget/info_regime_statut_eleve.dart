import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:ecole/Configs/utils/Device/devices_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/Coupe Ssection/coupe_section.dart';
import '../../../../../Configs/cammon/widgets/combo/combo.dart';
import '../../../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../../Controller/eleve_controller.dart';
import '../../../../Controller/eleve_function.dart';

class TInformationRegimeEleve extends StatelessWidget {
  const TInformationRegimeEleve({super.key});

  @override
  Widget build(BuildContext context) {
     final combo = TCombo();
       final formulaire = TFormulaire();
       final controller = Get.find<TEleveController>();
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
      child: Form(
        key: controller.variable.keyInfoStatut,
        child: Column(
          children: [
            TCoupeSectionTitre(titre: "Information Statut",),
                SizedBox(height: TSizes.spaceBtwItems,),
            TDeviceUtility.isMobileScreen(context)==true?
            SizedBox(child: Column(
              children: [
                  combo.comboTextChevale(
                   valeur: controller.variable.statut.text, 
                  hintText: "Statut",
                  sections:["Affecté(e)","Non Affecté(e)"],
                                   label: "Statut",onChanged:TEleveFunction().H_OnChangedStatut ), 
                SizedBox(height: TSizes.spaceBtwItems,),
                  combo.comboTextChevale(
                    valeur: controller.variable.regime.text,
                  hintText: "Régime",
                  sections:["Boursier","1/2 Boursier","Non Boursier "],
                                   label: "Régime",onChanged:TEleveFunction().H_OnChangedRegime), 
                  
              ],
            ))
             :
             SizedBox(child: Row(
                    children: [
                Expanded(child:  combo.comboTextChevale(
                  valeur: controller.variable.statut.text,
                  hintText: "Statut",
                  sections:["Affecté(e)","Non Affecté(e)"],
                 label: "Statut",onChanged:TEleveFunction().H_OnChangedStatut ),), 
                SizedBox(width: TSizes.spaceBtwItems,),
                  Expanded(child:  combo.comboTextChevale(
                    valeur: controller.variable.regime.text,
                  hintText: "Régime",
                  sections:["Boursier","1/2 Boursier","Non Boursier "],
                 label: "Régime",onChanged:TEleveFunction().H_OnChangedRegime ),), 
                 
                    ],
                  )),
              SizedBox(height: TSizes.spaceBtwItems,),  
              TCoupeSectionTitre(titre: "Information Adresse",),
                SizedBox(height: TSizes.spaceBtwItems,),
              formulaire.formulaireTextCheval(label: "Adresse",iconPrefix: Iconsax.location,
              textEditingController: controller.variable.adresse
              ),
          ],
        ),
      ),
    );
  }
}

