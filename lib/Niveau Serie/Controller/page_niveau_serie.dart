import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Niveau%20Serie/Controller/niveau_serie_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/enums.dart';
import '../../Configs/utils/Implements/page_data.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../Screen/Widget/form_niveau_serie.dart';
import 'validation_nivau_serie.dart';

class TNiveauSeriePage  with TPageData {
  final controller = Get.find<TNiveauSerieController>();

 @override
  H_PageShowDialogNouveau() {
    controller.H_Initialise();
    controller.H_Clear();
    controller.action = TraitementAction.nouveau.name;
    TShowdialogue.showWidget(
      titre: TText.enregistrement.tr,
      widgets: SizedBox(width: 350,height: 380,
        child:FormNiveauSerie(
          onPressed: () => TNiveauSerieValidation().H_Enregistrer(),
        )),
        );
  }

 @override
  H_PageShowDialogModifier({int? id }) {
    controller.action = TraitementAction.modifier.name;
     controller.H_RecupeModif(id: id);
     TShowdialogue.showWidget(
      titre: TText.modification.tr,
      widgets: SizedBox(
        width: 350,
        height: 380,
        child:FormNiveauSerie(
          onPressed:  () => TNiveauSerieValidation().H_Modifier(),
        )),
        );
  }

 
}