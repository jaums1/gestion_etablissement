import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Configs/utils/Popup/loaders.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Implements/page_data.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../../Scolarite/Controller/scolarite_controller.dart';
import '../Screen/create_modalite_paiement.dart';
import 'modalite_paiement_controller.dart';
import 'modalite_paiement_function.dart';


class TModalitePaiementPage with TPageData{
   final controller    = Get.find<TScolariteController>();
   final controllerMP    = Get.find<TModalitePaiementController>();


H_GenerationLibelle(){
 if( controllerMP.DataTableModalitePaiement.isEmpty){
    controllerMP.variable.LibVersement.text = '1er Versement';
  }else{
   controllerMP.variable.LibVersement.text = '${controllerMP.DataTableModalitePaiement.length+1}e Versement';
  } 
}
   @override
  H_PageNouveau() {
    controllerMP.H_Initialise();
   if (controller.variable.MontantScolarite.text=="" ||controller.variable.MontantScolarite.text=="0" ) {
     TLoader.errorSnack(title: "SCOLARITE",message: "Veuillez entrer le montant de la scolarite");
     return;
   }

  H_GenerationLibelle();
 TModalitePaiementFunction().H_CalculMontant();
   

  TShowdialogue.showWidget( titre:TText.enregistrement,widgets:TCreateModalitePaiementScree(
    argument:TraitementAction.nouveau.name ,controller: controller,
  ) );
 
  }

  @override
  H_PageModifier({int? id,String? param}) {
    controllerMP.H_RecupeModif(param: param);
     TModalitePaiementFunction().H_CalculMontant();
   TShowdialogue.showWidget( titre: TText.modification,widgets:TCreateModalitePaiementScree(
    argument:TraitementAction.modifier.name ,
  ) );

  }

}