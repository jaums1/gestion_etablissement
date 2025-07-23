import 'package:ecole/Coefficient/Model/matierecoef_model.dart';
import 'package:ecole/Configs/utils/Implements/filtre_data.dart';
import 'package:ecole/Coefficient/Controller/matierecoef_controller.dart';
import 'package:ecole/Matiere/Controller/filtre_matiere.dart';
import 'package:get/get.dart';

import '../../Matiere/Controller/matiere_controller.dart';
import '../Model/listematierecoef_model.dart';

class TFiltreCoefficient with TFiltre {
    final controller = Get.find<TCoefficientController>();
    final controllerMatiere = Get.find<TMatiereController>();
   
    
  @override
  void H_FiltreElement({String param = ""}) {
   controller.dataTableFiltreMatiere.value = controllerMatiere.DataTableMatiere.where(
    (e)=> e.matiere!.toLowerCase().contains(param.toLowerCase())  && e.etat==true
    ).toList();
  }

 H_FitreParNiveauSerie({int? IDNiveauSerie,int? IDMatiere=0}){
   controller.DataCoefficient= controller.DataTableCoefficient.firstWhere((e)=> 
   e.DataNiveauSerie!.iDNiveauSerie==IDNiveauSerie,orElse: () => TCoefficientModel(),);
  if(IDMatiere==0 || IDMatiere==null) return;
   H_FitreParMatiere(id:IDMatiere );
 }

 H_FitreParMatiere({int? id}){
  
  int index =  controller.DataCoefficient.DataTableMatiereCoef!.firstWhere(
    (e)=> e.IDMatiere==id,orElse: () => TListeMatiereCoef(IDMatiere: 0),).IDMatiere!;

  if(index==0) return;
   TFiltreMatiere().H_FiltreElementParID(id: index);
 }


}