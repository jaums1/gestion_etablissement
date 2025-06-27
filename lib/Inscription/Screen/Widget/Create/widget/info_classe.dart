import 'package:ecole/Classe/Controller/classe_page.dart';
import 'package:ecole/Classe/Screen/Widget/search_classe_dialog.dart';
import 'package:ecole/Configs/cammon/widgets/combo/combo.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/cammon/widgets/texts/text_widget.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:ecole/Configs/utils/Emplacement_Texte/text_affiche_enligne.dart';
import 'package:ecole/Configs/utils/Emplacement_Texte/texte_cheval.dart';
import 'package:ecole/Inscription/Controller/inscription_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Classe/Controller/classe_controller.dart';
import '../../../../../Configs/cammon/widgets/Recherche_Add/recherche_add_create.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Configs/utils/Device/devices_utility.dart';
import '../../../../../Scolarite/Controller/scolarite_controller.dart';
import '../../../../Controller/inscription_controller.dart';

class InfoClasseInscription extends StatelessWidget {
  final combo = TCombo();
  final formulaire =TFormulaire();
  final controllerScolarite = Get.find<TScolariteController>();
  final controllerClasse = Get.find<TClasseController>();

   InfoClasseInscription({super.key, required this.controller});
 final TInscriptionController controller;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainerCreate(
      child: SizedBox(
        width: TDeviceUtility.isDesktopScreen(context)? 500:200,
        child: Obx(
          (){ 
            var DataClasse = controllerClasse.DataClasse.value;
             print("CLasse");
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
           
            if (controller.isFraisInscription.value ) null;
            if (controller.isFraisAnnexe.value ) null;
           
            return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///// RECHERHE ET AJOUT
              
              SizedBox(
                child: TRechercheAddCreate(
                  onPressedAdd:()=>TClassePage().H_PageShowDialogNouveau() ,
                  onPressedRecherche: ()async{
                   final result= await  showSearchClasseDialog(isScolarite: true);
                   if(result !=null){
                    controllerClasse.DataClasse.value = result;
                    DataClasse = controllerClasse.DataClasse.value ;
                  
                   }
                 
                    },
                ),
              ),
          DataClasse.LibClasse==null ?SizedBox():      SizedBox(height: TSizes.md,),
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
                    InfoScolariteInscription(formulaire: formulaire,text: "Frais Inscription",
                    textEditingController: controller.variable.DroitInscription,controller: controllerClasse,
                    onChanged:TInscriptionFunction().H_onChangeFraisInscription ,checkboxvalue: controller.isFraisInscription.value,
                    ),

                    Divider(thickness: 1,height: 0.1),

                    /////// FRAIS INSCRIPTION
                    Obx(
                      (){
                        return InfoScolariteInscription(formulaire: formulaire,text: "Frais Annexe",
                      textEditingController: controller.variable.FraisAnnexe,controller: controllerClasse,
                      onChanged:TInscriptionFunction().H_onChangeFraisAnnexe ,checkboxvalue: controller.isFraisAnnexe.value,
                      );
                  } ),

                    Divider(thickness: 1,height: 0.1,),

                    /////// SCOLARITE
                    InfoScolariteInscription(formulaire: formulaire,text: "Scolarite",checkbox: false,
                    textEditingController: controller.variable.Scolarite,controller: controllerClasse,
                    ),
                  ],
                ),
              )
            ],
          );}
        ),
      ),
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
