import 'package:ecole/Configs/cammon/widgets/containers/rounded_container_create.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/Breadcrumbs/breadcrumb.dart';
import '../../../../../Configs/cammon/widgets/Create_form/create_form.dart';
import '../../../../../Configs/cammon/widgets/buttons/button.dart';
import '../../../../../Configs/routes/route.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Configs/utils/Device/devices_utility.dart';
import '../../../../Controller/scolarite_controller.dart';
import '../../../../Controller/scolarite_validation.dart';
import '../../Create/widget/info_echelon_scolarite.dart';
import '../../Create/widget/info_form_frais_scolaire.dart';
import '../widget/info_niveau_serie.dart';

class TUpdateScolariteDesktopScreen extends StatelessWidget {
   final controller =Get.find<TScolariteController>();
  TUpdateScolariteDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final validations=TScolariteValidation();
   double width =TDeviceUtility.isDesktopScreen(context)?MediaQuery.of(context).size.width*0.2:
   TDeviceUtility.isMobileScreen(context)? MediaQuery.of(context).size.width*0.5:MediaQuery.of(context).size.width*0.3;
   AlignmentGeometry alignment = TDeviceUtility.isDesktopScreen(context)?Alignment.centerLeft:Alignment.center;
    return  TCreateForm(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           ///// HEADER
          TRetourHeader(titre:"Modification de la scolarite",route: TRoutes.scolarite,),
          SizedBox(height: TSizes.spaceBtwItems,),

          /////// NIVEAU SEERIE 
          Align(
            alignment:alignment,
            child: SizedBox(
               width: width,
              child: TRoundedContainerCreate(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: NiveauSerieScolaire(controller: controller,),)),
          ),
          SizedBox(height: TSizes.sm,),
          ////// FORMULAIRE DE PAIEMENT  
            Align(
               alignment:alignment,
              child: SizedBox(
               width: width,
               height: 240,
              child: TRoundedContainerCreate(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: TScolariteFormFraisScolaire(alignment: WrapAlignment.start,controller: controller,),)),
            ),
           SizedBox(height: TSizes.sm,),
             ////// MODALITE DE PAIEMENT
             Align(
               alignment:alignment,
               child: SizedBox(
               width: width,
                           child: TRoundedContainerCreate(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: TScolariteEchelonVersement(alignment: WrapAlignment.center,controller: controller,))),
             ), 
             SizedBox(height: TSizes.md,),
               ///// BUTTON VALIDER
            Align(
               alignment:alignment,
              child: SizedBox(
                width: width,
                child: Align(
                  child:SizedBox(
                    width:TDeviceUtility.isDesktopScreen(context)? MediaQuery.of(context).size.width*0.1:  MediaQuery.of(context).size.width*0.4,
                    child: TButton.elevatedButton(text:"Valider",onPressed: ()=>validations.H_Modifier()),
                  ) ,
                ),
              ),
            )
        ],
      )
    );
  }
}

