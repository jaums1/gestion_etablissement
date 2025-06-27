import 'package:ecole/Configs/utils/Popup/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Classe/Controller/classe_controller.dart';
import '../../../../../Configs/Breadcrumbs/breadcrumb.dart';
import '../../../../../Configs/cammon/widgets/Create_form/create_form.dart';
import '../../../../../Configs/cammon/widgets/buttons/button.dart';
import '../../../../../Configs/routes/route.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Eleves/Controller/eleve_controller.dart';
import '../../../../Controller/inscription_controller.dart';
import '../../../../Controller/inscription_validation.dart';
import '../widget/info_classe.dart';
import '../widget/info_eleve.dart';
import '../widget/info_paiement.dart';

class TCreateInscriptionDesktopForm extends StatelessWidget {
  final controller = Get.find<TInscriptionController>();
  final controllerClasse = Get.find<TClasseController>();
  final controllerEleve = Get.find<TEleveController>();
   TCreateInscriptionDesktopForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TCreateForm(
      child: Obx(
        (){
      
          if(controllerEleve.edite.value) null;
          final DataEleve = controllerEleve.DataEleve.value;
          
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             ///// HEADER
              TRetourHeader(titre:"Je fais une inscription",route: TRoutes.inscription,),
              SizedBox(height: TSizes.spaceBtwItems,),
              //// ELEVE
             InfoEleveInscription(controller: controller,),
            SizedBox(height: TSizes.md,),
       DataEleve.Nom==null? SizedBox():SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  //// CLASSE
                  InfoClasseInscription(controller: controller,),
                  SizedBox(width: TSizes.md,),
                  /// SCOLARITE
             DataEleve.Nom==null? SizedBox(): InfoPaiementInscription(controller: controller,),
                ],
              ),
            ),
             ///// BUTTON VALIDER
             SizedBox(height: TSizes.md,),
         DataEleve.Nom==null? SizedBox():SizedBox(child:
           TButton.ValidateButton(titre: "Valider",onPressed:(){ 
           final result = controller.variable.keyInscription.currentState!.validate();
            
            if (result) {
              if(controller.isFraisAnnexe.value && controller.isFraisInscription.value){
                   TInscriptionValidation().H_Enregistrer(); 
              }else{
                TLoader.errorSnack(title: "CASE A COCHE",message:"Veuillez cocher "
                "les cases a cocher pour valider le paiement");
              }
            }
           
             
            }))
        
           
          
          ],
        );
  }),
    );
  }
}