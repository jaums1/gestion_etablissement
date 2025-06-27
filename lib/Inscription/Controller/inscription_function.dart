import 'package:get/get.dart';
import '../../Configs/utils/Dates/showdata.dart';
import '../../Configs/utils/Implements/function_data.dart';
import '../../Configs/utils/formatters/formatters.dart';
import 'inscription_controller.dart';

class TInscriptionFunction with TFunctionData {
  final controller = Get.find<TInscriptionController>();
  // final controller = Get.find<TInscriptionController>();


  void H_onChangeFraisAnnexe(bool? value){
    controller.isFraisAnnexe.value = value!;
  }
   void H_onChangeFraisInscription(bool? value){
    controller.isFraisInscription.value = value!;
  }

   void H_OnChangedDate()async{
   final date= await TShowDate().H_RecupDate();
   controller.variable.DateInscription.text = TFormatters.formatDateFr(date).toString();
   controller.DataInscription.DateInscription = date;
  }
} 