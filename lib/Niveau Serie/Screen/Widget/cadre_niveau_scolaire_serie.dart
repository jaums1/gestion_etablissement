import 'package:ecole/Configs/cammon/widgets/combo/combo.dart';
import 'package:ecole/Niveau%20Serie/Controller/niveau_serie_controller.dart';
import 'package:ecole/Niveau_Scolaire/Controller/niveauscolaire_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Configs/utils/Constant/sizes.dart';

class TCadreNiveauScolaireSerie extends StatelessWidget {
  const TCadreNiveauScolaireSerie({super.key});
 
  @override
  Widget build(BuildContext context) {
     final combo =TCombo();
     final controllerNiveau = Get.find<TNiveauScolaireController>();
     final controller = Get.find<TNiveauSerieController>();
    return  Obx(() => Padding(
          padding: EdgeInsets.only(bottom: TSizes.md),
          child: Container(
            decoration: BoxDecoration(color: Colors.white,),
             child:Padding(padding: EdgeInsets.symmetric(vertical: 16,horizontal: 30),
             child:Center(child:  combo.comboTextChevale(
              valeur: controller.dataNiveauModel.niveau,
              hintText: "Selectionner votre niveau scolaire",
              sections: controllerNiveau.isSelectNiveau,
             label: "Niveau scolaire",onChanged: controller.onSelectCombo),
             ),
             ) ,
            ),
            
            )
            );
  }
}