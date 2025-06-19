import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/Coupe Ssection/coupe_section.dart';
import '../../../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../../Controller/employe_controller.dart';

class TInfoAcademiqueEmploye extends StatelessWidget {
  const TInfoAcademiqueEmploye({super.key});

  @override
  Widget build(BuildContext context) {
       final formulaire = TFormulaire();
       final controller = Get.find<TEmployeController>();
    return   Form(
      // key: controller.variable.keyInfoStatut,
      child: FocusTraversalGroup(
        child: Column(
          children: [
            TCoupeSectionTitre(titre: "académiques et expérience",),
                SizedBox(height: TSizes.spaceBtwItems,),
                  ////BANQUE
             formulaire.formulaireTextCheval(label: "Specialite",iconPrefix: Iconsax.export_1,
             textEditingController: controller.variable.Specialite),
                 
                 SizedBox(
                  child: Row(
                    children: [
                      Expanded(flex: 2, child:  formulaire.formulaireTextCheval(label: "Niveau Etude",iconPrefix: Iconsax.note,
                               textEditingController: controller.variable.NiveauEtude),),
        
                       SizedBox(width: TSizes.spaceBtwItems,),
                      Expanded(child:  formulaire.formulaireTextCheval(label: "Annee Experience",iconPrefix: Iconsax.note_square,
                         textEditingController: controller.variable.Experience),),
                    ],
                  ),
                 ),
                 
                 
             
          ],
        ),
      ),
    );
  }
}

