import 'package:ecole/Configs/utils/Implements/filtre_data.dart';
import 'package:get/get.dart';
import 'niveauscolaire_controller.dart';


class TNiveauScolaireFiltre with TFiltre {
  
    final controller = Get.find<TNiveauScolaireController>();
  
   
  @override
  void H_FiltreElement({String param = ""}) {
   controller.DataTableNiveauEtudeFiltre.value = controller.DataTableNiveauEtude.where(
    (e)=> e.niveau.toString().toLowerCase().contains(param.toLowerCase())  
    ).toList();
   
  }

  @override
  H_FiltreElementParID({int? id}) {
    final index = controller.DataTableNiveauEtude.indexWhere((e)=> e.iDNiveauScolaire==id );
    if(index==-1) return;
    controller.DataNiveau.value = controller.DataTableNiveauEtude[index];
  }

  @override
  H_Verification({String param = ""}) {
    final index = controller.DataTableNiveauEtude.indexWhere(
      (e)=> e.niveau.toString().trim().toLowerCase()==param.trim().toLowerCase() );
    return index;
  }
  
 

}