import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/cammon/widgets/texts/texte_riche.dart';
import '../../../../../Configs/utils/formatters/formatters.dart';
import '../../../../Controller/inscription_controller.dart';

class InfoFraisInscription extends StatelessWidget {
  const InfoFraisInscription({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = Get.find<TInscriptionController>();
    return SizedBox(
                width: double.infinity,
                child: TRoundedContainerCreate(
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 10,
                          children: [
                            TexteRicheCustom.TexteRicheLigne(
                                textPrimaire: TFormatters.formatCurrency(controller.DataInscription.value.FraisAnnexe),
                                textSecondaire: "Frais Annexe"),

                            TexteRicheCustom.TexteRicheLigne(textPrimaire: TFormatters.formatCurrency(controller.DataInscription.value.DroitInscription),
                                textSecondaire: "Droit Inscription"),

                            TexteRicheCustom.TexteRicheLigne(
                                textPrimaire: TFormatters.formatCurrency(
                                    controller.DataInscription.value.NetAPayer! -controller.DataInscription.value
                                            .DroitInscription! -controller.DataInscription.value.FraisAnnexe!),
                                textSecondaire: "Scolarite"),
                          ],
                        )),
                      );
  }
}