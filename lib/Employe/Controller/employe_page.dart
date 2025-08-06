import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Employe/Screen/Widget/Create/widget/form_employe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/colors.dart';
import '../../Configs/utils/Implements/page_data.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import 'employe_controller.dart';

class TEmployePage with TPageData{
   final controller = Get.find<TEmployeController>();

   @override
  H_PageNouveau() {
   controller.H_Initialise();
   Get.offNamed(TRoutes.registeremploye,arguments:TraitementAction.nouveau.name );
  }

  @override
  H_PageModifier({int? id}) {
    controller.H_RecupeModif(id: id);
   Get.offNamed(TRoutes.registeremploye,arguments:TraitementAction.modifier.name);
  }
  @override
  H_PageDetail({int? id}) {
     controller.H_RecupeModif(id: id);
   Get.offNamed(TRoutes.registeremploye,arguments:TraitementAction.detail.name);
  }

  @override
  H_PageShowDialogNouveau() {
     controller.H_Initialise();
    TShowdialogue.showWidget(
      color:  TColors.primaryBackground,
      titre: TText.enregistrement,
      widgets: SizedBox(
         width: MediaQuery.of(Get.context!).size.width*0.6,
        child: SingleChildScrollView(child: FormEmploye(showdialog: true, arg: TraitementAction.nouveau.name,))));

  }
 
 
 @override
  H_PageShowDialogModifier({int? id}) {
   controller.H_RecupeModif(id: id); 
   TShowdialogue.showWidget(
      color:  TColors.primaryBackground,
      titre: TText.modification,
      widgets: SizedBox(
        width: MediaQuery.of(Get.context!).size.width*0.6,
        child: SingleChildScrollView(child: FormEmploye(showdialog: true, arg: TraitementAction.modifier.name,))));
  }

}