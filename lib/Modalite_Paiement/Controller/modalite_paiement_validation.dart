import 'package:ecole/Configs/utils/Popup/loaders.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import 'modalite_paiement_controller.dart';



class TModalitePaiementValidation with TControllerData {
 final controller    = Get.find<TModalitePaiementController>();


  H_Verification(){
    final index = controller.DataTableModalitePaiement.indexWhere((e) => e.Mois== controller.variable.Mois.text );
   if(index !=-1){
  TLoader.errorSnack(title: "MOIS",message:"Les modalité de paiement pour ce mois déjà été définir");
   } 
      return index;
  }

  @override
  H_Enregistrer() {
     final index = H_Verification();
   if(index != -1)return; 
   controller.H_Enregistrer();
}

@override
  H_Modifier()  {
    
    if(controller.DataModalitePaiement.Mois != controller.variable.Mois.text){
      final index =H_Verification();
      if(index != -1)return; 
    }
     controller.H_Modifier();
  
  }

@override
  H_Supprimer({int? id, String? param}) {
     controller.H_Supprimer(param: param);
  }
}