import 'package:ecole/Configs/utils/Implements/filtre_data.dart';
import 'package:get/get.dart';

import '../../Scolarite/Controller/scolarite_filtre.dart';
import '../Model/classe_model.dart';
import 'classe_controller.dart';


class TClasseFiltre with TFiltre {
  
    final controller = Get.find<TClasseController>();
    final filtreScolarite = TScolariteFiltre();
    
   void H_FiltreElementParIDNiveauSerie({String param = "",List<TClasseModel>? DataTableClasse,int? length}){
    if(length==0) return;
     controller.DataTableFiltreClasse.value = DataTableClasse!.where(
    (e)=> e.DataNiveauSerie!.niveauSerie.toString().toLowerCase().contains(param.toLowerCase())  
    || e.LibClasse.toString().toLowerCase().contains(param.toLowerCase())
    ).toList();
   }
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
    if(index==-1) return index;
    controller.DataClasse.value = controller.DataTableFiltreClasse[index];
  }
 H_FiltreParID({int? id}){
   final index = controller.DataTableClasse.indexWhere((e)=> e.IDClasse==id );
    if(index==-1) return;
   return controller.DataTableFiltreClasse[index];
 }
  @override
  H_Verification({String param = ""}) {
    final index = controller.DataTableClasse.indexWhere((e)=> e.LibClasse!.trim().toLowerCase()==param.trim().toLowerCase() );
     return index;
    
  }

   void H_SelectClasseNiveauSerieParID({String? param}){
    controller.H_Initialise();
   final index = controller.DataTableClasse.indexWhere((e)=> e.LibClasse==param);
    if(index==-1) return;
   controller.DataClasse.value = controller.DataTableClasse[index];
   filtreScolarite.H_RecupeParNiveauSerie(id: controller.DataClasse.value.IDNiveauSerie);
   controller.edite.value=true;
   controller.edite.value=false;
 }

}