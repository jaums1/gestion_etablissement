
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Matiere/Controller/filtre_matiere.dart';

import 'package:flutter/material.dart';


import '../../../Configs/cammon/widgets/buttons/button.dart';
import '../../../Tests/testes.dart';


class TCadreHeaderMatiere extends StatelessWidget {
  const TCadreHeaderMatiere({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formulaire =TFormulaire();
    final controllerFiltre =TFiltreMatiere();
   
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
          flex: 3,
           child: SizedBox(
            width: 400,
             child: formulaire.textFormField(label: TText.recherche,isPadding: true,
             onChanged:(value)=> controllerFiltre.H_FiltreElement(param: value)
             ),
           ),
         ),
          SizedBox(width: 30,),
          Expanded(
            child: TButton.elevatedButton(text: "Nouveaus",onPressed: ()=> TableauMatieres()
            // TMatierePage().H_PageShowDialogNouveau()
             ),
          ),
        ],
      ),
    );
  }
}