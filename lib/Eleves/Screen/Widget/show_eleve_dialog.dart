import 'package:ecole/Configs/cammon/widgets/buttons/button.dart';
import 'package:ecole/Configs/cammon/widgets/containers/rounded_container_create.dart';
import 'package:ecole/Eleves/Controller/eleve_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Configs/utils/Constant/enums.dart';
import '../../../Configs/utils/Constant/sizes.dart';
import '../../Controller/eleve_controller.dart';
import 'Create/widget/info_parent_eleve.dart';
import 'Create/widget/info_perso_eleve.dart';
import 'Create/widget/info_regime_statut_eleve.dart';
import 'Create/widget/right_create_eleve.dart';

class ShowEleveDialog extends StatelessWidget {
   final controller = Get.find<TEleveController>();
  ShowEleveDialog({super.key, this.argument,this.show=true});
 final String? argument;
 final bool? show;
  @override
  Widget build(BuildContext context) {
    final validate = TValidationEleve();
    return SizedBox(
      width: 900,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child:  TRoundedContainerCreate(child: TInformationPersoEleve()),
                  ),
                   SizedBox(width: TSizes.sm,),
                  Expanded(
                    child:
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         TRightCreatePhotoEleve(),
                         SizedBox(height: TSizes.sm,),
                         TRoundedContainerCreate(child: TInformationRegimeEleve()),
                         SizedBox(height: TSizes.sm,),
                         TRoundedContainerCreate(child: TInformationParentEleve()),
                       ],
                     )),
                ],
              ),
            ),
            SizedBox(height: TSizes.md,),

            ///// BUTTON VALIDATION
            TButton.ValidateButton(titre: "Validation",onPressed: (){
               final keyEleve  =  controller.variable.keyInfoEleve.currentState!.validate();
             final keyStatut =  controller.variable.keyInfoStatut.currentState!.validate();
             if (keyEleve && keyStatut) {
                ///// VALIDATION FORMULAIRE
                if(show ==false) argument == TraitementAction.nouveau.name?  validate.H_Enregistrer():validate.H_Modifier();
               
               ///// VALIDATION SHOW DIALOG
                if(show ==true) argument == TraitementAction.nouveau.name?  validate.H_EnregistrerShowDialog():validate.H_ModifierShowDialog();
             
            }}),
          ],
        ),
      ),
    );
  }
}