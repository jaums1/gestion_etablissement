import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Implements/page_data.dart';
import 'inscription_controller.dart';

class TInscriptionPage with TPageData {
  final controller = Get.find<TInscriptionController>();

  @override
  H_PageNouveau() {
    controller.H_Initialise();
    Get.offNamed(TRoutes.registerinscription, arguments: TraitementAction.nouveau.name);
  }

  @override
  H_PageModifier({int? id}) {
    controller.H_RecupeModif(id: id);
    Get.offNamed(TRoutes.registerinscription, arguments: TraitementAction.modifier.name);
  }

  @override
  H_PageDetail({int? id}) {
    controller.H_RecupeModif(id: id);
    Get.offNamed(TRoutes.registerinscription, arguments: TraitementAction.detail.name);
  }
} 