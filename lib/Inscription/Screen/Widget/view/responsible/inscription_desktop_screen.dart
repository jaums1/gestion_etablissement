import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/Bilan/bilan_montant_fbanc.dart';
import '../../../../../Configs/cammon/widgets/Bilan/bilan_nombre.dart';
import '../../../../../Configs/cammon/widgets/Data_table/table_header.dart';
import '../../../../../Configs/cammon/widgets/appbar/action_appbar.dart';
import '../../../../../Configs/cammon/widgets/appbar/appbar_header_screen.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';

import '../../../../../Configs/utils/Constant/colors.dart';
import '../../../../../Configs/utils/Constant/texte_string.dart';
import '../../../../Controller/inscription_controller.dart';
import '../../../../Controller/inscription_filtre.dart';
import '../../../../Controller/inscription_page.dart';
import '../widget/inscription_datatable.dart';

class TInscriptionDesktopScreen extends StatelessWidget {
  const TInscriptionDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TInscriptionController>();
    controller.DataTableInscription.isEmpty? controller.H_RecupeData():"";
    return TAppBarHeaderScreen(
      action: [
        TActionAppBarIcon(
          onRefreshPressed: () async => await controller.H_RecupeData(),
        )
      ],
      title: TText.titreAffichageInscription,
      child: Column(
        spacing: 10,
        children: [
          //////BILAN ET FILTRE

          Flexible(
              child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    spacing: 10,
                    children: [
                      SizedBox(),
                      Flexible(
                          child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            // width: width,
                            child: Obx(() => TBilanMontantFondBlanc(
                                  montant: controller.bilanPaiement.value,
                                  sousTitre: TText.bilanPaiement,
                                  color: TColors.paiementColor,
                                )),
                          ),

                          SizedBox(
                            // width: width,
                            child: Obx(() => TBilanMontantFondBlanc(
                                  montant: controller.bilanSolde.value,
                                  sousTitre: TText.bilanSolde,
                                  color: TColors.resteAPayerColor,
                                )),
                          ),

                          SizedBox(
                            // width: width,
                            child: Obx(() => TBilanMontantFondBlanc(
                                  montant: controller.bilanNetaPayer.value,
                                  sousTitre: TText.bilanSolde,
                                  color: TColors.netAPayerColor,
                                )),
                          ),

                          SizedBox(
                            child: Obx(() => TBilanNombre(
                                  color: Colors.blue,
                                  icons: Iconsax.people,
                                  titre: controller.bilanTotal.value.toString(),
                                  sousTitre: TText.bilanTotalInscription,
                                )),
                          ),
                        ],
                      )),
                    ],
                  ))),

          //////TABLE
          Flexible(
            flex: 8,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: TRoundedContainerCreate(
                child: Column(
                  spacing: 8,
                  children: [
                    TTableHeader(
                      buttonText: "J'enregistre une Inscription",
                      onChanged: (value) =>
                          TInscriptionFiltre().H_FiltreElement(param: value),
                      onPressed: () => TInscriptionPage().H_PageNouveau(),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: TInscriptionDataTable(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
