

import 'package:ecole/Configs/cammon/widgets/combo/combo.dart';
import 'package:ecole/Configs/utils/Statut/statut.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../Configs/utils/Constant/colors.dart';
import '../../../Configs/utils/Constant/texte_string.dart';
import '../../Controller/etablissement_controller.dart';

class TSituationGeographiqueEtablissement extends StatelessWidget {
     final controller     = Get.find<TEtablissementController>();
   TSituationGeographiqueEtablissement({super.key});

  @override
  Widget build(BuildContext context) {
    final controlSelect  = TCombo();
    final controllerForm = TFormulaire();
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///// TITRE DU CARDER
         TStatutCustom.H_CardreCouleur(titre:TText.situationGeo.tr,color: TColors.primary ),
          
        SizedBox(
          child: Column(
            children: [
              SizedBox(
                child: Row(
                  spacing: 20,
                  children: [
                   Expanded(
                      child: controlSelect.comboTextChevale(
                        label: TText.pays.tr,valeur: controller.selectPays.value,
                        sections: TText.listPays,onChanged: controller.onSelectPays
                      ) ),
                   Expanded(
                   child:controllerForm.formulaireTextCheval(
                  iconPrefix:Iconsax.password_check,label:TText.ville.tr,
                   textEditingController: controller.ville
                ) ),
                ],),
              ),
              
            controllerForm.formulaireTextCheval(
            iconPrefix:Iconsax.password_check,label:TText.adresse,
             textEditingController: controller.adresse
          ),
            ],
          ),
        ),
      
         
      ],
    );
  }
}