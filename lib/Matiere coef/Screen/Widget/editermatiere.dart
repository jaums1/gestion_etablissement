import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Matiere/Controller/matiere_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TEditerMatiere extends StatelessWidget {
  const TEditerMatiere({super.key, this.titre});
 final String? titre;
  @override
  Widget build(BuildContext context) {
    final formulaire =TFormulaire();
    final controller=Get.find<TMatiereController>() ;
    return SizedBox(
      height: 70,
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
        Form(
         child: formulaire.textFormField(
          textEditingController: controller.matiere,
          label: "Matière",
         textInputType: TextInputType.text,
        ))
        
      ],
    ));
  }
}