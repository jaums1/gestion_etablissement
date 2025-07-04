import 'package:ecole/Configs/utils/Dates/showdata.dart';
import 'package:ecole/Configs/utils/formatters/formatters.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Implements/function_data.dart';
import '../../Inscription/Controller/inscription_controller.dart';
import 'eleve_controller.dart';

class TEleveFunction with TFunctionData {
  final controller = Get.find<TEleveController>();
  final controllerInscription = Get.find<TInscriptionController>();
  void H_OnChangedSexe(param){
   controller.variable.sexe.text = param;
  }
   
  void H_OnChangedStatut(param){
   controller.variable.statut.text = param;
  } 
  void H_OnChangedRegime(param){
   controller.variable.regime.text = param;
  } 
   void H_OnChangedDate()async{
   final date= await TShowDate().H_RecupDate();
   controller.variable.dateNaissance.value.text = TFormatters.formatDateFr(date).toString();
   controller.variable.dateNaissanceValide.value.text =TFormatters.formatDateAng(date).toString();
   controller.DataEleve.value.DateNaissance = date;
  }  
  

}