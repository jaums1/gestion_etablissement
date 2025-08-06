import 'package:ecole/Configs/cammon/widgets/combo/combo.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/utils/Constant/enums.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';

import '../../../../../Configs/utils/Constant/texte_string.dart';
import '../../../../Controller/classe_controller.dart';
import '../../../../Controller/classe_function.dart';
import '../../../../Controller/classe_validation.dart';


class TClasseInformation extends StatelessWidget {
  const TClasseInformation({super.key, required this.argument, this.show=false});
 final String argument;
 final        bool? show;
  @override
  Widget build(BuildContext context) {
    final formulaire = TFormulaire();
    final validate = TClasseValidation();
    final combo = TCombo();
    final controller = Get.find<TClasseController>();
  

   
   
    return Obx(
       ()=>  TRoundedContainerCreate(
        padding:  EdgeInsets.symmetric(horizontal: TSizes.sm),
         child: Form(
           key: controller.variable.keyClasse,
           child: Column(
            // spacing:TSizes.sm ,
            children: [
              ////// NIVEAU SERIE
              combo.comboTextChevale(
               valeur: controller.variable.NiveauSerie.value.text,     
              hintText:TText.niveauSerie,
              sections:controller.controllerNiveauSerie.DataTableNiveauSerie.map((e)=> e.niveauSerie).toList(),
              label: TText.niveauSerie,onChanged:TClasseFunction().H_OnChangedNiveauSerie ),
         
               ////// CLASSE
                formulaire.formulaireTextCheval(label:TText.classe,iconPrefix: Iconsax.home,
                isVerification: true,textEditingController:controller.variable.LibClasse
                ),
               SizedBox(height: TSizes.md,),
                //// BUTTON DE VALIDATION
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(onPressed: ()async{
                  
               final keyClasse  =  controller.variable.keyClasse.currentState!.validate();
                if (keyClasse) {
               /////// VALIDATION NORMAL
              if(show==false)  argument == TraitementAction.nouveau.name?validate.H_Enregistrer():validate.H_Modifier();
               ////// VALIDATION PASSANT PAR SHOW DIALOG
              if(show==true)  argument == TraitementAction.nouveau.name?validate.H_EnregistrerShowDialog():validate.H_ModifierShowDialog();
                // argument == TraitementAction.nouveau.name?validate.H_Enregistrer():validate.H_Modifier();
               }
               }, child: Text("Valider"))
               )
               ) ,
              //  SizedBox(height: TSizes.md,)
              
              ],)
              ),
       ),
    );
  }
}