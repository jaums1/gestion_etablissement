

import 'package:ecole/Configs/cammon/widgets/combo/combo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../Configs/utils/Constant/colors.dart';
import '../../../Configs/utils/Constant/sizes.dart';
import '../../../Configs/utils/Constant/texte_string.dart';
import '../../Controller/etablissement_controller.dart';

class TSituationGeographiqueEtablissement extends StatelessWidget {
  const TSituationGeographiqueEtablissement({super.key});

  @override
  Widget build(BuildContext context) {
    final controlSelect  = TCombo();
    final controllerForm = TFormulaire();
     final controller     = Get.put(TEtablissementController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.md),
      child: Container(
        decoration: BoxDecoration(color: Colors.white,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///// TITRE DU CARDER
            Padding(padding: EdgeInsets.only(left: TSizes.sm,top: TSizes.sm,bottom: TSizes.md),
            child:Text("Situation Géographique",style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: TColors.darkerGrey),),
            ),
            Padding(
              padding: EdgeInsets.only(left: TSizes.md,right: TSizes.md,bottom:TSizes.sm ),
              child: Row(children: [
               
                 
                 Obx(
                   ()=> Expanded(
                    flex: 2,
                    child: controlSelect.comboTextChevale(
                      label: TText.pays,valeur: controller.selectPays.value,
                      sections: TText.listPays,onChanged: controller.onSelectPays
                    ) ),
                 ),
                 
                 SizedBox(width: 6,),
                 Expanded(flex: 2,
                 child:controllerForm.formulaireTextCheval(
                iconPrefix:Iconsax.password_check,label:TText.ville,
                 textEditingController: controller.ville
              ) ),
              ],),
            ),
            // SizedBox(height: TSizes.md,),
              Padding(padding: EdgeInsets.only(left: TSizes.md,right: TSizes.md,bottom:TSizes.md ),
            child:controllerForm.formulaireTextCheval(
              iconPrefix:Iconsax.password_check,label:TText.adresse,
               textEditingController: controller.adresse
            ) ),
          ],
        ),
      ),
    );
  }
}