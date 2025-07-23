import 'package:ecole/Coefficient/Controller/matierecoef_controller.dart';
import 'package:ecole/Coefficient/Model/matierecoef_model.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../../Configs/utils/Implements/page_data.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../Screen/Widget/form_coefficient_matiere.dart';
import 'coefficient_validation.dart';



class TCoefficientPage with TPageData {
    final controller = Get.find<TCoefficientController>();

 @override
  H_PageShowDialogNouveau({int? id}) {
    controller.H_Initialise();
   
    controller.DataCoefficient = controller.DataTableCoefficient.firstWhere(
      (e)=> e.DataNiveauSerie!.iDNiveauSerie==id,orElse: () => TCoefficientModel(),);
   
   controller.controllerNiveauSerie.DataNiveauSerie.value = controller.DataCoefficient.DataNiveauSerie!;
    TShowdialogue.showWidget(
      titre: TText.enregistrement.tr,
      widgets: FormCoefficient(
        onPressed: ()=> TCoefficientValidation().H_Enregistrer(),
      ),
        );
  }

 @override
  H_PageShowDialogModifier({int? id , int? IDNiveauSerie}) {
     controller.H_RecupeModif(id: id,IDNiveauSerie: IDNiveauSerie);
     TShowdialogue.showWidget(
      titre: TText.modification.tr,
      widgets: FormCoefficient(
        onPressed: ()=> TCoefficientValidation().H_Modifier(),
      ),
        );
  }

 
}