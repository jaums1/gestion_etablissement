import 'package:ecole/Configs/utils/Implements/filtre_data.dart';
import 'package:ecole/Matiere/Controller/matiere_controller.dart';
import 'package:get/get.dart';

class TFiltreMatiere with TFiltre {
    final controller = Get.find<TMatiereController>();
    
  @override
  void H_FiltreElement({String param = ""}) {
   controller.dataTableFiltreMatiere.value = controller.dataTableMatiere.where(
    (e)=> e.matiere!.toLowerCase().contains(param.toLowerCase())
    ).toList();
  }



}