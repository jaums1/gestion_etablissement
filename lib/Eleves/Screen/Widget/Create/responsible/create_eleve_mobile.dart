import 'package:ecole/Configs/cammon/widgets/Create_form/create_form.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Eleves/Screen/Widget/Create/widget/photo_eleve.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/routes/route.dart';
import '../../../../../Configs/utils/Constant/colors.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../Controller/eleve_controller.dart';
import '../widget/btn_eleve_validation.dart';
import '../widget/info_parent_eleve.dart';
import '../widget/info_perso_eleve.dart';
import '../widget/info_regime_statut_eleve.dart';


class TCreateEleveMobileScreen extends StatelessWidget {
  final controller = Get.find<TEleveController>();
  TCreateEleveMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: TColors.softGrey,
      body: TCreateForm(
        titre: TText.eleve,
        route: TRoutes.eleve,
        child: Align(
          child: SizedBox(
            width: 400,
            child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
              spacing:TSizes.md,
              children: [
               ////// PHOTO 
               Align(alignment: Alignment.centerLeft, child: InfoPhotoEleve()),
            
               ///// INFORMATION PERSONNEL
               TRoundedContainerCreate(child: TInformationPersoEleve()),
               
                /////// REGIME ET STATUT
                TRoundedContainerCreate(child: TInformationRegimeEleve(),),
                         
                ///////// INFORMATION PARENT
                TRoundedContainerCreate(child: TInformationParentEleve(),),
               
                 //// VALIDATION
                  BtnEleveValidation(controller: controller,),
                  SizedBox(height: 10,)
                
              ]
            ),
          ),
        ),
      ),
    );
  }
}