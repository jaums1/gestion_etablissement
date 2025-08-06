
import 'package:get/get.dart';
import '../../Configs/utils/Implements/function_data.dart';
import '../../Niveau_Scolaire/Controller/niveauscolaire_controller.dart';
import 'scolarite_controller.dart';

class TScolariteFunction with TFunctionData {
 
  final controller = Get.find<TScolariteController>();
  final controllerNS = Get.find<TNiveauScolaireController>();


 void H_OnchangeNiveauScolaire(){
   
   controller.variable.DataTableNiveauScolaire = controllerNS.DataTableNiveauEtude.map(
    (e)=>e).toList();
    
   
   Get.back();
 }
  
void H_OnchangeSupprime(param){
  controller.variable.DataTableNiveauScolaire.remove(param);
  controller.DataTableNiveauScolaire.value = controller.variable.DataTableNiveauScolaire;
  controller.DataTableNiveauScolaire.refresh();
  // controllerNS.DataTableSelectNiveauSerie.remove(param);

  }


 

}