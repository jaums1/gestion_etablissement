import 'package:ecole/Configs/cammon/widgets/containers/rounded_container_create.dart';
import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/Create_form/create_form.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../Controller/eleve_controller.dart';
import '../widget/btn_eleve_validation.dart';
import '../widget/info_parent_eleve.dart';
import '../widget/info_perso_eleve.dart';
import '../widget/info_regime_statut_eleve.dart';
import '../widget/photo_eleve.dart';


class TCreateEleveDesktopScreen extends StatelessWidget {
   final controller = Get.find<TEleveController>();
   final double? width =400;
   TCreateEleveDesktopScreen({super.key,});
  @override
  Widget build(BuildContext context) {
    return  TCreateForm(
      titre: TText.eleve,
      route: TRoutes.eleve,
      child: Column(
        spacing: TSizes.md,
        children: [
          SizedBox(
            child: Row(
              spacing: TSizes.md,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
    
              //////// INFORMATION ELEVE
               SizedBox(
                width: width,
                child: TRoundedContainerCreate(child: TInformationPersoEleve()),
               ),
               
               ///// PHOTO ET AUTRE
               SizedBox(
                 width: width,
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: TSizes.sm,
                  children: [
                  //// PHOTO ELEVE 
                  InfoPhotoEleve(),
    
               ///// REGIME ET STATUT
                TRoundedContainerCreate(
                  child: TInformationRegimeEleve(),
                ),
    
                /////// INFORMATION PARENT
                  TRoundedContainerCreate(
                  child: TInformationParentEleve(),
                ),
                  ],
                 ),
               ),
              
              ],
            ),
          ),
        
          //// VALIDATION
          BtnEleveValidation(controller: controller,),
        
        ],
      ),
    );
  }
}