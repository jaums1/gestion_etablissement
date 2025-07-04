import 'package:ecole/Classe/Controller/classe_page.dart';
import 'package:ecole/Classe/Screen/Widget/search_classe_dialog.dart';
import 'package:ecole/Configs/cammon/widgets/combo/combo.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/cammon/widgets/texts/text_widget.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:ecole/Configs/utils/Emplacement_Texte/text_affiche_enligne.dart';
import 'package:ecole/Configs/utils/Emplacement_Texte/texte_cheval.dart';
import 'package:ecole/Configs/utils/formatters/formatters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Classe/Controller/classe_controller.dart';
import '../../../../../Configs/cammon/widgets/Recherche_Add/recherche_add_create.dart';
import '../../../../../Configs/cammon/widgets/buttons/button.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Configs/utils/Device/devices_utility.dart';
import '../../../../../Configs/utils/Popup/loaders.dart';
import '../../../../../Modalite_Paiement/Model/modalite_paiement_model.dart';
import '../../../../../Scolarite/Controller/scolarite_controller.dart';
import '../../../../Controller/inscription_controller.dart';
import '../../../../Controller/inscription_validation.dart';
import 'info_paiement.dart';

class InfoClasseInscription extends StatelessWidget {
  final combo = TCombo();
  final formulaire =TFormulaire();
    final validation= TInscriptionValidation();
  final controllerScolarite = Get.find<TScolariteController>();
  final controllerClasse = Get.find<TClasseController>();
final controller = Get.find<TInscriptionController>();
   InfoClasseInscription({super.key});
  @override
  Widget build(BuildContext context) {
  
    return Obx(
      (){
        if(controllerClasse.DataClasse.value.IDClasse !=null){
         final data =controllerScolarite.DataScolarite.value.DataTable==null?TModalitePaiementModel():
         controllerScolarite.DataScolarite.value.DataTable![0];
         String dateChaine ="${data.JourMois} ${DateTime.now().year}";
         int? montant = data.Montant;
          controller.variable.DateProchainVersement.text = TFormatters.formatChaineVersDateFr(dateChaine);
          controller.DataInscription.value.DateProchainVersement = TFormatters.formatChaineVersDateAng(dateChaine);

          ///// PAIEMENT 
          controller.variable.MontantVersement.text =montant.toString();
          controller.DataInscription.value.MontantVersement =montant;
        }

         var DataClasse = controllerClasse.DataClasse.value;
                 
                  if (controllerClasse.edite.value==false) {
                     controller.variable.FraisAnnexe.text = controllerScolarite.DataScolarite.value.FraisAnnexe.toString();
                  controller.variable.DroitInscription.text = controllerScolarite.DataScolarite.value.FraisInscription.toString();
                  controller.variable.Scolarite.text = controllerScolarite.DataScolarite.value.MontantScolarite.toString();
                  if (controller.variable.FraisAnnexe.text=="null"){
                     controller.variable.FraisAnnexe.clear();
                     controller.variable.DroitInscription.clear();
                     controller.variable.Scolarite.clear();
                  }
                  }
                 
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         SizedBox(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            spacing: TSizes.md,
            runSpacing: TSizes.md,
            children: [
              ////// INFORMATION DE LA CLASSE 
              TRoundedContainerCreate(
                child: SizedBox(
                  width: TDeviceUtility.isDesktopScreen(context) ? 500 : 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///// RECHERHE ET AJOUT
                      SizedBox(
                        child: TRechercheAddCreate(
                          isAdd: false,
                          onPressedAdd:()=>TClassePage().H_PageShowDialogNouveau() ,
                          onPressedRecherche: ()=> showSearchClasseDialog(isScolarite: true)
                        ),
                      ),
                        
                      DataClasse.LibClasse==null ?SizedBox(): SizedBox(height: TSizes.md,),
                        
                    ////// CLASSE ET NIVEAU
                      DataClasse.LibClasse==null ?SizedBox() :  TAffichageTextEnChevel(
                        label: "Classe",
                        color: TColors.primary,
                        valeur: DataClasse.LibClasse,
                        onPressed:()=> TClassePage().H_PageShowDialogModifier(id: DataClasse.IDClasse) ,
                       ),

                      SizedBox(height: TSizes.xs,),
                      
                    //// NIVEAU SCOLAIRE
                  DataClasse.LibClasse==null ?SizedBox() :  TAffichageTextEnLigne(
                      label: "Niveau d'etude",
                      valeur: DataClasse.DataNiveauSerie?.niveauSerie??"",
                    ),
                            
                  SizedBox(height: TSizes.md,),
                   
                    // INFORMATION SUR FRAIS INSCRIPTION, FRAIS ANNEXE ET SCOLARITE
                    DataClasse.LibClasse==null ?SizedBox(): SizedBox(
                        child: Column(
                          children: [
                            /////// FRAIS INSCRIPTION
                            Obx(
                              ()=>InfoScolariteInscription(formulaire: formulaire,text: "Frais Inscription",
                              textEditingController: controller.isFraisInscription.value==true? 
                              TextEditingController(text:TFormatters.formatCurrency(
                               int.parse(controller.variable.DroitInscription.text)
                                ) )
                              :controller.variable.DroitInscription
                              ,controller: controllerClasse,
                              onChanged:(value){
                                controller.isFraisInscription.value=value!;
                              },checkboxvalue: controller.isFraisInscription.value,
                              ),
                            ),
                            
                            Divider(thickness: 1,height: 0.1),
                            
                            /////// FRAIS ANNEXE  TInscriptionFunction().H_onChangeFraisAnnexe
                            Obx(
                              ()=>InfoScolariteInscription(formulaire: formulaire,text: "Frais Annexe",
                                textEditingController: controller.isFraisAnnexe.value==true? 
                              TextEditingController(text:TFormatters.formatCurrency(
                               int.parse(controller.variable.FraisAnnexe.text)
                                ) )
                              :controller.variable.FraisAnnexe
                                
                                ,controller: controllerClasse,
                                onChanged:(value){
                                  controller.isFraisAnnexe.value =value!;
                                  }  ,checkboxvalue: controller.isFraisAnnexe.value,
                                )
                            ),
                         
                            
                            Divider(thickness: 1,height: 0.1,),
                            
                            /////// SCOLARITE
                            InfoScolariteInscription(formulaire: formulaire,text: "Scolarite",checkbox: false,
                            textEditingController: controller.variable.Scolarite,controller: controllerClasse,
                            ),
                          ],
                        ),
                      )
                        
                   
                    ],
                  ),
                ) ,
              ),
      
              ////// INFORMATION PAIEMENT
          DataClasse.IDClasse == null? SizedBox():
          TRoundedContainerCreate(
                child:SizedBox(
                   width: TDeviceUtility.isDesktopScreen(context) ? 500 : 200,
                   child: InfoPaiementInscription(controller: controller,),
                ) ,
                )
              
            ],),
         ),  
        
                SizedBox(height: TSizes.md,),
      ///// BUTTON VALIDER
                
         DataClasse.IDClasse==null? SizedBox():SizedBox(child:
           TButton.ValidateButton(titre: "Valider",onPressed:(){ 
           final result = controller.variable.keyInscription.currentState!.validate();
            
            if (result) {
              if(controller.isFraisAnnexe.value && controller.isFraisInscription.value){
                   validation.H_Enregistrer(); 
              }else{
                TLoader.errorSnack(title: "CASE A COCHE",message:"Veuillez cocher "
                "les cases a cocher pour valider le paiement");
              }
            }
            }))



        ],
      );}
    );
  }
}

class InfoScolariteInscription extends StatelessWidget {
  const InfoScolariteInscription({
    super.key,
    required this.formulaire, this.text, this.textEditingController, this.checkbox=true,
     this.controller, this.onChanged, this.checkboxvalue,
  });

  final TFormulaire formulaire;
  final String? text;
  final TextEditingController? textEditingController;
  final bool? checkbox;
  final bool? checkboxvalue;
  final TClasseController? controller;
  final Function(bool?)?  onChanged;
  // 
  @override
  Widget build(BuildContext context) {
   
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:  8.0),
        child: Row(
          children: [
           Expanded(child: TTextCustom.subtitle(text: text.toString())),
           Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  child:formulaire.textFormField(
                    readOnly: checkboxvalue,
                    vertical: 12,
                    horizontal: 12,
                  isPadding: true,
                  isVerification: true,
                  textInputType: TextInputType.number,
                  textEditingController:textEditingController ,
                  onChanged: (value){
                    controller!.edite.value=false;
                    controller!.edite.value=true;
                    } 
                            ) ,
                ),
              ),
              Expanded(child:checkbox==false?Container(): Checkbox(value: checkboxvalue, onChanged: onChanged))
               
            ],
           )) 
          ],
        ),
      ),
    );
  }
}
