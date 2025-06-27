import 'package:ecole/Configs/cammon/widgets/combo/combo.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Eleves/Controller/eleve_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/Coupe Ssection/coupe_section.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../Controller/eleve_function.dart';


class TInformationPersoEleve extends StatelessWidget {
  final controller = Get.find<TEleveController>();
   TInformationPersoEleve({super.key});
  @override
  Widget build(BuildContext context) {
    final formulaire = TFormulaire();
    final combo = TCombo();
   
    
   
    return Obx(
       ()=>  Form(
         key: controller.variable.keyInfoEleve,
         child: Column(
          children: [
            TCoupeSectionTitre(titre: "Info Personnel",),
            SizedBox(height: TSizes.spaceBtwItems,),
            Column(
            children: [
              /// MATRICULE
             formulaire.formulaireTextCheval(label: "Matricule",iconPrefix: Iconsax.scan_barcode,
             textEditingController: controller.variable.matricule
             ,isVerification: true ),
              //// NOM
              formulaire.formulaireTextCheval(label: "Non",iconPrefix: Iconsax.user,
              isVerification: true,textEditingController:controller.variable.nom
              ),
       
              //// PRENOMS
              formulaire.formulaireTextCheval(label: "Prénoms",iconPrefix: Iconsax.user,
              isVerification: true, textEditingController:controller.variable.prenoms  
            ),
             
               
               ///// SEXE ET DATE NAISANCE
               SizedBox(
                child: Row(
                  children: [
                    Expanded(child: combo.comboTextChevale(
                 valeur: controller.variable.sexe.text,     
                hintText: "Sexe",
                sections:TText.Sexe,
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
              
              //// LIEU NAISSANCE
              formulaire.formulaireTextCheval(label: "Lieu Naissance",iconPrefix: Iconsax.location,
              textEditingController: controller.variable.lieuNaissance
              ),

              ///// CONTACT
               SizedBox(child: Row(
                children: [
            Expanded(child:  formulaire.formulaireTextCheval(label: "Tel 1",iconPrefix: Iconsax.call,
            textEditingController:controller.variable.phoneEleve1 ,isphone: true
            ),), 
            SizedBox(width: TSizes.spaceBtwItems,),
             Expanded(child:  formulaire.formulaireTextCheval(label: "Tel 2",iconPrefix: Iconsax.call,
             textEditingController:controller.variable.phoneEleve2 ,isphone: true
             ),)
             
                ],
              )),

              ///// ADRESSE
              formulaire.formulaireTextCheval(label: "Adresse",iconPrefix: Iconsax.location,
              textEditingController: controller.variable.adresse
              ),
            ],
                      )
               
          ],
               ),
       ),
    );
  }
}