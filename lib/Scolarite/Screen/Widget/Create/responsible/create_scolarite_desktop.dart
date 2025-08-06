import 'package:ecole/Configs/cammon/widgets/buttons/button.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Configs/utils/Device/devices_utility.dart';
import 'package:ecole/Scolarite/Controller/scolarite_controller.dart';
import 'package:ecole/Scolarite/Controller/scolarite_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Configs/cammon/widgets/Create_form/create_form.dart';
import '../../../../../Configs/routes/route.dart';
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
      route: TRoutes.scolarite,
      titre: TText.Scolarite,
      child: SizedBox(
        width: 460,
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///// SELECTION NIVEAU SCOLAIRE
            SizedBox(
             width: MediaQuery.of(context).size.width,
              child: TScolariteSelectNiveauSerie(controller: controller,)),
            
            SizedBox(
             width: double.infinity,
              child: TScolariteFormFraisScolaire(controller: controller,)),
              SizedBox(
             width: MediaQuery.of(context).size.width,
              child: TScolariteEchelonVersement(controller: controller,)),
            
              ///// BUTTON VALIDER
              Align(
                alignment:TDeviceUtility.isDesktopScreen(context)? Alignment.centerLeft: Alignment.center,
                child:SizedBox(
                  width:TDeviceUtility.isDesktopScreen(context)? MediaQuery.of(context).size.width*0.1:  MediaQuery.of(context).size.width*0.4,
                  child: TButton.elevatedButton(text:"Valider",onPressed: ()async=>await validations.H_Enregistrer()),
                ) ,
              )
          ],
        ),
      ),
    );
  }
}

