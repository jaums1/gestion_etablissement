import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/colors.dart';
import '../../Configs/utils/Implements/page_data.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../Screen/Widget/show_eleve_dialog.dart';
import 'eleve_controller.dart';

class TElevePage with TPageData{
   final controller = Get.find<TEleveController>();

   @override
  H_PageNouveau() {
 
   controller.H_Initialise();
   Get.offNamed(TRoutes.registereleve,arguments: TraitementAction.nouveau.name);
  }

  @override
  H_PageModifier({int? id}) {
    controller.H_RecupeModif(id: id);

   Get.offNamed(TRoutes.registereleve,arguments:TraitementAction.modifier.name );
  }
  @override
  H_PageDetail({int? id}) {
     controller.H_RecupeModif(id: id);
  
   Get.offNamed(TRoutes.registereleve,arguments: TraitementAction.detail.name);
  }

 @override
  H_PageShowDialogNouveau() {
    controller.variable.H_Initialise();
    TShowdialogue.showWidget(
      color:  TColors.softGrey,
      titre: "Enregistrement",
      widgets: ShowEleveDialog(argument: TraitementAction.nouveau.name,));
  }

  @override
  H_PageShowDialogModifier({int? id}) {
    controller.H_RecupeModif(id: id);
    TShowdialogue.showWidget(
       color:  TColors.softGrey,
      titre: "Modification",
      widgets: ShowEleveDialog(argument: TraitementAction.modifier.name,));
  }


}