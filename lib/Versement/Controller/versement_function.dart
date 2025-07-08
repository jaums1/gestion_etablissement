import 'package:ecole/Configs/utils/Constant/generer_reference.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Dates/showdata.dart';
import '../../Configs/utils/formatters/formatters.dart';
import 'versement_controller.dart';

class TVersementFunction {
  final controller = Get.find<TVersementController>();

  void H_CalculerResteAPayer() {
    final montant = int.tryParse(controller.variable.Montant.value.text) ?? 0;
    // Ici, il faudrait récupérer le montant total à payer (exemple fictif)
    final montantTotal = 10000; // À remplacer par la vraie logique
    final reste = montantTotal - montant;
    controller.variable.ResteAPayer.text = reste.toString();
  }

  void H_GenererReference() {
    controller.variable.Ref.text = TGenerationReference.H_GenererReference(ref: "Vers");
   
  }

   void H_OnChangedDateProchainVersement()async{
   final date= await TShowDate().H_RecupDate(dateLointaine: true);
   controller.variable.DateProchainVersement.text = TFormatters.formatDateFr(date).toString();
   controller.DataVersement.value.DateProchainVersement = date;
  }

   void H_OnChangedDateVersement()async{
   final date= await TShowDate().H_RecupDate();
   controller.variable.DateVersement.text = TFormatters.formatDateFr(date).toString();
   controller.DataVersement.value.DateVersement = date;
  }

  void H_OnChangedMethodePaiement(value){
   controller.variable.TypePaiement.text = value;
  }
} 