import 'package:get/get.dart';

import '../../Configs/utils/Implements/function_data.dart';
import 'modalite_paiement_controller.dart';


class TModalitePaiementFunction with TFunctionData {
  final controller = Get.find<TModalitePaiementController>();
 


 void H_OnChangedJour(param){
   controller.variable.Jour.text = param;
    controller.variable.JourMois.text = "$param ${controller.variable.Mois.text.toString()}";
  } 
  
   void H_OnChangedJourRappel(param){
   controller.variable.JourRappel.text = param;
   controller.variable.JourRappelMois.text = "$param ${controller.variable.Mois.text.toString()}";
  } 

   void H_OnChangedMois(param){
   controller.variable.Mois.text = param;
   controller.variable.JourMois.text = "${controller.variable.Jour.text.toString()} $param";
   controller.variable.JourRappelMois.text = "${controller.variable.JourRappel.text.toString()} $param";
  } 

 

}