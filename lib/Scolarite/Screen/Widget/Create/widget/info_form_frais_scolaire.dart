import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/combo/combo.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../Controller/scolarite_controller.dart';

class TScolariteFormFraisScolaire extends StatelessWidget {
  const TScolariteFormFraisScolaire({super.key, this.alignment = WrapAlignment.center, this.controller});
  final WrapAlignment? alignment;
  final TScolariteController? controller;
  @override
  Widget build(BuildContext context) {
     final combo = TCombo();
    final formulaire =TFormulaire();
    final argument = Get.arguments;
   
    return  Obx(
      ()=> TRoundedContainerCreate(
           child: Form(
            key: controller!.variable.keyScolarite,
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                SizedBox(
                  child: Row(
                    spacing: 10,
                    children: [
                      Expanded(child: combo.comboTextChevale(
                      valeur: controller!.variable.TypeScolarite.text,
                      hintText: "Statut",
                      sections:["Affecté(e)","Non Affecté(e)"],
                      label: "Statut",onChanged:controller!.DataTableNiveauScolaire.isNotEmpty ||
                      argument==TraitementAction.modifier.name?null :(val){
                        controller!.variable.TypeScolarite.text =val;}), ),

                      Expanded(child:  formulaire.formulaireTextCheval(label: "Scolarite",
                isVerification: true,
                textInputType: TextInputType.number,
                textEditingController: controller!.variable.MontantScolarite,
                readOnly: controller!.variable.DataTableModalitePaiement.isEmpty?false:true
                ),),
                    ],
                  ),
                ),
               SizedBox(
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(child: formulaire.formulaireTextCheval(label: "Frais D'Inscription",
                   isVerification: true,textInputType: TextInputType.number,textEditingController: controller!.variable.FraisInscription)),
      
                    Expanded(child: formulaire.formulaireTextCheval(label: "Frais Annexe",isVerification: true,
                textEditingController: controller!.variable.FraisAnnexe,
                 textInputType: TextInputType.number,
                ),),
                  ],
                ),
               ),
      
                  
               ],
             ),
           ),
      ),
    );
  }
}