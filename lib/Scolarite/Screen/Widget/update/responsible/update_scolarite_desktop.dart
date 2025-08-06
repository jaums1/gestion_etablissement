import 'package:ecole/Configs/cammon/widgets/containers/rounded_container_create.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/Create_form/create_form.dart';
import '../../../../../Configs/cammon/widgets/buttons/button.dart';
import '../../../../../Configs/routes/route.dart';
import '../../../../../Configs/utils/Constant/texte_string.dart';
import '../../../../../Configs/utils/Device/devices_utility.dart';
import '../../../../Controller/scolarite_controller.dart';
import '../../../../Controller/scolarite_validation.dart';
import '../../Create/widget/info_echelon_scolarite.dart';
import '../../Create/widget/info_form_frais_scolaire.dart';
import '../widget/info_niveau_serie.dart';

class TUpdateScolariteDesktopScreen extends StatelessWidget {
  
 const TUpdateScolariteDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final controller =Get.find<TScolariteController>();
  
    return  TCreateForm(
      route: TRoutes.scolarite,
      titre: TText.Scolarite,
      child: SizedBox(
        width: 460,
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            /////// NIVEAU SEERIE 
            TRoundedContainerCreate(child: NiveauSerieScolaire(controller: controller,),),

            ////// FORMULAIRE DE PAIEMENT  
              TScolariteFormFraisScolaire(controller: controller,),
             
               ////// MODALITE DE PAIEMENT
               TScolariteEchelonVersement(controller: controller,), 
              
                 ///// BUTTON VALIDER
              Align(
                alignment: Alignment.centerLeft,
                child:SizedBox(
                  width:TDeviceUtility.isDesktopScreen(context)? MediaQuery.of(context).size.width*0.1:  MediaQuery.of(context).size.width*0.4,
                  child: TButton.elevatedButton(text:"Valider",onPressed: ()=>TScolariteValidation().H_Modifier()),
                ) ,
              )
          ],
        ),
      )
    );
  }
}

