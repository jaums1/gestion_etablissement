
import 'package:get/get.dart';
import '../../Configs/utils/Implements/function_data.dart';
import '../../Niveau Serie/Controller/niveau_serie_controller.dart';
import 'scolarite_controller.dart';

class TScolariteFunction with TFunctionData {
 
  final controller = Get.find<TScolariteController>();
  final controllerNS = Get.find<TNiveauSerieController>();


 void H_OnchangeNiveauSerie(){
   
   controller.variable.DataTableNiveauSerie.value = controllerNS.DataTableSelectNiveauSerie.map(
    (e)=>e).toList();
    
   
   Get.back();
 }
  
void H_OnchangeSupprime(param){
  controller.variable.DataTableNiveauSerie.remove(param);
  controllerNS.DataTableSelectNiveauSerie.remove(param);

  }


 

}