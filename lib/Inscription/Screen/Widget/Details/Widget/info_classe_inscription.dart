import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Annee_Scolaire/Controller/annee_scolaire_controller.dart';
import '../../../../../Classe/Controller/classe_controller.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/cammon/widgets/texts/texte_riche.dart';
import '../../../../../Configs/utils/Constant/colors.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Configs/utils/formatters/formatters.dart';
import '../../../../Controller/inscription_controller.dart';

class InfoClasseInscription extends StatelessWidget {
  const InfoClasseInscription({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = Get.find<TInscriptionController>();
      final controllerClasse = Get.find<TClasseController>();
      final controllerAS = Get.find<TAnneeScolaireController>();

      final DataClasse = controllerClasse.DataClasse.value;
      final DataAnneeScolaire = controllerAS.DataAnneeScolaire.value;
    return  SizedBox(
           width: double.infinity,
           child: TRoundedContainerCreate(
          child: Obx(
          () => Column(
            spacing: TSizes.sm,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //// INFORMATION CLASSE
              TexteRicheCustom.TexteRiches(textPrimaire: DataClasse.LibClasse.toString(),
                                         colorPrimaire: TColors.primary,textSecondaire: "Classe"),

                              
          //// INFORMATION DETAILS INSCRIPTION
             SizedBox(
                      child: Wrap(
                            spacing: 20,
                            runSpacing: 5,
                            children: [
                            TexteRicheCustom.TexteRicheLigne(textPrimaire:TFormatters.formatDateFr(controller.DataInscription.value.DateInscription),
                                                              textSecondaire: "Inscrit le"),

                            TexteRicheCustom.TexteRicheLigne(textPrimaire: DataAnneeScolaire.AnneeScolaire.toString(),
                                                             textSecondaire: "Annee Scolaire"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
    );
  }
}