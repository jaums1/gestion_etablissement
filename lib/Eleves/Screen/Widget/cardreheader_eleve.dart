
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Coefficient/Controller/flitre_coefficient.dart';
import 'package:ecole/Coefficient/Controller/matierecoef_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Configs/cammon/widgets/buttons/button.dart';

class TCadreHeaderEleve extends StatelessWidget {
  const TCadreHeaderEleve({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controllerAction = Get.find<TCoefficientController>();
    final formulaire =TFormulaire();
    final controllerFiltre =TFiltreCoefficient();
  
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Flexible(
             child: SizedBox(
              width: 400,
               child: formulaire.textFormField(label: "Recherche",isPadding: true,
               onChanged:(value){}
              //  controllerFiltre.H_FiltreCoefficient(param: value)
               ),
             ),
           ),
          SizedBox(width: 30,),
          Flexible(
            child: TButton.elevatedButton(text: "Nouveau",onPressed: (){
              controllerAction.action.value = TraitementAction.nouveau.name;
             controllerAction.H_Initialise();
              }),
          ),

        ],
      ),
    );
  }
}