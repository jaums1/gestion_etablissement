import 'package:ecole/Configs/cammon/widgets/combo/combo.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Eleves/Controller/eleve_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/Coupe Ssection/coupe_section.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../Controller/eleve_function.dart';
import '../../../../Controller/eleve_validation.dart';
import 'info_contact_eleve.dart';

class TInformationPersoEleve extends StatelessWidget {
  const TInformationPersoEleve({super.key});

  @override
  Widget build(BuildContext context) {
    final formulaire = TFormulaire();
    final validate = TValidationEleve();
    final combo = TCombo();
    final tab= ["Homme","Femme"];
    final controller = Get.find<TEleveController>();
   
    return Obx(
       ()=>  Form(
         key: controller.variable.keyInfoEleve,
         child: Column(
          children: [
            TCoupeSectionTitre(titre: "Information Personnel",),
            SizedBox(height: TSizes.spaceBtwItems,),
            Column(
            children: [
              /// MATRICULE
             formulaire.formulaireTextCheval(label: "Matricule",iconPrefix: Iconsax.scan_barcode,
            //  textEditingController:controller.variable.matricule
             textEditingController: controller.variable.matricule
             ,isVerification: true ),
              SizedBox(height: TSizes.spaceBtwItems,),
              //// NOM
              formulaire.formulaireTextCheval(label: "Non",iconPrefix: Iconsax.user,
              isVerification: true,textEditingController:controller.variable.nom
              ),
              SizedBox(height: TSizes.spaceBtwItems,),
                  
              //// PRENOMS
              formulaire.formulaireTextCheval(label: "Prénoms",iconPrefix: Iconsax.user,
              isVerification: true, textEditingController:controller.variable.prenoms  
            ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
               
               ///// SEXE ET DATE NAISANCE
               SizedBox(
                child: Row(
                  children: [
                    Expanded(child: combo.comboTextChevale(
                 valeur: controller.variable.sexe.text,     
                hintText: "Sexe",
                sections:tab,
               label: "Sexe",onChanged:TEleveFunction().H_OnChangedSexe ),),
               SizedBox(width: 20,),
               Expanded(child:   formulaire.formulaireTextCheval(
                isIconSuffix:true,readOnly: true,
                textInputType: TextInputType.datetime,
                textEditingController:controller.variable.dateNaissance.value,
                onPressedIcon:TEleveFunction().H_OnChangedDate,
                label: "Date de Naissance",iconOpen:Iconsax.calendar), )
                  ],
                ),
               ),
               SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              //// LIEU NAISSANCE
              formulaire.formulaireTextCheval(label: "Lieu Naissance",iconPrefix: Iconsax.location,
              textEditingController: controller.variable.lieuNaissance
              ),
              SizedBox(height: TSizes.spaceBtwItems,),
              TInformationContactEleve(),
              SizedBox(height: TSizes.spaceBtwItems,),
                      
             SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(onPressed: (){
              
             final keyEleve  =  controller.variable.keyInfoEleve.currentState!.validate();
             final keyStatut =  controller.variable.keyInfoStatut.currentState!.validate();
             if (keyEleve && keyStatut) {
             controller.HLitEleve(param: "ENVOYER");
              // controller.action == TraitementAction.nouveau.name?
               validate.H_Enregistrer()
              //  :validate.H_Modifier()
               ;
             }
              
              }, child: Text("Valider")) ,
             )
            
            ],
                      )
               
          ],
               ),
       ),
    );
  }
}