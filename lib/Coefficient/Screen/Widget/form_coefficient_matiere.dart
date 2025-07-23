import 'package:ecole/Configs/cammon/widgets/buttons/button.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/cammon/widgets/texts/texte_riche.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Coefficient/Controller/matierecoef_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../Configs/utils/Constant/sizes.dart';
import '../../../Matiere/Controller/matiere_controller.dart';
import '../../../Matiere/Screen/Widget/search_matiere_dialog.dart';
import '../../../Niveau Serie/Controller/niveau_serie_controller.dart';
// import '../../../Niveau Serie/Screen/ShowDialog/search_niveau_serie_dialog.dart';

class FormCoefficient extends StatelessWidget {
  const FormCoefficient({super.key, this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final formulaire = TFormulaire();
    final controller = Get.find<TCoefficientController>();
    final controllerMatiere = Get.find<TMatiereController>();
    final controllerNiveau = Get.find<TNiveauSerieController>();
    return SingleChildScrollView(
      child: SizedBox(
          width: 300,
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //////// NIVEAU SERIE
              SizedBox(
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                        // flex: 5,
                        child: Obx(() => TexteRicheCustom.TexteRiches(
                          colorPrimaire: Colors.deepOrange,
                            textPrimaire: controllerNiveau.DataNiveauSerie.value.niveauSerie??"",
                            textSecondaire: TText.niveauSerie))),
                    // Expanded(
                    //   child: SizedBox(
                    //     height: 35,
                    //     width: 22,
                    //     child: TButton.iconButton(
                    //         padding: 0,
                    //         text: "${TText.recherche} ${TText.niveauSerie}",
                    //         icon: Iconsax.search_normal,
                    //         size: TSizes.md,
                    //         onPressed: () => showSearchNiveauSerieeDialog()),
                    //   ),
                    // )
                  ],
                ),
              ),

              ////// MATIERE
              SizedBox(
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                        flex: 5,
                        child: Obx(() => TexteRicheCustom.TexteRiches(
                            textPrimaire:
                                controllerMatiere.DataMatiere.value.matiere ??
                                    "",
                            textSecondaire: TText.libMatiere,
                            colorPrimaire: TColors.primary))),
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        width: 22,
                        child: TButton.iconButton(
                            padding: 0,
                            text: "${TText.recherche} ${TText.libMatiere}",
                            icon: Iconsax.search_normal,
                            size: TSizes.md,
                            onPressed: () => showSearchMatiereDialog()),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 8,
              ),
              formulaire.textFormField(
                  label: TText.libCoefficient,
                  iconPrefix: Iconsax.note,
                  textInputType: TextInputType.number,
                  textEditingController: controller.coefficient),
              SizedBox(
                height: 12,
              ),
              ////// VALIDATION
              SizedBox(
                height: 45,
                width: double.infinity,
                child: TButton.elevatedButton(
                    text: TText.validation, onPressed: onPressed ?? () {}),
              ),
            ],
          )),
    );
  }
}
