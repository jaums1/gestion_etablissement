import 'package:ecole/Configs/utils/Implements/filtre_data.dart';
import 'package:get/get.dart';

import 'scolarite_controller.dart';


class TScolariteFiltre with TFiltre {
  
    final controller = Get.find<TScolariteController>();
  
   
  @override
  void H_FiltreElement({String param = ""}) {
   controller.DataTableFiltreScolarite.value = controller.DataTableScolarite.where(
    (e)=> e.DataNiveauScolaire!.niveau.toString().contains(param)
    ).toList();
   
  }

  @override
  H_FiltreElementParID({int? id}) {
    final index = controller.DataTableScolarite.indexWhere((e)=> e.IDScolarite==id );
    if(index==-1) return;
    controller.DataScolarite.value = controller.DataTableFiltreScolarite[index];
  }

 H_RecupeParNiveauScolaire({int? id}){
   controller.H_Initialise();
   final index = controller.DataTableScolarite.indexWhere((e)=> e.IDNiveauScolaire==id );
    if(index==-1) return;
    controller.DataScolarite.value = controller.DataTableFiltreScolarite[index];
  
 }

  // H_RecupeVersement({String? param}){
  //   final index= controller.variable.DataTableModalitePaiement.indexWhere(
  //     (e)=> e.LibVersement==param
  //     );
  //    return index; 
  // }
}