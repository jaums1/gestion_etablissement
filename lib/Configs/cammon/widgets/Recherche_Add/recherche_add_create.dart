import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/buttons/button.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';

class TRechercheAddCreate extends StatelessWidget {
  const TRechercheAddCreate({
    super.key, this.onPressedRecherche, this.onPressedAdd,
  });
 final VoidCallback? onPressedRecherche;
 final VoidCallback? onPressedAdd;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TButton.iconButton(text: "Recherche",icon: Iconsax.search_normal,size: TSizes.md,
        onPressed:onPressedRecherche ),
        SizedBox(width: TSizes.sm,),
        TButton.iconButton(text: "Ajouter",icon: Iconsax.add,size: TSizes.md,
        onPressed:onPressedAdd ),
      ],
    );
  }
}