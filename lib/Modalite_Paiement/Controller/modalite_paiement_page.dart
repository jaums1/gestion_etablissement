import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Configs/utils/Popup/loaders.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Implements/page_data.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../../Scolarite/Controller/scolarite_controller.dart';
import '../Screen/create_modalite_paiement.dart';
import 'modalite_paiement_controller.dart';


class TModalitePaiementPage with TPageData{
   final controller    = Get.find<TScolariteController>();
   final controllerMP    = Get.find<TModalitePaiementController>();

   @override
  H_PageNouveau() {
    controllerMP.variable.H_initVariables();

   if (controller.variable.MontantScolarite.text=="" ||controller.variable.MontantScolarite.text=="0" ) {
     TLoader.errorSnack(title: "SCOLARITE",message: "Veuillez entrer le montant de la scolarite");
     return;
   }

  if( controller.variable.DataTableModalitePaiement.isEmpty){
    controllerMP.variable.LibVersement.text = '1er Versement';
  }else{
   controllerMP.variable.LibVersement.text = '${controller.variable.DataTableModalitePaiement.length+1}e Versement';
  } 
 controllerMP.variable.Montant.value.text="0";
 
  TShowdialogue.showWidget( titre: "Enregistrer un Modalité",widgets:TCreateModalitePaiementScree(
    argument:TraitementAction.nouveau.name ,controller: controller,
  ) );
 
  }

  @override
  H_PageModifier({int? id,String? param}) {
    // controller.H_RecupeModif(id: id);
    controllerMP.H_RecupeModif(param: param);
   TShowdialogue.showWidget( titre: "Modifier un Modalité",widgets:TCreateModalitePaiementScree(
    argument:TraitementAction.modifier.name ,
  ) );

  }

}