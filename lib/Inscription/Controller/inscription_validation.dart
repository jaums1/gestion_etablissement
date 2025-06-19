import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Popup/showdialogue.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';
import 'inscription_controller.dart';
import 'inscription_filtre.dart';

class TInscriptionValidation with TControllerData {
  final controller = Get.find<TInscriptionController>();
  final filtre = TInscriptionFiltre();

  @override
  H_Enregistrer() async {
    // if (filtre.H_Verification(param: controller.variable.IDInscription.text) != -1) {
    //   TLoader.errorSnack(title: "INSCRIPTION", message: "L'inscription ${controller.variable.IDInscription.text} existe déjà");
    //   return;
    // }
    final result = await controller.H_Enregistrer();
    // if (result) {
    //   TLoader.successSnack(title: "ENREGISTRER", message: "Vos données ont été enregistrées");
    //   Get.offNamed(TRoutes.inscription);
    // }
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
  H_Supprimer({int? id, String? param}) {
    TShowdialogue().showQuestion(
      titre: "Suppression",
      message: "Voulez-vous vraiment supprimer cette inscription?",
      onPressedValide: () => controller.H_Supprimer(id: id),
    );
  }
} 