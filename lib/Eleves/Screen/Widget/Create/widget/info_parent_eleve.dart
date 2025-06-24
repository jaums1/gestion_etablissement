import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/Coupe Ssection/coupe_section.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';

class TInformationParentEleve extends StatelessWidget {
  const TInformationParentEleve({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TCoupeSectionTitre(titre: "Information Parent",),
        SizedBox(height: TSizes.spaceBtwItems,),
        Form(
          child: Column(
          children: [
            //// NOM
            TFormulaire().formulaireTextCheval(label: "Nom",iconPrefix: Iconsax.user),          
            //// PRENOMS
            TFormulaire().formulaireTextCheval(label: "Prénoms",iconPrefix: Iconsax.user),
             
             ///// CONTACT
             SizedBox(
              child: Row(
                children: [
             Expanded(child:  TFormulaire().formulaireTextCheval(label: "Tel 1",iconPrefix:Iconsax.call),),
              SizedBox(width: 20,),
             Expanded(child:  TFormulaire().formulaireTextCheval(label: "Tel 2",iconPrefix:Iconsax.call),)
                ],
              ),
             ),
             
          
          ],
        ))

      ],
    );
  }
}