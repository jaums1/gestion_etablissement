import 'package:get/get.dart';
import '../Model/versement_model.dart';
import 'versement_controller.dart';

class TVersementFiltre {
  final controller = Get.find<TVersementController>();

  void H_FiltreElement({String param = ""}) {
    if (param.isEmpty) {
      controller.DataTableFiltreVersement.value = controller.DataTableVersement;
      return;
    }
    controller.DataTableFiltreVersement.value = controller.DataTableVersement.where(
      (e) =>
        (e.Ref ?? '').toLowerCase().contains(param.toLowerCase()) ||
        (e.TypePaiement ?? '').toLowerCase().contains(param.toLowerCase()) ||
        (e.Montant?.toString() ?? '').contains(param),
    ).toList();
  }
} 