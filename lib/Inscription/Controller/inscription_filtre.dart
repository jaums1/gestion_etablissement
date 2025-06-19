import 'package:ecole/Configs/utils/Implements/filtre_data.dart';
import 'package:get/get.dart';

import 'inscription_controller.dart';

class TInscriptionFiltre with TFiltre {
  final controller = Get.find<TInscriptionController>();
  
  @override
  void H_FiltreElement({String param = ""}) {
    controller.DataTableFiltreInscription.value = controller.DataTableInscription.where(
      (e) => e.IDEtudiant.toString().toLowerCase().contains(param.toLowerCase()) ||
             e.IDClasse.toString().toLowerCase().contains(param.toLowerCase()) ||
             e.Statut.toString().toLowerCase().contains(param.toLowerCase())
    ).toList();
  }

  @override
  H_FiltreElementParID({int? id}) {
    final index = controller.DataTableInscription.indexWhere((e) => e.IDInscription == id);
    if (index == -1) return;
    controller.DataInscription = controller.DataTableFiltreInscription[index];
  }

  @override
  H_Verification({String param = ""}) {
    final index = controller.DataTableInscription.indexWhere((e) => e.IDInscription.toString().trim().toLowerCase() == param.trim().toLowerCase());
    return index;
  }
} 