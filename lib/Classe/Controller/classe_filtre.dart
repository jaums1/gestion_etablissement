import 'package:ecole/Configs/utils/Implements/filtre_data.dart';
import 'package:get/get.dart';

import '../../Scolarite/Controller/scolarite_filtre.dart';
import 'classe_controller.dart';


class TClasseFiltre with TFiltre {
  
    final controller = Get.find<TClasseController>();
    final filtreScolarite = TScolariteFiltre();
   
  @override
  void H_FiltreElement({String param = ""}) {
   controller.DataTableFiltreClasse.value = controller.DataTableClasse.where(
    (e)=> e.DataNiveauSerie!.niveauSerie.toString().toLowerCase().contains(param.toLowerCase())  
    || e.LibClasse.toString().toLowerCase().contains(param.toLowerCase())
    ).toList();
   
  }

  @override
  H_FiltreElementParID({int? id}) {
    final index = controller.DataTableClasse.indexWhere((e)=> e.IDClasse==id );
    if(index==-1) return;
    controller.DataClasse.value = controller.DataTableFiltreClasse[index];
  }

  @override
  H_Verification({String param = ""}) {
    final index = controller.DataTableClasse.indexWhere((e)=> e.LibClasse!.trim().toLowerCase()==param.trim().toLowerCase() );
     return index;
    
  }

   void H_SelectClasseNiveauSerieParID({String? param}){
   final index = controller.DataTableClasse.indexWhere((e)=> e.LibClasse==param);
    if(index==-1) return;
   controller.DataClasse.value = controller.DataTableClasse[index];
   filtreScolarite.H_RecupeParNiveauSerie(id: controller.DataClasse.value.IDNiveauSerie);
   controller.edite.value=true;
   controller.edite.value=false;
 }

}