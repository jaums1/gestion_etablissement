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
   if(date==null) return;
   controller.variable.DateInscription.value.text = TFormatters.formatDateFr(date).toString();
   controller.DataInscription.value.DateInscription = date;
  } 
   void H_OnChangedDateProchainVersement()async{
   final date= await TShowDate().H_RecupDate(dateLointaine: true);
   if(date==null) return;
   controller.variable.DateProchainVersement.text = TFormatters.formatDateFr(date).toString();
   controller.DataInscription.value.DateProchainVersement = date;
  }

 H_OnChangedMethodePaiement(value){
  controller.DataInscription.value.TypePaiement =value;
 }
} 