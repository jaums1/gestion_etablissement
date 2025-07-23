import 'package:get/get.dart';
import '../../Configs/utils/Dates/showdata.dart';
import '../../Configs/utils/Implements/function_data.dart';
import '../../Configs/utils/formatters/formatters.dart';
import 'annee_scolaire_controller.dart';

class TAnneeScolaireFunction with TFunctionData {
  final controller = Get.find<TAnneeScolaireController>();
  
   void H_OnChangedDateDebut()async{
   final date= await TShowDate().H_RecupDate();
   if(date==null) return;
   controller.variable.DateDebut.text = TFormatters.formatDateFr(date).toString();
   controller.DataAnneeScolaire.value.DateDebut = date;
  }
   void H_OnChangedDateFin()async{
   final date= await TShowDate().H_RecupDate();
   if(date==null) return;
   controller.variable.DateFin.text = TFormatters.formatDateFr(date).toString();
   controller.DataAnneeScolaire.value.DateFin = date;
  } 

} 