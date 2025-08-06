import 'package:ecole/Configs/cammon/widgets/texts/texte_riche.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../Controller/scolarite_controller.dart';

class NiveauSerieScolaire extends StatelessWidget {
  const NiveauSerieScolaire({super.key, this.controller});
 final TScolariteController? controller;
  @override
  Widget build(BuildContext context) { 
    return Padding(padding:EdgeInsets.symmetric(horizontal: TSizes.md) ,
    child: SizedBox(
      width: double.infinity,
      child: TexteRicheCustom.TexteRiches(textPrimaire: controller!.variable.NiveauScolaire.text,
       textSecondaire: "Niveau Scolaire",colorPrimaire: TColors.primary)
    ),
    ) ;
  }
}