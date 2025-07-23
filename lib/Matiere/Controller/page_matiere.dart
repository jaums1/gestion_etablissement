import 'package:ecole/Matiere/Controller/validation_matiere.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/texte_string.dart';
import '../../Configs/utils/Implements/page_data.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../Screen/Widget/form_matiere.dart';
import 'matiere_controller.dart';


class TMatierePage with TPageData {
    final controller = Get.find<TMatiereController>();

 @override
  H_PageShowDialogNouveau() {
    controller.H_Initialise();
    TShowdialogue.showWidget(
      titre: TText.enregistrement.tr,
      widgets: FormMatiere(
        onPressed: ()=> TMatiereValidation().H_Enregistrer(),
      ),
        );
  }

 @override
  H_PageShowDialogModifier({int? id }) {
     controller.H_RecupeModif(id: id);
     TShowdialogue.showWidget(
      titre: TText.modification.tr,
      widgets: FormMatiere(
        onPressed:  ()=> TMatiereValidation().H_Modifier(),
      ),
        );
  }

 
}