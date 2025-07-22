
import 'package:ecole/Niveau%20Serie/Model/niveau_serie_model.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Implements/function_data.dart';
import 'niveau_serie_controller.dart';


class TNiveauSerieFunction with TFunctionData {
  final controller = Get.find<TNiveauSerieController>();
 
  H_SelectNiveauSerie(TNiveauSerieModel? param){
   final index = controller.DataTableSelectNiveauSerie.indexWhere(
    (e)=> e==param
   );
   index==-1?controller.DataTableSelectNiveauSerie.add(param!)
   :controller.DataTableSelectNiveauSerie.removeAt(index);
  
  }
  
}