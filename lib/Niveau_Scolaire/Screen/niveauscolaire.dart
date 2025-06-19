
import 'package:flutter/material.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../../Configuration/Screen/Widget/cadre_configuration.dart';
import 'Widget/carder_niveauscolaire.dart';


class TNiveauScolaireScreen extends StatelessWidget {
  const TNiveauScolaireScreen({super.key});
  
  @override
  
  Widget build(BuildContext context) {
  
    return TCadreConfiguration(
      titre: TText.niveauScolaire,
      child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TCarderNiveauScolaireScreen(),
                ],
              ),
    );
  }
}

