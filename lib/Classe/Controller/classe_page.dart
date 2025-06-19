import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Implements/page_data.dart';
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
}