import 'package:ecole/Configs/utils/Implements/filtre_data.dart';
import 'package:ecole/Eleves/Controller/eleve_controller.dart';
import 'package:get/get.dart';


class TFiltreEleve with TFiltre {
  
    final controller = Get.find<TEleveController>();
  
   
  @override
  void H_FiltreElement({String param = ""}) {
   controller.DataTableFiltreEleve.value = controller.DataTableEleve.where(
    (e)=> e.Nom.toString().toLowerCase().contains(param.toLowerCase())  
    || e.Prenoms.toString().toLowerCase().contains(param.toLowerCase())
    || e.Matricule.toString().toLowerCase().contains(param.toLowerCase())
    ).toList();
   
  }

  @override
  H_FiltreElementParID({int? id}) {
    final index = controller.DataTableEleve.indexWhere((e)=> e.IDEtudiant==id );
    if(index==-1) return index;
    controller.DataEleve.value = controller.DataTableEleve[index];
   
  }
  H_FiltreParID({int? id}){
    final index = controller.DataTableEleve.indexWhere((e)=> e.IDEtudiant==id );
    if(index==-1) return ;
     return controller.DataTableEleve[index];
    
  }
  @override
   H_Verification({String param = ""}) {
    final index = controller.DataTableEleve.indexWhere((e)=> e.Matricule!.trim().toLowerCase()==param.trim().toLowerCase() );
     return index;
    
  }

}