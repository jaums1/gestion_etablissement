
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../Configs/utils/Constant/colors.dart';
import '../../../Configs/utils/Constant/texte_string.dart';
import '../../../Configs/utils/Statut/statut.dart';
import '../../Controller/etablissement_controller.dart';

class TInfoCordonnee extends StatelessWidget {
    final controller     = Get.find<TEtablissementController>();
   TInfoCordonnee({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerForm = TFormulaire();
   
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
     children: [
      ///// TITRE DU CARDER
        TStatutCustom.H_CardreCouleur(titre:TText.coordonnee.tr,color: TColors.primary ),
         
         SizedBox(
           child: Column(
             children: [
                   
               /////// CONTACT
               SizedBox(
                 child: Row(
                   spacing: 20,
                   children: [
                     Expanded(child: controllerForm.formulaireTextCheval(
                     iconPrefix:Icons.phone_outlined,label:TText.phone1.tr,
                     textEditingController: controller.phoneDirecteur) ),
                     
                      Expanded(child: controllerForm.formulaireTextCheval(
                     iconPrefix:Icons.phone_outlined,label:TText.phone2.tr,
                     textEditingController: controller.telephone2) ),
                   ],
                 ),
               ),
               
                SizedBox(
                  child: Row(
                    spacing:20 ,
                    children: [
                      Expanded(child: controllerForm.formulaireTextCheval(
                              iconPrefix:Iconsax.message,label:TText.email.tr,
                              textEditingController: controller.email
                             ) ),
                      
                       Expanded(child: controllerForm.formulaireTextCheval(
                                 iconPrefix:Icons.my_location_sharp,label:TText.siteWeb.tr,
                                   textEditingController: controller.siteWeb
                            ) ),
                    ],
                  ),
                ),
                   
                   
             
           ],),
         ),
     ],
    );
  }
}