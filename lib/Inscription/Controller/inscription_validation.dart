import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Popup/showdialogue.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Eleves/Controller/eleve_controller.dart';
import 'inscription_controller.dart';
import 'inscription_filtre.dart';

class TInscriptionValidation with TControllerData {
  final controller = Get.find<TInscriptionController>();
  final controllerEleve = Get.find<TEleveController>();
  final filtre = TInscriptionFiltre();

  @override
  H_Enregistrer() async {
   
    if (filtre.H_VerificationInscription(id: controllerEleve.DataEleve.value.IDEtudiant) != -1) {
      TLoader.errorSnack(title: "INSCRIPTION", message: "Ce matricule ${controllerEleve.DataEleve.value.Matricule}"
      " au nom ${controllerEleve.DataEleve.value.Nom} ${controllerEleve.DataEleve.value.Prenoms} est déjà inscrit(e)");
      return;
    }
    
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
  H_Supprimer({int? id, String? param}) {
    TShowdialogue().showQuestion(
      titre: "Suppression",
      message: "Voulez-vous vraiment supprimer cette inscription?",
      onPressedValide: () => controller.H_Supprimer(id: id),
    );
  }
} 