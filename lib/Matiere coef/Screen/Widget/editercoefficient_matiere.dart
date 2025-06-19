import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Matiere%20coef/Controller/matierecoef_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TEditerCoefficient extends StatelessWidget {
  const TEditerCoefficient({super.key, this.titre});
 final String? titre;
  @override
  Widget build(BuildContext context) {
    final formulaire =TFormulaire();
    final controller=Get.find<TCoefficientController>() ;
    return SizedBox(
      height: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titre.toString(),style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.start,),
        SizedBox(height: 10,),
        Form(
        key: controller.keyMatiereCoef,
         child: formulaire.textFormField(
          textEditingController: controller.coefficient,
          label: "Coefficient",
         textInputType: TextInputType.number,
        ))
        
      ],
    ));
  }
}