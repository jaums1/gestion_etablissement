import 'package:ecole/Configs/cammon/widgets/buttons/button.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Configs/utils/Device/devices_utility.dart';
import 'package:ecole/Employe/Controller/employe_controller.dart';
import 'package:ecole/Employe/Controller/employe_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import 'info_coordonne_employe.dart';
import 'info_perso_employe.dart';
import 'info_prof_employe.dart';

class FormEmploye extends StatelessWidget {
  const FormEmploye({super.key, this.showdialog=false,this.arg});
 final bool? showdialog;
 final String? arg;
  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
    final controller = Get.find<TEmployeController>();
    return Column(
      spacing: 20,
      children: [
        SizedBox(
          child: Row(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //// INFORMATION PERSONNELLES
              Expanded(
                  child: TRoundedContainerCreate(
                child: TEmployeInformationPerso(),
              )),
          
              //// INFORMATION COORDONNEES ET SALAIRE
              Expanded(
                child: Column(spacing: 20, children: [
                  //// INFORMATION COORDONNEES
                  TRoundedContainerCreate(
                    child: TInformationCoordonneeEmploye(),
                  ),
          
                  TRoundedContainerCreate(
                    child: TInformationProfessionnelleEmploye(),
                  ),
                ]),
              )
            ],
          ),
        ),
     
      /////BUTTONS VALIDATION
      SizedBox(
        width: TDeviceUtility.isMobileScreen(context)==true?double.infinity:null,
        child: TButton.ValidateButton(titre: TText.validation,onPressed: (){
            
            final keyInfoPerso  =  controller.variable.keyInfoPerso.currentState!.validate();
            final keyInfoProfessionnelle =  controller.variable.keyInfoProfessionnelle.currentState!.validate();
             
             if(keyInfoPerso && keyInfoProfessionnelle){
                 ////// NORMAL
            if(showdialog==false) argument==TraitementAction.nouveau.name?TEmployeValidation().H_Enregistrer(): TEmployeValidation().H_Modifier();
         
              ////// SHOW DIALOG
             if(showdialog!) arg==TraitementAction.nouveau.name?TEmployeValidation().H_EnregistrerShowDialog(): TEmployeValidation().H_ModifierShowDialog();
        
             }
         
         }),
      ),
      ],
    );
  }
}
