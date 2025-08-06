
import 'package:ecole/Eleves/Controller/eleve_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/cammon/widgets/images/image_uploader.dart';
import '../../../../../Configs/cammon/widgets/texts/texte_riche.dart';
import '../../../../../Configs/utils/Constant/colors.dart';
import '../../../../../Configs/utils/Constant/enums.dart';
import '../../../../../Configs/utils/Constant/image_string.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Configs/utils/formatters/formatters.dart';

class InfoAffichageEleveInscription extends StatelessWidget {
  const InfoAffichageEleveInscription({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TEleveController>();
    return TRoundedContainerCreate(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //// INFORMATION ELEVE
          Expanded(
              flex: 5,
              child: Column(
                spacing:TSizes.sm ,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TexteRicheCustom.TexteRiches(
                      textPrimaire: controller.DataEleve.value.NomComplet.toString().toUpperCase(),
                      textSecondaire: "Nom Prénoms"),
                 
                  SizedBox(
                    child: Wrap(
                      runSpacing: 10,
                      spacing: 20,
                      children: [
                        TexteRicheCustom.TexteRicheLigne(
                            textPrimaire: controller.DataEleve.value.Matricule.toString(),
                            colorPrimaire: TColors.buttonPrimary,
                            textSecondaire: "Matricule"),
      
                        TexteRicheCustom.TexteRicheLigne(
                            textPrimaire: controller.DataEleve.value.Sexe.toString(),
                            textSecondaire: "Sexe"),
      
                        TexteRicheCustom.TexteRicheLigne(
                            textPrimaire:
                                TFormatters.formatDateFr(controller.DataEleve.value.DateNaissance),
                            textSecondaire: "Date Naissance"),
      
                        controller.DataEleve.value.LieuNaissance == ""? SizedBox()
                            : TexteRicheCustom.TexteRicheLigne(
                                textPrimaire: controller.DataEleve.value.LieuNaissance.toString(),
                                textSecondaire: "Lieu de Naissance"),
      
                 controller.DataEleve.value.Contact1 == null && controller.DataEleve.value.Contact2 == null ?       TexteRicheCustom.TexteRicheLigne(
                            textPrimaire:
                                "${controller.DataEleve.value.Contact1 ?? ''} ${controller.DataEleve.value.Contact1 == null && controller.DataEleve.value.Contact2 == null ? '' : '-'} ${controller.DataEleve.value.Contact2 ?? ''}",
                            textSecondaire: "Contact"):SizedBox(),
      
                        TexteRicheCustom.TexteRicheLigne(
                            textPrimaire: controller.DataEleve.value.Statut.toString(),
                            colorPrimaire: TColors.error,
                            textSecondaire: "Statut"),
                        TexteRicheCustom.TexteRicheLigne(
                            textPrimaire: controller.DataEleve.value.Regime.toString(),
                            colorPrimaire: TColors.error,
                            textSecondaire: "Regime"),
                      ],
                    ),
                  )
                ],
              )),
      
          SizedBox(
            width: TSizes.md,
          ),
      
          //// PHOTO ELEVE
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TImageUploader(
                height: 120,
                width: 120,
                imageType: ImageType.asset,
                circular: true,
                image: TImages.appLogo,
                editePhoto: false,
              ),
            ],
          )),
        ],
      ),
    );
  }
}