import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../Controller/scolarite_controller.dart';

class TScolariteFormFraisScolaire extends StatelessWidget {
  const TScolariteFormFraisScolaire({super.key, this.alignment = WrapAlignment.center, this.controller});
  final WrapAlignment? alignment;
  final TScolariteController? controller;
  @override
  Widget build(BuildContext context) {
    final formulaire =TFormulaire();

    double? width =alignment==WrapAlignment.start?null:250.0;
    return  Obx(
      ()=> Padding(
        padding:  const EdgeInsets.only(bottom: TSizes.md),
        child: TRoundedContainerCreate(
             child: Form(
              key: controller!.variable.keyScolarite,
               child: Wrap(
                spacing: 20,
                 alignment :WrapAlignment.center,
                 children: [
                  SizedBox(width:width,
                  child:  formulaire.formulaireTextCheval(label: "Frais D'Inscription",
                  isVerification: true,textEditingController: controller!.variable.FraisInscription)),
                  
                   SizedBox(
                    width:width,
                  child:   formulaire.formulaireTextCheval(label: "Frais Annexe",isVerification: true,
                  textEditingController: controller!.variable.FraisAnnexe,
                   textInputType: TextInputType.number,
                  ),
                  ),
                  SizedBox(
                    width: width,
                  child:   formulaire.formulaireTextCheval(label: "Scolarite",
                  isVerification: true,
                  textInputType: TextInputType.number,
                  textEditingController: controller!.variable.MontantScolarite,
                  readOnly: controller!.variable.DataTableModalitePaiement.isEmpty?false:true
                  ),
                  ),
                 
                  // formulaire.formulaireTextCheval(label: "Scolarite"),
                    
                 ],
               ),
             ),
        ),
      ),
    );
  }
}