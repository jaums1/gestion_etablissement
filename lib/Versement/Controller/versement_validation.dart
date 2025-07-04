import 'package:get/get.dart';
import '../../Configs/routes/route.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import 'versement_controller.dart';

class TVersementValidation with TControllerData  {
  final controller = Get.find<TVersementController>();
 
 
  @override
  H_Enregistrer() async {

    final result = await controller.H_Enregistrer();
    if (result) {
      TLoader.successSnack(title: "ENREGISTRER", message: "Vos données ont été enregistrées");
      Get.offNamed(TRoutes.inscription);
    }
  }

  @override
  H_Modifier() async {
    final result = await controller.H_Modifier();
    if (result) {
      TLoader.successSnack(title: "MODIFIER", message: "Vos données ont été modifiées");
      Get.offNamed(TRoutes.inscription);
    }
  }

  @override
  H_EnregistrerShowDialog() async {

    final result = await controller.H_Enregistrer();
    if (result) {
      TLoader.successSnack(title: "ENREGISTRER", message: "Vos données ont été enregistrées");
      Get.offNamed(TRoutes.inscription);
    }
  }

  @override
  H_ModifierShowDialog() async {
    final result = await controller.H_Modifier();
    if (result) {
      TLoader.successSnack(title: "MODIFIER", message: "Vos données ont été modifiées");
      Get.offNamed(TRoutes.inscription);
    }
  }

  @override
  H_Supprimer({int? id, String? param}) {
    TShowdialogue().showQuestion(
      titre: "Suppression",
      message: "Voulez-vous vraiment supprimer ce paiement?",
      onPressedValide: () => controller.H_Supprimer(id: id),
    );
  }

} 