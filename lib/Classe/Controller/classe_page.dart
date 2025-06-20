import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Implements/page_data.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../Screen/Widget/show_classe_dialog.dart';
import 'classe_controller.dart';

class TClassePage with TPageData{
   final controller = Get.find<TClasseController>();

   @override
  H_PageNouveau() {
   controller.H_Initialise();
   Get.offNamed(TRoutes.registerclasse,arguments:TraitementAction.nouveau.name );
  }

  @override
  H_PageModifier({int? id}) {
   
    controller.H_RecupeModif(id: id);
   Get.offNamed(TRoutes.registerclasse,arguments:TraitementAction.modifier.name);
  }
  @override
  H_PageDetail({int? id}) {
     controller.H_RecupeModif(id: id);
   Get.offNamed(TRoutes.registerclasse,arguments:TraitementAction.detail.name);
  }

  @override
  H_PageShowDialogNouveau() {
    controller.variable.H_Initialise();
    TShowdialogue.showWidget(
      titre: "Enregistrement",
      widgets: ShowClasseDialog(argument: TraitementAction.nouveau.name,));
  }

  @override
  H_PageShowDialogModifier({int? id}) {
    controller.H_RecupeModif(id: id);
    TShowdialogue.showWidget(
      titre: "Modification",
      widgets: ShowClasseDialog(argument: TraitementAction.modifier.name,));
  }
}