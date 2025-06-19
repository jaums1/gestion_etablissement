import 'package:ecole/Niveau%20Serie/Controller/niveau_serie_controller.dart';
import 'package:get/get.dart';

class TRecuperationDataNiveuSerie {
  final controller = Get.find<TNiveauSerieController>();
  //// RECUPERATION NIVEAU
   H_RecupeDataNiveauParID({int? id}){

   final index = controller.dataTableNiveauSerie.indexWhere((e)=> e.iDNiveauSerie==id); 
  if(index ==-1) return false;
    final data = controller.dataTableNiveauSerie[index];
   return data;
     
  }

  
   H_RecupeDataNiveauParNiveauSerie({String? param}){
  
   final index = controller.dataTableNiveauSerie.indexWhere((e)=> e.niveauSerie!.toLowerCase()==param!.toLowerCase()); 
  if(index ==-1) return false;
    final data = controller.dataTableNiveauSerie[index];
   return data;
   
  }


  }