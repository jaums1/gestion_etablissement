import 'package:ecole/Configs/utils/Dates/showdata.dart';
import 'package:ecole/Configs/utils/formatters/formatters.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Implements/function_data.dart';
import 'employe_controller.dart';

class TEmployeFunction with TFunctionData {
  final controller = Get.find<TEmployeController>();
  void H_OnChangedSexe(param){
   controller.variable.Sexe.text = param;
  }  
  void H_OnChangedEtatCivil(param){
   controller.variable.EtatCivil.text = param;
  }
    void H_OnChangedDepartement(param){
   controller.variable.Departement.text = param;
  }
   
  void H_OnChangedStatut(param){
   controller.variable.Statut.text = param;
  } 
  
  void H_OnChangedFonction(param){
   controller.variable.Fonction.text = param;
  }   
  void H_OnChangedTypeSalaire(param){
   controller.variable.TypeSalaire.text = param;
  }  
  void H_OnChangedNationnalite(param){
   controller.variable.Nationnalite.text = param;
  } 
  
  void H_OnChangedTypeContrat(param){
   controller.variable.TypeContrat.text = param;
  } 

   void H_OnChangedDateNaissance()async{
   final date= await TShowDate().H_RecupDate();
   controller.variable.DateNaissance.value.text = TFormatters.formatDateFr(date).toString();
   controller.DataEmploye.DateNaissance = date;
  }
   
   void H_OnChangedDateEmbauce()async{
   final date= await TShowDate().H_RecupDate();
   controller.variable.DateEmbauche.value.text = TFormatters.formatDateFr(date).toString();
   controller.DataEmploye.DateEmbauche = date;
  }
 
 void H_OnChangedDateFinContat()async{
   final date= await TShowDate().H_RecupDate();
   controller.variable.DateFinContrat.value.text = TFormatters.formatDateFr(date).toString();
   controller.DataEmploye.DateFinContrat = date;
  }


}