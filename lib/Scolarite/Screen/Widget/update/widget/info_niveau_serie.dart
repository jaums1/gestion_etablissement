import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../Controller/scolarite_controller.dart';

class NiveauSerieScolaire extends StatelessWidget {
  const NiveauSerieScolaire({super.key, this.controller});
 final TScolariteController? controller;
  @override
  Widget build(BuildContext context) {
    final formulaire= TFormulaire();
    return Padding(padding:EdgeInsets.symmetric(horizontal: TSizes.md) ,
    child: SizedBox(
      child: formulaire.formulaireTextCheval(label: "Niveau serie",readOnly: true,
        textEditingController: controller!.variable.NiveauSerie),
    ),
    ) ;
  }
}