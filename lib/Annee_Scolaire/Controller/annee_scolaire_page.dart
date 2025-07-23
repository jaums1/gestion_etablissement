
import 'package:ecole/Annee_Scolaire/Screen/Form/form_annee_scolaire.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/texte_string.dart';
import '../../Configs/utils/Implements/page_data.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import 'annee_scolaire_controller.dart';
import 'annee_scolaire_validation.dart';



class TAnneeScolairePage with TPageData {
    final controller = Get.find<TAnneeScolaireController>();

 @override
  H_PageShowDialogNouveau() {
    controller.H_Initialise();
    TShowdialogue.showWidget(
      titre: TText.enregistrement.tr,
      widgets: FormAnneeScolaire(
        onPressed: ()=> TAnneeScolaireValidation().H_Enregistrer(),
      ),
        );
  }

 @override
  H_PageShowDialogModifier({int? id }) {
     controller.H_RecupeModif(id: id);
     TShowdialogue.showWidget(
      titre: TText.modification.tr,
      widgets: FormAnneeScolaire(
        onPressed:  ()=> TAnneeScolaireValidation().H_Modifier(),
      ),
        );
  }

 
}