import 'package:get/get.dart';
import 'versement_controller.dart';

class TVersementValidation {
  final controller = Get.find<TVersementController>();

  bool H_VerificationChamps() {
    if (controller.variable.IDInscription.text.isEmpty) return false;
    if (controller.variable.IDAnneeScolaire.text.isEmpty) return false;
    if (controller.variable.TypePaiement.text.isEmpty) return false;
    if (controller.variable.Montant.text.isEmpty) return false;
    if (controller.variable.DateVersement.text.isEmpty) return false;
    if (controller.variable.DateProchainVersement.text.isEmpty) return false;
    return true;
  }
} 