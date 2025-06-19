import 'package:ecole/Matiere%20coef/Controller/matierecoef_controller.dart';
import 'package:get/get.dart';

import '../../Niveau Serie/Model/niveau_serie_model.dart';

class TCoefficientNiveauSerie {
   final controller = Get.find<TCoefficientController>();

  void H_RecupeData(){
     controller.dataNiveauSerie = TNiveauSerieModel();
     controller.isSelectNiveauSerie.value = controller.controllerNiveauSerie.dataTableNiveauSerie.where(
        (e)=> e.typeEnseignement == controller.controllerCycle.datacyleModel.cycleScolaire
        ).map((e)=> e.niveauSerie.toString()).toList();
  }


  void H_onSelectData({String? param}){
   int index = controller.controllerNiveauSerie.dataTableNiveauSerie.indexWhere(
     (e)=> e.niveauSerie == param
   );
  if(index ==-1) return;
  controller.dataNiveauSerie = controller.controllerNiveauSerie.dataTableNiveauSerie[index];
  }
}

