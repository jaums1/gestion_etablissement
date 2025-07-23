import 'package:ecole/Configs/utils/Implements/filtre_data.dart';
import 'package:ecole/Matiere/Controller/matiere_controller.dart';
import 'package:ecole/Matiere/Model/matiere_model.dart';
import 'package:get/get.dart';

class TFiltreMatiere with TFiltre {
    final controller = Get.find<TMatiereController>();
    
  @override
  void H_FiltreElement({String param = ""}) {
   controller.DataTableFiltreMatiere.value = controller.DataTableMatiere.where(
    (e)=> e.matiere!.toLowerCase().contains(param.toLowerCase())
    ).toList();
  }

  @override
  H_FiltreElementParID({int? id}) {
    controller.DataMatiere.value = controller.DataTableMatiere.firstWhere(
    (e)=> e.iDMatiere==id,orElse: () => TMatiereModel(),);
  }

}