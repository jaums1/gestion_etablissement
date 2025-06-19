
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Matiere/Controller/filtre_matiere.dart';
import 'package:ecole/Matiere/Controller/page_matiere_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Configs/cammon/widgets/buttons/button.dart';
import '../../Controller/matiere_controller.dart';

class TCadreHeaderMatiere extends StatelessWidget {
  const TCadreHeaderMatiere({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formulaire =TFormulaire();
    final controllerFiltre =TFiltreMatiere();
    final controller = Get.find<TPageMatiereController>();
    final controllerAction = Get.find<TMatiereController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
          flex: 3,
           child: SizedBox(
            width: 400,
             child: formulaire.textFormField(label: "Recherche",isPadding: true,
             onChanged:(value)=> controllerFiltre.H_FiltreElement(param: value)
             ),
           ),
         ),
          SizedBox(width: 30,),
          Expanded(
            child: TButton.elevatedButton(text: "Nouveau",onPressed: (){
              controllerAction.action.value = TraitementAction.nouveau.name;
             controllerAction.H_Initialise();
              controller.   nextPage();
              }),
          ),
        ],
      ),
    );
  }
}