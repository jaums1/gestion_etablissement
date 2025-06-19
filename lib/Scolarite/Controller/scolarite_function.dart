
import 'package:get/get.dart';
import '../../Configs/utils/Implements/function_data.dart';
import '../../Niveau Serie/Controller/niveau_serie_controller.dart';
import 'scolarite_controller.dart';

class TScolariteFunction with TFunctionData {
 
  final controller = Get.find<TScolariteController>();
  final controllerNS = Get.find<TNiveauSerieController>();


 void H_OnchangeNiveauSerie(){
    print(controllerNS.dataTableSelectNiveauSerie.length);
   controller.variable.DataTableNiveauSerie.value = controllerNS.dataTableSelectNiveauSerie.map(
    (e)=>e).toList();
     print(controller.variable.DataTableNiveauSerie.length);
   
   Get.back();
 }
  
void H_OnchangeSupprime(param){
  controller.variable.DataTableNiveauSerie.remove(param);
  controllerNS.dataTableSelectNiveauSerie.remove(param);

  }


 

}