import 'package:ecole/Cycle/Controller/cycle_controller.dart';
import 'package:ecole/Niveau_Scolaire/Controller/niveauscolaire_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Configs/cammon/widgets/checkbox/checkbox.dart';
import '../../../Configs/utils/Constant/sizes.dart';

class TCarderNiveauScolaireScreen extends StatelessWidget {
  const TCarderNiveauScolaireScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controllerCycle = Get.find<TCycleController>();
    final controlleCheckBox = TCheckBox();
    
    final controllers = Get.find<TNiveauScolaireController>();
    controllers.H_RecupeData(param: controllerCycle.selectRadio.value);
    return Obx(() {
      bool isCheckedTitreNiveau = controllers.isSelectTitreNiveau
          .contains(controllerCycle.selectRadio.value);

      return Column(children: [
        Padding(
          padding: EdgeInsets.only(bottom: TSizes.md),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: controlleCheckBox.checkboxListTile(
                        isMajuscule: true,
                        procedure: (_) => controllers.onSelectCheckBox(
                            titreNiveau: controllerCycle.selectRadio.value),
                        titre: controllerCycle.selectRadio.value,
                        isSelect: isCheckedTitreNiveau)),
                SizedBox(
                  height: 2,
                ),
                Divider(
                  height: 0.5,
                  thickness: 0.3,
                ),
                //// NIVEAU
                Padding(
                    padding: EdgeInsets.only(left: TSizes.sm, right: TSizes.sm),
                    child: Wrap(
                      children: controllers.dataTableNiveauEtude.map((niveau) {
                        bool isChecked =
                            controllers.isSelectNiveau.contains(niveau.niveau);
                        return Padding(
                          padding: EdgeInsets.all(2),
                          child: SizedBox(
                            width: 145,
                            child: controlleCheckBox.checkboxListTile(
                                procedure: (_) => controllers.onSelectCheckBox(
                                    libNiveau: niveau.niveau,
                                    titreNiveau:
                                        controllerCycle.selectRadio.value),
                                titre: niveau.niveau,
                                isSelect: isChecked),
                          ),
                        );
                      }).toList(),
                    ))
              ],
            ),
          ),
        ),
      ]);
    });
  }
}
