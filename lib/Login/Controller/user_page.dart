import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Implements/page_data.dart';
import 'user_controller.dart';


class TUtilisateurPage with TPageData {
  final controller = Get.find<TUserController>();
  @override
  H_PageNouveau() {
  controller.H_Initialise();
  controller.variable.clear();
  Get.offNamed(TRoutes.registerutilisateur,arguments: TraitementAction.nouveau.name); 
   
  }

  @override
  H_PageModifier({int? id}) {
      controller.H_RecupeModif(id: id);
    Get.offNamed(TRoutes.registerutilisateur, arguments: TraitementAction.modifier.name);
  }

  
} 