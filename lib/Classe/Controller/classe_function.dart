
import 'package:get/get.dart';
import '../../Configs/utils/Implements/function_data.dart';
import '../../Niveau Serie/Controller/recupeniveauserie_data.dart';

import 'classe_controller.dart';

class TClasseFunction with TFunctionData {
  final controller = Get.find<TClasseController>();
  final recupData = TRecuperationDataNiveuSerie();

  void H_OnChangedNiveauSerie(param){

  
   controller.DataClasse.DataNiveauSerie =  recupData.H_RecupeDataNiveauParNiveauSerie(param: param);
   controller.variable.IDNiveauSerie.text = controller.DataClasse.DataNiveauSerie!.iDNiveauSerie.toString();
   controller.variable.IDEtablissement.text = controller.DataClasse.DataNiveauSerie!.iDEtablissement.toString();
   controller.variable.NiveauSerie.value.text = controller.DataClasse.DataNiveauSerie!.niveauSerie.toString();
   controller.variable.LibClasse.text = controller.DataClasse.DataNiveauSerie!.niveauSerie.toString();
  }

  
  void H_OnChangedNiveauSerieID({int? id}){  
   controller.DataClasse.DataNiveauSerie =  recupData.H_RecupeDataNiveauParID(id: id);
   controller.variable.IDNiveauSerie.text = controller.DataClasse.DataNiveauSerie!.iDNiveauSerie.toString();
   controller.variable.IDEtablissement.text = controller.DataClasse.DataNiveauSerie!.iDEtablissement.toString();
   controller.variable.NiveauSerie.value.text = controller.DataClasse.DataNiveauSerie!.niveauSerie.toString();
  }



}