import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Implements/page_data.dart';
import '../../Modalite_Paiement/Controller/modalite_paiement_controller.dart';
import 'scolarite_controller.dart';

class TScolaritePage with TPageData{
   final controller = Get.find<TScolariteController>();
    final controllerMP               = Get.find<TModalitePaiementController>();
   @override
  H_PageNouveau() {
   controller.H_Initialise();
   controllerMP.DataTableModalitePaiement.clear();
   Get.offNamed(TRoutes.registerscolarite,arguments:TraitementAction.nouveau.name );
  }

  @override
  H_PageModifier({int? id}) {
    
   controllerMP.DataTableModalitePaiement.clear();
   
    controller.H_RecupeModif(id: id);
    if(controller.DataScolarite.value.DataTable !=null){
      // final nb =
      controllerMP.DataTableModalitePaiement.value=controller.DataScolarite.value.DataTable!.map((e)=> e.copyWith()).toList();
    }
   
   Get.offNamed(TRoutes.updatecolarite,arguments:TraitementAction.modifier.name);
  }
  @override
  H_PageDetail({int? id}) {
     controller.H_RecupeModif(id: id);
     if(controller.DataScolarite.value.DataTable !=null){
       controllerMP.DataTableModalitePaiement.value=controller.DataScolarite.value.DataTable!.map((e)=> e.copyWith()).toList();
    }
   Get.offNamed(TRoutes.registerscolarite,arguments:TraitementAction.detail.name);
  }
}