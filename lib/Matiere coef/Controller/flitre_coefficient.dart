import 'package:ecole/Configs/utils/Implements/filtre_data.dart';
import 'package:ecole/Matiere%20coef/Controller/matierecoef_controller.dart';
import 'package:get/get.dart';

import '../../Matiere/Controller/matiere_controller.dart';

class TFiltreCoefficient with TFiltre {
    final controller = Get.find<TCoefficientController>();
    final controllerMatiere = Get.find<TMatiereController>();
   
    
  @override
  void H_FiltreElement({String param = ""}) {
   controller.dataTableFiltreMatiere.value = controllerMatiere.DataTableMatiere.where(
    (e)=> e.matiere!.toLowerCase().contains(param.toLowerCase())  && e.etat==true
    ).toList();
  }

// void H_FiltreCoefficient({String param = ""}){
//   controller.DataTableFiltreCoefficient.value = controller.DataTableCoefficient.where(
//     (e)=> e.niveauSerie!.toLowerCase().contains(param.toLowerCase())
//     ).toList();
// }


}