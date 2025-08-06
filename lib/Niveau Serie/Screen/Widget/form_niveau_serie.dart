// ignore_for_file: must_be_immutable

import 'package:ecole/Configs/cammon/widgets/buttons/button.dart';
import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Configs/cammon/widgets/checkbox/checkbox.dart';
import '../../../Configs/cammon/widgets/combo/combo.dart';
import '../../../Niveau_Scolaire/Controller/niveauscolaire_controller.dart';
import '../../../Serie/Controller/serie_controller.dart';
import '../../Controller/niveau_serie_controller.dart';

class FormNiveauSerie extends StatelessWidget {
  final controllerNiveau = Get.find<TNiveauScolaireController>();
  final controller = Get.find<TNiveauSerieController>();
  final controllerSerie = Get.find<TSerieController>();
  FormNiveauSerie({super.key, this.onPressed});
  Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final combo = TCombo();
    final controlleCheckBox = TCheckBox();
    return Padding(
      padding:
          EdgeInsets.only(right: TSizes.md, left: TSizes.md, top: TSizes.sm),
      child: Column(
        children: [
          /////// COMBO DE NIVEAU
          Expanded(
            flex: 2,
            child: combo.comboTextChevale(
                valeur: controllerNiveau.DataNiveau.value.niveau,
                hintText: TText.seleclniveauScolaire.tr,
                sections: controllerNiveau.isSelectNiveau,
                label: TText.niveauScolaire.tr,
                onChanged: controller.onSelectCombo),
          ),

          ////// LISTE DES SERIE
          Expanded(
            flex: 5,
            child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Obx(() => Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8,
                        runSpacing: 8,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: controllerSerie.DataTableSerie.map((serie) {
                          if (controller.isSelectNiveauSerie.isEmpty) null;
                          bool isChecked = controller.isSelectNiveauSerie
                              .contains(serie.serie == ""
                                  ? serie.libSerie
                                  : serie.serie);
                          return ConstrainedBox(
                            constraints:
                                BoxConstraints(minWidth: 95, maxWidth: 100),
                            child: controlleCheckBox.checkboxListTile(
                                procedure: (_) => controller.onSelectCheckBox(
                                    serie.serie == ""
                                        ? serie.libSerie
                                        : serie.serie),
                                titre: serie.serie == ""
                                    ? serie.libSerie
                                    : serie.serie,
                                isSelect: isChecked),
                          );
                        }).toList(),
                      )),
                )),
          ),
          ////// VALIDATION
          Expanded(
              child: SizedBox(
            width: double.infinity,
            child: TButton.elevatedButton(
                text: TText.validation.tr, onPressed:onPressed??(){}),
          ))
        ],
      ),
    );
  }
}
