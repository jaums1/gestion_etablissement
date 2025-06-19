import 'package:ecole/Configs/cammon/widgets/combo/combo.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Employe/Controller/employe_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/Coupe Ssection/coupe_section.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../Controller/employe_function.dart';
import 'photo_employe.dart';

class TEmployeInformationPerso extends StatelessWidget {
  const TEmployeInformationPerso({super.key});

  @override
  Widget build(BuildContext context) {
    final formulaire = TFormulaire();
    final combo = TCombo();
    final controller = Get.find<TEmployeController>();
   
    return Obx(
       ()=>  Form(
         key: controller.variable.keyInfoPerso,
         child: FocusTraversalGroup(
           child: Column(
            children: [
              TCoupeSectionTitre(titre: "Informations personnelles",),
              SizedBox(height: TSizes.spaceBtwItems,),
              Column(
              children: [
               
                //// PHOTO
                Align(
                  alignment: Alignment.centerLeft,
                  child: TCreatePhotoEmploye()),
                //// NOM
                formulaire.formulaireTextCheval(label: "Non",iconPrefix: Iconsax.user,
                isVerification: true,textEditingController:controller.variable.Nom
                ),
                    
                //// PRENOMS
                formulaire.formulaireTextCheval(label: "Prénoms",iconPrefix: Iconsax.user,
                isVerification: true, textEditingController:controller.variable.Prenoms 
              ),
                 ///// SEXE ET DATE NAISANCE
                 SizedBox(
                  child: Row(
                    children: [
                      Expanded(child: combo.comboTextChevale(
                   valeur: controller.variable.Sexe.text,     
                  hintText: "Sexe",
                  sections:TText.Sexe,
                 label: "Sexe",onChanged:TEmployeFunction().H_OnChangedSexe ),),
                 SizedBox(width: 20,),
                 Expanded(child:   formulaire.formulaireTextCheval(
                  isIconSuffix:true,readOnly: true,isVerification: true,
                  textInputType: TextInputType.datetime,
                  textEditingController:controller.variable.DateNaissance.value,
                  onPressedIcon:TEmployeFunction().H_OnChangedDateNaissance,
                  label: "Date de Naissance",iconOpen:Iconsax.calendar), )
                    ],
                  ),
                 ),
                //// LIEU NAISSANCE
                formulaire.formulaireTextCheval(label: "Lieu Naissance",iconPrefix: Iconsax.location,
                textEditingController: controller.variable.LieuNaissance
                ),
                   
              //// NATIONNALITE
                combo.comboTextChevale(
                   valeur: controller.variable.Nationnalite.text,     
                  hintText: "Nationnalité",
                  sections:TText.nationalites,
                 label: "Nationnalité",onChanged:TEmployeFunction().H_OnChangedNationnalite ),
              
              
                   combo.comboTextChevale(
                   valeur: controller.variable.EtatCivil.text,     
                  hintText: "Civilité",
                  sections:controller.variable.etatsCivil,
                 label: "Civilité",onChanged:TEmployeFunction().H_OnChangedEtatCivil ), 
           
                 combo.comboTextChevale(
                   valeur: controller.variable.Fonction.text,     
                  hintText: "Fonction",
                  sections:controller.variable.fonctionsScolaires,
                 label: "Fonction",onChanged:TEmployeFunction().H_OnChangedFonction ),
                        
               
              
              ],
                        )
                 
            ],
                 ),
         ),
       ),
    );
  }
}