import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Implements/page_data.dart';
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
}