
import 'package:ecole/Niveau%20Serie/Controller/niveau_serie_controller.dart';
import 'package:ecole/Niveau%20Serie/Controller/page_niveau_serie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Configs/cammon/widgets/buttons/button.dart';
import '../../../Configs/utils/Constant/enums.dart';
import '../../../Configuration/Screen/Widget/cadre_configuration.dart';
import 'cadre_niveau_scolaire_serie.dart';
import 'cadre_niveau_serie.dart';

class TRegisterNiveauSerieScreen extends StatelessWidget {
  const TRegisterNiveauSerieScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = Get.find<TNiveauSerieController>();
     final controllerPage = Get.find<TPageNiveauSerieController>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: TCadreConfiguration(
        titre:controller.action ==TraitementAction.nouveau.name?"Enregistrement Niveau Serie":
        "Modifier Niveau Serie" ,
        child: Column(
          children: [
          TCadreNiveauScolaireSerie(),  
           SizedBox(height: 10,),
           TCadreNiveauSerie(),
           SizedBox(child: Padding(
             padding: const EdgeInsets.symmetric(vertical:10,horizontal: 10),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TButton.elevatedButton(text:"Valider",
                        onPressed:()async=> {
                            await controller.H_Enregistrer()
                       
                          
                        } 
                        ),
                      SizedBox(width: 10,),
                      TButton.elevatedButton(text:"Fermer",isPrincipal: false,
                        onPressed:()=> controllerPage.previousPage() ),
              ],
             ),
           ),),

          ],
        ),
      ),
    );
  }
}