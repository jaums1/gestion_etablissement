
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Configs/cammon/widgets/buttons/button.dart';
import '../../Controller/matiere_controller.dart';



class FormMatiere extends StatelessWidget {

  const FormMatiere({super.key,this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) { 
    final controller = Get.find<TMatiereController>();
    final formulaire = TFormulaire();
    return  SizedBox(
      width: 300,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: Column(
                spacing: 5,
                children: [
                     formulaire.formulaireTextCheval(label: TText.codeMatiere,
                  textEditingController: controller.codeMatiere),

                  formulaire.formulaireTextCheval(label:TText.libMatiere,textEditingController: controller.matiere),
                  
                  SizedBox(height: 10,),
                   SizedBox(width: double.infinity,
                   height: 45,
                    child: TButton.elevatedButton(text: TText.validation,
                    onPressed:onPressed??(){},),
                    
                    ),
               
                ],
              )
              ),
      ),
    );
  }
}