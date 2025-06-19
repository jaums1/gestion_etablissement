import 'package:get/get.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import 'modalite_paiement_controller.dart';



class TModalitePaiementValidation with TControllerData {
 final controller    = Get.find<TModalitePaiementController>();

  @override
  H_Enregistrer() {
   controller.H_Enregistrer();
}

@override
  H_Modifier() async {
     controller.H_Modifier();
  }

@override
  H_Supprimer({int? id, String? param}) {
     controller.H_Supprimer(param: param);
  }
}