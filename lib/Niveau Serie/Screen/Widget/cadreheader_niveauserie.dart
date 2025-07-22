
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/filtre_niveau_serie.dart';
import '../../Controller/niveau_serie_controller.dart';

class TCadreHeaderNiveauSerie extends StatelessWidget {
 
    final controllerAction = Get.find<TNiveauSerieController>();
    // final controller = Get.find<TCycleController>();
   TCadreHeaderNiveauSerie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formulaire = TFormulaire();
    
    final controllerFiltre = TFiltreNiveauSerie();
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
          // SizedBox(width: 30,),
          // Expanded(
          //   child: TButton.elevatedButton(text: "Nouveau",onPressed: (){
          //     TNiveauSeriePage().H_PageShowDialogNouveau();
          //   //   controllerAction.action = TraitementAction.nouveau.name;
          //   //  controllerAction.H_Initialise();
          //   //   controller.nextPage();
          //     }),
          // ),
        ],
      ),
    );
  }
}