import 'package:ecole/Configs/cammon/widgets/buttons/button.dart';
import 'package:ecole/Configs/cammon/widgets/combo/combo.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Configs/utils/Popup/loaders.dart';
import 'package:ecole/Modalite_Paiement/Controller/modalite_paiement_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../Scolarite/Controller/scolarite_controller.dart';
import '../Controller/modalite_paiement_function.dart';
import '../Controller/modalite_paiement_validation.dart';


class TCreateModalitePaiementScree extends StatelessWidget {
 final controllerMP = Get.find<TModalitePaiementController>();
   TCreateModalitePaiementScree({super.key, this.argument, this.controller});
 final String? argument;
 final TScolariteController? controller;
  @override
  Widget build(BuildContext context) {
  
     final validation=TModalitePaiementValidation();
    final formulaire =TFormulaire();
    final combo =TCombo();
    
    return  Obx(
    () {
       int  VersementAnterieur =0;
       
      if(controller!.variable.DataTableModalitePaiement.isNotEmpty){
          VersementAnterieur = controller!.variable.DataTableModalitePaiement.map((e)=>e.Montant)
       .reduce((a,b)=>a!+b!)!;
      }
     
       final TotalVersement= int.parse(controllerMP.variable.Montant.value.text);
      var solde =int.parse(controller!.variable.MontantScolarite.text) - VersementAnterieur +TotalVersement;
    
      return SizedBox(
        width: 200,
        height: 290,
        child: SingleChildScrollView(
          child: TRoundedContainerCreate(
            padding: EdgeInsets.zero,
               child: Form(
                key: controllerMP.variable.keyModalitePaiement,
                 child: Column(
                   children: [
                    //// SCOLARITE 
                    SizedBox(child: Padding(
                      padding: const EdgeInsets.only(bottom:  4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                       Text("Scolarite Restante : ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: TColors.darkGrey
                       ),),
                       Text("$solde Fcfa ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.deepOrangeAccent
                       ),),
                            
                      ],),
                    ),),
                    //////LIBELLE DE VERSEMENT
                    formulaire.formulaireTextCheval(
                      readOnly: true,
                      textEditingController: controllerMP.variable.LibVersement,
                      isVerification: true,
                      label: "Libelle"),
                      
                       //////SCOLARITE
                      formulaire.formulaireTextCheval(
                      textEditingController: controllerMP.variable.Montant.value,
                      isVerification: true,textInputType: TextInputType.number,
                      label: "Montant echelonné"),
                      
                    
                 //////// JOUR RAPPEL ET JOUR DE PAIEMENT   
                    SizedBox(
                    child: Row(
                      children: [
                            /////MOIS
                          Expanded(child: combo.comboTextChevale(
                      valeur: controllerMP.variable.Mois.text,
                      hintText: "Mois",
                      sections: TText.mois,
                      label: "Mois",
                      onChanged: TModalitePaiementFunction().H_OnChangedMois), ),
                    
                        SizedBox(width: 5,),
                        Expanded(
                          child: combo.comboTextChevale(
                              valeur: controllerMP.variable.Jour.text,
                              hintText: "Jour Echéance",
                              sections: TText.jours,
                              label: "Jour Echéance",
                              onChanged:TModalitePaiementFunction().H_OnChangedJour),
                        ),
                        
                       
                      ],
                    ),
                  ),
                    SizedBox(height: TSizes.md,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TButton.elevatedButton(text: "Valider",onPressed:(){
                       final result = solde -int.parse(controllerMP.variable.Montant.value.text);
                        if(result <-1){
                         TLoader.errorSnack(title: "ERREUR",message:"Le montant saisir est superieur au "
                         "reste de la scolarite");
                          return;
                        }
                        final keys = controllerMP.variable.keyModalitePaiement.currentState!.validate();
                        if (keys) {
                       argument == TraitementAction.nouveau.name?validation.H_Enregistrer()
                      :validation.H_Modifier();
                        }
                        
                        }))   
              
                   ],
                 ),
               ),
          ),
        ),
      );
  });
  }
}