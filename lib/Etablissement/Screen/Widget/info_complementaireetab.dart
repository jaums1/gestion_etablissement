import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../Configs/cammon/widgets/combo/combo.dart';
import '../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../Configs/utils/Constant/colors.dart';
import '../../../Configs/utils/Constant/sizes.dart';
import '../../../Configs/utils/Constant/texte_string.dart';
import '../../Controller/etablissement_controller.dart';

class TInfoComplementaireEtab extends StatelessWidget {
  const TInfoComplementaireEtab({super.key});

  @override
  Widget build(BuildContext context) {
     final controlSelect  = TCombo();
   final controllerForm = TFormulaire();
     final controller     = Get.put(TEtablissementController());
    return Padding(
      padding: const EdgeInsets.only(bottom: TSizes.md),
      child: Container(
        decoration: BoxDecoration(color: Colors.white,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///// TITRE DU CARDER
            Padding(padding: EdgeInsets.only(left: TSizes.sm,top: TSizes.sm,bottom: TSizes.md),
            child:Text("Information Complémentaire",style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: TColors.darkerGrey),),
            ),
            Padding(
              padding: EdgeInsets.only(left: TSizes.md,right: TSizes.md,bottom:TSizes.sm ),
              child: Row(children: [
                Expanded(
                  flex: 2,
                  child: controllerForm.formulaireTextCheval(
                   iconPrefix:Iconsax.message,label:TText.email,
                  textEditingController: controller.email
                 )),
                 SizedBox(width: 6,),
                 Expanded(flex: 2,
                 child:controllerForm.formulaireTextCheval(
                iconPrefix:Icons.my_location_sharp,label:TText.siteWeb,
                 textEditingController: controller.siteWeb
              ) ),
              ],),
            ),
            // SizedBox(height: TSizes.md,),
             Obx(
                   ()=>  Padding(padding: EdgeInsets.only(left: TSizes.md,right: TSizes.md,bottom:TSizes.md ),
                     child:controlSelect.comboTextChevale(
                     label: TText.typeEtablissement,valeur: controller.selectTypeEnseignement.value,
                     sections: TText.listTypeEnseignement,onChanged: controller.onSelectEnseignement
                   ),) 
                 ),
                 
            //   Padding(padding: EdgeInsets.only(left: TSizes.md,right: TSizes.md,bottom:TSizes.md ),
            // child:controllerForm.formulaireTextCheval(
            //   iconPrefix:Iconsax.password_check,label:TText.typeEtablissement,
            //    textEditingController: controller.typeEtablissement
            // ) ),
          ],
        ),
      ),
    );
  }
}