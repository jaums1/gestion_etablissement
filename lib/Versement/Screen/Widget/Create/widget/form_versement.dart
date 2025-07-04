import 'package:ecole/Configs/cammon/widgets/combo/combo.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/cammon/widgets/texts/text_widget.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/utils/Constant/enums.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Configs/utils/Constant/texte_string.dart';
import '../../../../../Configs/utils/formatters/formatters.dart';
import '../../../../../Inscription/Controller/inscription_controller.dart';
import '../../../../Controller/versement_controller.dart';
import '../../../../Controller/versement_function.dart';
import '../../../../Controller/versement_validation.dart';



// ignore: must_be_immutable
class FormVersement extends StatelessWidget {
   final controller = Get.find<TVersementController>();
   final controllerInscription= Get.find<TInscriptionController>();
   
  FormVersement ({super.key, required this.argument, this.show=false, this.inscriptionController});
 final String argument;
 final bool? show;
 final TInscriptionController? inscriptionController;
  @override
  Widget build(BuildContext context) {
    
    final formulaire = TFormulaire();
    final validate = TVersementValidation();
    final functions = TVersementFunction();
    final combo = TCombo();
    if(show!) controllerInscription.DataInscription = inscriptionController!.DataInscription;
    
    //    controllerInscription.DataTableInscription.value = inscriptionController!.DataTableInscription ;
    //    controllerInscription.DataTableFiltreInscription.value = inscriptionController!.DataTableInscription ;
    //    controllerInscription.DataInscription = inscriptionController!.DataInscription ;
    // }
    return  TRoundedContainerCreate(
         child: Form(
           key: controller.variable.keyVersement,
           child: Column(
            children: [
              ////// AFFICHAGEMONTANT
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TTextCustom.title(text:TFormatters.formatCurrency(controllerInscription.DataInscription.value.ResteAPayer),
                      color: TColors.primary
                       ),
                        TTextCustom.subtitle(text: "Reste à payer",color: Colors.grey)
                    ],
                  ),
                ),
              ),
              
              //  SizedBox(height: TSizes.md,),
              //  Align(
              //    alignment: Alignment.centerLeft,
              //    child: TexteRicheCustom.TexteRicheLigne(textPrimaire: controller.variable.Ref.text,
              //     textSecondaire: "Ref ",colorPrimaire: Colors.deepOrange),
              //  ),
                SizedBox(height: TSizes.sm,),
              ////// PAIEMENT
               formulaire.formulaireTextCheval(label: "Montant Payer",iconPrefix: Iconsax.money,
                isVerification: true,textEditingController:controller.variable.Montant,
                textInputType: TextInputType.number,isMonetaire: false,
                ),
               
               ///// MODALITE DE PAIEMENT
               combo.comboTextChevale(
                 valeur: controller.variable.TypePaiement.text,     
                hintText: "Méthode de Paiement",
                sections:TText.MethodePaiement,
               label: "Méthode de Paiement",onChanged:TVersementFunction().H_OnChangedMethodePaiement ),
               
               
                 ////// PAIEMENT ANTERIEUR
            controllerInscription.variable.MontantVersement.text.isEmpty ? SizedBox():
               formulaire.formulaireTextCheval(label: "Montant Payer",iconPrefix: Iconsax.money_change,
                isVerification: true,textEditingController:controllerInscription.variable.MontantVersement,
                textInputType: TextInputType.number,readOnly: true
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Expanded(child: formulaire.formulaireTextCheval(label: "Date Versement",
                isVerification: true,textEditingController:controller.variable.DateVersement,
                isIconSuffix:true,iconOpen:Iconsax.calendar,onPressedIcon: ()=> functions.H_OnChangedDateVersement()
               
                ),),
                SizedBox(width: TSizes.md,),
                      Expanded(child: formulaire.formulaireTextCheval(label: "Prochain Versement",
                isVerification: true,textEditingController:controller.variable.DateProchainVersement,
                iconOpen:Iconsax.calendar,isIconSuffix:true,onPressedIcon: ()=> functions.H_OnChangedDateProchainVersement()
                ),),
                    ],
                  ),
                ),

             
                 SizedBox(height: TSizes.md,),
                //// BUTTON DE VALIDATION
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(onPressed: (){
              
               final keyClasse  = controller.variable.keyVersement.currentState!.validate();
                if (keyClasse) {
               /////// VALIDATION NORMAL
              if(show==false)  argument == TraitementAction.nouveau.name?validate.H_Enregistrer():validate.H_Modifier();
               //// VALIDATION PASSANT PAR SHOW DIALOG
              if(show==true)  argument == TraitementAction.nouveau.name?validate.H_EnregistrerShowDialog():validate.H_ModifierShowDialog();
               }}, child: Text("Valider"))
               )
               ) ,
               SizedBox(height: TSizes.md,)
              
              ],)
              ),
    );
  }
}