import 'package:flutter/material.dart';

import '../../cammon/widgets/texts/texte_riche.dart';

class TAffichageTextEnLigne extends StatelessWidget {
  const TAffichageTextEnLigne(
      {super.key,
      this.label,
      this.labelMajuscule=false,
      this.valeur,
      this.valeurMajuscule=false,
      this.color=Colors.black});
  final String? label;
  final bool? labelMajuscule;
  final String? valeur;
  final bool? valeurMajuscule;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TexteRicheCustom.TexteRicheLigne(
          textPrimaire: valeurMajuscule == true
              ? valeur.toString().toUpperCase()
              : valeur.toString(),
          textSecondaire: labelMajuscule == true
              ? label.toString().toUpperCase()
              : label.toString(),
          colorPrimaire: color),
    );
  }
}
