import 'package:ecole/Configs/cammon/widgets/Create_form/create_form.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/routes/route.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Configs/utils/Constant/texte_string.dart';
import '../../../../Controller/eleve_controller.dart';
import '../widget/btn_eleve_validation.dart';
import '../widget/info_parent_eleve.dart';
import '../widget/info_perso_eleve.dart';
import '../widget/info_regime_statut_eleve.dart';
import '../widget/photo_eleve.dart';



class TCreateEleveTabletScreen extends StatelessWidget {
   
     final controller = Get.find<TEleveController>();
   TCreateEleveTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final double width =400;
    return  Scaffold(
      backgroundColor: TColors.softGrey,
      body: TCreateForm(
        titre: TText.eleve,
         route: TRoutes.inscription,
        child:Column(
        spacing: TSizes.md,
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Row(
              spacing: TSizes.md,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
    
              //////// INFORMATION ELEVE
               Expanded(
                 child: SizedBox(
                  width: width,
                  child: TRoundedContainerCreate(child: TInformationPersoEleve()),
                 ),
               ),
               
               ///// PHOTO ET AUTRE
               Expanded(
                 child: SizedBox(
                   width: width,
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: TSizes.sm,
                    children: [
                    //// PHOTO ELEVE 
                    InfoPhotoEleve(),
                     
                    /////// REGIME ET STATUT
                    TRoundedContainerCreate(child: TInformationRegimeEleve(),),
                     
                    ///////// INFORMATION PARENT
                    TRoundedContainerCreate(child: TInformationParentEleve(),),
                    ],
                   ),
                 ),
               ),
              
              ],
            ),
          ),
        
          //// VALIDATION
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width/2,
                child: BtnEleveValidation(controller: controller,)),
            ],
          ),
        ],
      ))
    );
  }
}