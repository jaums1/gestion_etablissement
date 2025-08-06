import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/texts/texte_riche.dart';
import '../../../../Controller/inscription_controller.dart';

class InfoUtilisateurInscription extends StatelessWidget {
  const InfoUtilisateurInscription({super.key});

  @override
  Widget build(BuildContext context) {
      final controller = Get.find<TInscriptionController>();
    return TexteRicheCustom.TexteRicheLigne(
              textPrimaire:controller.DataInscription.value.Utilisateur.toString() ,
              textSecondaire: "Utilisateur");
  }
}