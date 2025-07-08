import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/buttons/button.dart';
import '../../../../../Configs/utils/Constant/enums.dart';
import '../../../../Controller/eleve_controller.dart';
import '../../../../Controller/eleve_validation.dart';

class BtnEleveValidation extends StatelessWidget {
  const BtnEleveValidation({super.key, required this.controller, this.show=false});
  final TEleveController controller;
  final bool? show;
  @override
  Widget build(BuildContext context) {
     final validate = TValidationEleve();
      final argument = Get.arguments;
    return   Padding(
      padding: const EdgeInsets.only(bottom:  TSizes.md),
      child: TButton.ValidateButton(titre: "Validation",onPressed: (){
                 final keyEleve  =  controller.variable.keyInfoEleve.currentState!.validate();
               final keyStatut =  controller.variable.keyInfoStatut.currentState!.validate();
                if (keyEleve && keyStatut) {
                  ///// VALIDATION FORMULAIRE
           if(show==false)argument == TraitementAction.nouveau.name?  validate.H_Enregistrer():validate.H_Modifier();
          
              ////// VALIDATION DIALOGUE 
           if(show!)argument == TraitementAction.nouveau.name?  validate.H_EnregistrerShowDialog():validate.H_ModifierShowDialog();
                 
              }}),
    );
  }
}