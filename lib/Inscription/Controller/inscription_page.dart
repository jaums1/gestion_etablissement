import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Inscription/Controller/inscription_filtre.dart';
import 'package:get/get.dart';

import '../../Classe/Controller/classe_controller.dart';
import '../../Configs/utils/Implements/page_data.dart';
import '../../Eleves/Controller/eleve_controller.dart';
import 'inscription_controller.dart';

class TInscriptionPage with TPageData {
  final controller = Get.find<TInscriptionController>();
  final controllerEleve = Get.find<TEleveController>();
  final controllerClasse = Get.find<TClasseController>();
  final filtreInscription  =TInscriptionFiltre();
  @override
  H_PageNouveau() {
    controllerEleve.H_Initialise();
    controllerClasse.H_Initialise();
    controller.variable.H_Initialise();
    
    Get.offNamed(TRoutes.registerinscription, arguments: TraitementAction.nouveau.name);
  }

  @override
  H_PageModifier({int? id}) {
    // Get.bottomSheet(Container(
    //   width: 100,
    //   alignment: Alignment.centerLeft,
    //   child: Column(
    //     children: [
    //       ListTile(title: Text("Option 1"),)
    //     ],
    //   ),
    // ));
    // controller.H_RecupeModif(id: id);
    Get.offNamed(TRoutes.registerversement, arguments: TraitementAction.modifier.name);
  }

  @override
  H_PageDetail({int? id}) {
   final result = filtreInscription.H_FiltreElementParID(id: id);
    if(result) Get.offNamed(TRoutes.detailsinscription, arguments: TraitementAction.detail.name);
  }
} 