import 'package:ecole/Configs/utils/Implements/filtre_data.dart';
import 'package:get/get.dart';

import 'employe_controller.dart';


class TEmployeFiltre with TFiltre {
  
    final controller = Get.find<TEmployeController>();
  
   
  @override
  void H_FiltreElement({String param = ""}) {
   controller.DataTableFiltreEmploye.value = controller.DataTableEmploye.where(
    (e)=> e.Nom.toString().toLowerCase().contains(param.toLowerCase())  
    || e.Prenoms.toString().toLowerCase().contains(param.toLowerCase())
    ).toList();
   
  }

  @override
  H_FiltreElementParID({int? id}) {
    final index = controller.DataTableEmploye.indexWhere((e)=> e.IDEmploye==id );
    if(index==-1) return;
    controller.DataEmploye.value = controller.DataTableEmploye[index];
  }

  @override
  H_Verification({String param = ""}) {
    final index = controller.DataTableEmploye.indexWhere(
      (e)=> e.NomComplet.toString().trim().toLowerCase()==param.trim().toLowerCase() );
    return index;
  }
  
  @override
  H_VerificationMatricule({String param = ""}) {
   final index = controller.DataTableEmploye.indexWhere(
      (e)=> e.MatriculeEmploye.toString().trim().toString()==param.trim().toLowerCase() );
    return index;
  }

}