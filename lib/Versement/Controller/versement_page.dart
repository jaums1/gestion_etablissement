import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Inscription/Controller/inscription_filtre.dart';
import 'package:ecole/Versement/Controller/versement_function.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Implements/page_data.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../../Configs/utils/formatters/formatters.dart';
import '../Screen/Widget/Create/widget/form_versement.dart';
import 'versement_controller.dart';

class TVersementPage with TPageData {
  final controller = Get.find<TVersementController>();
  final filtreInscription = TInscriptionFiltre();


  @override
  H_PageNouveau({int? id}) {
    controller.variable.clear();
    controller.H_Initialise();
    final DateTime date =DateTime.now();
     controller.variable.DateVersement.text = TFormatters.formatDateFr(date).toString();
     controller.DataVersement.DateVersement = date;
    TVersementFunction().H_GenererReference();
    filtreInscription.H_FiltreElementParID(id:id );
    Get.offNamed(TRoutes.registerversement, arguments: TraitementAction.nouveau.name);
  }

  @override
  H_PageModifier({int? id}) {
    Get.offNamed(TRoutes.registerversement, arguments: TraitementAction.modifier.name);
  }

@override
  H_PageShowDialogNouveau({int? id}) {
    controller.variable.clear();
    controller.H_Initialise();
    final DateTime date =DateTime.now();
     controller.variable.DateVersement.text = TFormatters.formatDateFr(date).toString();
     controller.DataVersement.DateVersement = date;
    TVersementFunction().H_GenererReference();
     TShowdialogue.showWidget(
      titre: "Enregistrement",
      widgets: SizedBox(
        width: 350,
        height: 380,
        child: FormVersement(argument: TraitementAction.nouveau.name,show: true,
        inscriptionController: filtreInscription.controller,
        )));
  }

@override
  H_PageShowDialogModifier() {
    // TODO: implement H_PageShowDialogModifier
    return super.H_PageShowDialogModifier();
  }
  @override
  H_PageDetail({int? id}) {
    controller.H_RecupeModif(id: id);
    Get.offNamed(TRoutes.registerinscription, arguments: TraitementAction.detail.name);
  }
} 