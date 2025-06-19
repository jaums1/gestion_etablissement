import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/Coupe Ssection/coupe_section.dart';
import '../../../../../Configs/cammon/widgets/combo/combo.dart';
import '../../../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../../Controller/employe_controller.dart';
import '../../../../Controller/employe_function.dart';

class TInformationSalaireEmploye extends StatelessWidget {
  const TInformationSalaireEmploye({super.key});

  @override
  Widget build(BuildContext context) {
     final combo = TCombo();
       final formulaire = TFormulaire();
       final controller = Get.find<TEmployeController>();
    return   Form(
      // key: controller.variable.keyInfoStatut,
      child: FocusTraversalGroup(
        child: Column(
          children: [
            TCoupeSectionTitre(titre: "Informations salariales",),
                SizedBox(height: TSizes.spaceBtwItems,),
           ////TYPE SALAIRE
           combo.comboTextChevale(
                  valeur: controller.variable.TypeSalaire.text, 
                  hintText: "Type Salaire",
                  sections:controller.variable.typesSalaire,
                  label: "Type Salaire",onChanged:TEmployeFunction().H_OnChangedTypeSalaire), 
        
                  ////BANQUE
             formulaire.formulaireTextCheval(label: "Banque",iconPrefix: Iconsax.bank,
             textEditingController: controller.variable.Bancaire),
                 
                  ////NUMERO BANQUE
             formulaire.formulaireTextCheval(label: "Numéro Compte",iconPrefix: Iconsax.bank,
             textEditingController: controller.variable.NumeroCompte),
        
                  ////SALAIRE
             formulaire.formulaireTextCheval(label: "Saliare",iconPrefix: Iconsax.money,
             textEditingController: controller.variable.Salaire),
        
             
          ],
        ),
      ),
    );
  }
}

