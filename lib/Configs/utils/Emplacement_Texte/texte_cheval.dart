import 'package:flutter/material.dart';

import '../../cammon/widgets/Data_table/table_action_icon_button.dart';
import '../../cammon/widgets/texts/texte_riche.dart';
import '../Constant/colors.dart';

class TAffichageTextEnChevel extends StatelessWidget {
  const TAffichageTextEnChevel({
    super.key,
    this.label,
    this.labelMajuscule=false,
    this.valeur,
    this.valeurMajuscule=false,
    this.onPressed,
    this.buttonEdite=true,
    this.color=Colors.black
  });
  final String? label;
  final bool? labelMajuscule;
  final String? valeur;
  final bool? valeurMajuscule;
  final VoidCallback? onPressed;
  final bool? buttonEdite;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: TexteRicheCustom.TexteRiches(
                textSecondaire: labelMajuscule == true
                    ? label.toString().toUpperCase()
                    : label.toString(),
                textPrimaire: valeurMajuscule == true
                    ? valeur.toString().toUpperCase()
                    : valeur.toString(),
                colorPrimaire: TColors.primary),
          ),
          if (buttonEdite == true)
            Expanded(
                child: TTableActionIconButtons(
              delete: false,
              onEditPressed: onPressed,
              iconSize: 24,
            ))
        ],
      ),
    );
  }
}
