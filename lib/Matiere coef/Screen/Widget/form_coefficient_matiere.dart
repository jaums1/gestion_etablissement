import 'package:ecole/Configs/cammon/widgets/buttons/button.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Matiere%20coef/Controller/matierecoef_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FormCoefficient extends StatelessWidget {
  const FormCoefficient({super.key, this.onPressed});
 final VoidCallback ? onPressed;
  @override
  Widget build(BuildContext context) {
    final formulaire =TFormulaire();
    final controller=Get.find<TCoefficientController>() ;
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        formulaire.textFormField(label: TText.libMatiere,
        iconPrefix: Iconsax.note,readOnly: true,textEditingController: controller.matiere),

        formulaire.textFormField(label: TText.libCoefficient,
        iconPrefix: Iconsax.note,textInputType: TextInputType.number,
        textEditingController: controller.coefficient),
        SizedBox(height: 12,),
     ////// VALIDATION
       SizedBox(
        width: double.infinity,
        child: TButton.elevatedButton(
          text: TText.validation,onPressed: onPressed??(){}
        ),
       ),
       SizedBox()
      ],
    ));
  }
}