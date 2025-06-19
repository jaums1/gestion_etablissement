import 'package:ecole/Configs/cammon/widgets/buttons/button.dart';
import 'package:ecole/Configs/utils/Device/devices_utility.dart';
import 'package:ecole/Scolarite/Controller/scolarite_controller.dart';
import 'package:ecole/Scolarite/Controller/scolarite_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Configs/Breadcrumbs/breadcrumb.dart';
import '../../../../../Configs/cammon/widgets/Create_form/create_form.dart';
import '../../../../../Configs/routes/route.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../widget/info_echelon_scolarite.dart';
import '../widget/info_form_frais_scolaire.dart';
import '../widget/info_select_niveauserie.dart';


class TCreateScolariteDesktopScreen extends StatelessWidget {
  final controller =Get.find<TScolariteController>();
   TCreateScolariteDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final validations=TScolariteValidation();
    return  TCreateForm(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///// HEADER
            TRetourHeader(titre:"Enregistrement de scolarite",route: TRoutes.scolarite,),
            SizedBox(height: TSizes.spaceBtwItems,),
          SizedBox(
           width: MediaQuery.of(context).size.width,
            child: TScolariteSelectNiveauSerie(controller: controller,)),
          
          SizedBox(
           width: MediaQuery.of(context).size.width,
            child: TScolariteFormFraisScolaire(controller: controller,)),
            SizedBox(
           width: MediaQuery.of(context).size.width,
            child: TScolariteEchelonVersement(controller: controller,)),
          
            ///// BUTTON VALIDER
            Align(
              alignment:TDeviceUtility.isDesktopScreen(context)? Alignment.centerRight: Alignment.center,
              child:SizedBox(
                width:TDeviceUtility.isDesktopScreen(context)? MediaQuery.of(context).size.width*0.1:  MediaQuery.of(context).size.width*0.4,
                child: TButton.elevatedButton(text:"Valider",onPressed: ()=>validations.H_Enregistrer()),
              ) ,
            )
        ],
      ),
    );
  }
}

