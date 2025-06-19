
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Matiere%20coef/Controller/flitre_coefficient.dart';
import 'package:ecole/Matiere%20coef/Controller/matierecoef_controller.dart';
import 'package:ecole/Matiere%20coef/Controller/page_matierecoef_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Configs/cammon/widgets/buttons/button.dart';

class TCadreHeaderMatiereCoef extends StatelessWidget {
  const TCadreHeaderMatiereCoef({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TPageMatiereCoefController>();
    final controllerAction = Get.find<TCoefficientController>();
    final formulaire =TFormulaire();
    final controllerFiltre =TFiltreCoefficient();
  
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
             onChanged:(value)=> controllerFiltre.H_FiltreCoefficient(param: value)
             ),
           ),
         ),
          SizedBox(width: 30,),
          Expanded(
            child: TButton.elevatedButton(text: "Nouveau",onPressed: (){
              controllerAction.action.value = TraitementAction.nouveau.name;
             controllerAction.H_Initialise();
              controller.nextPage();
              }),
          ),

        ],
      ),
    );
  }
}