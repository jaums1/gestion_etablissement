import 'package:get/get.dart';
import '../../Configs/utils/Implements/filtre_data.dart';
import 'versement_controller.dart';

class TVersementFiltre with TFiltre {
  final controller = Get.find<TVersementController>();

 @override
  H_FiltreElementParID({int? id}) {
    final index = controller.DataTableVersement.indexWhere((e) => e.IDVersement==id);
    if(index ==-1)return;
    controller.DataVersement.value = controller.DataTableVersement[index];
  }



@override
 H_FiltreElement({String param = ""}) {
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