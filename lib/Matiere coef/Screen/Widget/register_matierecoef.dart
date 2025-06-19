
import 'package:ecole/Matiere%20coef/Controller/matierecoef_controller.dart';
import 'package:ecole/Matiere%20coef/Controller/page_matierecoef_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Configs/cammon/widgets/buttons/button.dart';
import '../../../Configs/utils/Constant/enums.dart';
import '../../../Configuration/Screen/Widget/cadre_configuration.dart';
import 'liste_matierecoef_non_select.dart';
import 'liste_matierecoef_selectionner.dart';


class TRegisterMatiereCoefScreen extends StatelessWidget {
  const TRegisterMatiereCoefScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = Get.find<TCoefficientController>();
     final controllerPage = Get.find<TPageMatiereCoefController>();
     controller.H_RecupMatiere();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: 
      TCadreConfiguration(
         childRight: SizedBox(child: Row(
        children: [
           TButton.elevatedButton(text:"Valider",onPressed:()=> controller.H_Validation() ),
           SizedBox(width: 10,),
           TButton.elevatedButton(text:"Fermer",isPrincipal: false,onPressed:()=>controllerPage.previousPage() ),
                 
        ],
      ),),
        titre:controller.action.value==TraitementAction.nouveau.name?"Enregistrement Matière Coefficiente":"Modifier Matière Coefficiente",
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Expanded(child: TListeMatiereCoefSelectionner()),
           SizedBox(width: 10,),
           Expanded(child:Column(
             children: [
               TListeMatiereNonSelectionner(),
               SizedBox(height: 10,),
             ],
           ))   
          ],
        ),
      ),
    );
  }
}