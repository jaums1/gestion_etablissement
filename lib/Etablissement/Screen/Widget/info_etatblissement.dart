
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../Configs/cammon/widgets/combo/combo.dart';
import '../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../Configs/utils/Constant/colors.dart';
import '../../../Configs/utils/Constant/texte_string.dart';
import '../../../Configs/utils/Statut/statut.dart';
import '../../Controller/etablissement_controller.dart';

class TInforEtablissement extends StatelessWidget {
  
    
  const TInforEtablissement({super.key});
 
  @override
  Widget build(BuildContext context) {
    final controlSelect  = TCombo();
  final controller = Get.find<TEtablissementController>();
    final controllerForm = TFormulaire();
    return Form(
      key: controller.keyForm,
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///// TITRE DU CARDER
          TStatutCustom.H_CardreCouleur(titre:TText.information.tr,color: TColors.primary ),
          
          ///// FORMULAIRE
           ///CODE
            SizedBox(
              child: Column(
                
                children: [
                   ///ETABLISSEMENT
             controllerForm.formulaireTextCheval(
            isVerification: true,
            iconPrefix:Iconsax.password_check,label:TText.etatblissement.tr,
             textEditingController: controller.etablissement
                ),

                  SizedBox(
                    child: Row(
                      spacing: 20,
                      children: [
                        Expanded(child:  controllerForm.formulaireTextCheval(isVerification: true,
                     iconPrefix:Iconsax.password_check,label:TText.codeEtatblissement.tr,
                      textEditingController: controller.codeEtablissemnt
                   ),),
                      
                   Expanded(child: controlSelect.comboTextChevale(
                           label: TText.typeEtablissement.tr,valeur: controller.selectTypeEnseignement.value,
                           sections: TText.listTypeEnseignement,onChanged: controller.onSelectEnseignement
                         ),)
                      
                      ],
                    ),
                  ),
                ],
              ),
            ),
             
          
        
        ],
      ),
    );
  }
}