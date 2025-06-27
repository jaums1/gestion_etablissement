import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Versement/Controller/versement_function.dart';
import 'package:get/get.dart';

import '../../Classe/Controller/classe_controller.dart';
import '../../Configs/utils/Implements/page_data.dart';
import '../../Configs/utils/formatters/formatters.dart';
import '../../Eleves/Controller/eleve_controller.dart';
import 'versement_controller.dart';

class TVersementPage with TPageData {
  final controller = Get.find<TVersementController>();


  @override
  H_PageNouveau({int? id}) {
    controller.variable.clear();
    final DateTime date =DateTime.now();
     controller.variable.DateVersement.text = TFormatters.formatDateFr(date).toString();
   controller.DataVersement.DateVersement = date;
    TVersementFunction().H_GenererReference();
    Get.offNamed(TRoutes.registerversement, arguments: TraitementAction.nouveau.name);
  }

  @override
  H_PageModifier({int? id}) {
   
    Get.offNamed(TRoutes.registerversement, arguments: TraitementAction.modifier.name);
  }

  @override
  H_PageDetail({int? id}) {
    controller.H_RecupeModif(id: id);
    Get.offNamed(TRoutes.registerinscription, arguments: TraitementAction.detail.name);
  }
} 