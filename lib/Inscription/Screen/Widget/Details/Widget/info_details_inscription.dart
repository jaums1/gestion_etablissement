import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/cammon/widgets/texts/texte_riche.dart';
import '../../../../../Configs/utils/Constant/colors.dart';
import '../../../../../Configs/utils/Statut/statut.dart';
import '../../../../../Configs/utils/formatters/formatters.dart';
import '../../../../Controller/inscription_controller.dart';

class InfoDetailsInscription extends StatelessWidget {
  const InfoDetailsInscription({super.key});

  @override
  Widget build(BuildContext context) {
        // final controller = Get.find<TEleveController>();
          final controller = Get.find<TInscriptionController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ////// STATUT ET DATE DE PROCHAIN PAIEMENT
          SizedBox(
                width: double.infinity,
            child: TRoundedContainerCreate(
                            child: Obx(() {
                              if (controller.isInitialise.value){}
                              return Wrap(
                                spacing: 20,
                                runSpacing: 10,
                                children: [
                                  TexteRicheCustom.TexteRicheLigne(
                                      textPrimaire: TStatutCustom.paiement(
                                          controller.DataInscription.value
                                              .ResteAPayer),
                                      colorPrimaire: controller
                                                  .DataInscription.value.Statut!
                                                  .toLowerCase() ==
                                              "solde"
                                          ? TColors.paiementColor
                                          : TColors.error,
                                      textSecondaire: "Statut"),

                                  TexteRicheCustom.TexteRicheLigne(
                                      textPrimaire: TFormatters.formatDateFr(
                                          controller.DataInscription.value
                                              .DateProchainVersement),
                                      colorPrimaire: TColors.error,
                                      textSecondaire:
                                          "Date de Prochaine Paiement"),
                                ],
                              );
                            }),
                          )),
      ],
    );
  }
}