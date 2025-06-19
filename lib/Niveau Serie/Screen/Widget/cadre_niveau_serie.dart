import 'package:ecole/Niveau%20Serie/Controller/niveau_serie_controller.dart';
import 'package:ecole/Serie/Controller/serie_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Configs/cammon/widgets/checkbox/checkbox.dart';
import '../../../Configs/utils/Constant/sizes.dart';

class TCadreNiveauSerie extends StatelessWidget {
  const TCadreNiveauSerie({super.key});

  @override
  Widget build(BuildContext context) {
    final controlleCheckBox = TCheckBox();
    final controllers = Get.find<TNiveauSerieController>();
    final controllerSerie = Get.find<TSerieController>();
    return Obx(
         ()=>  Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical:  TSizes.sm,horizontal: TSizes.md),
                      child: Text("Serie scolaire",
                      style: Theme.of(context).textTheme.bodyMedium,
                      )),
                  SizedBox(height: 2,),
                  Divider(height: 0.5,thickness: 0.3,),
                  //// SERIE SCOLAIRE 
                  Padding(
                      padding: EdgeInsets.only(left: TSizes.sm, right: TSizes.sm),
                      child: Wrap(
                        children: controllerSerie.dataTableSerie.map((serie) {
                          bool isChecked =
                              controllers.isSelectSerie.contains(serie.serie==""? serie.libSerie:serie.serie);
                          return Padding(
                            padding: EdgeInsets.all(2),
                            child: SizedBox(
                              width: 145,
                              child: controlleCheckBox.checkboxListTile(
                                  procedure: (_) => controllers.onSelectCheckBox(serie.serie==""? serie.libSerie:serie.serie),
                                  titre: serie.serie==""? serie.libSerie:serie.serie,
                                  isSelect: isChecked),
                            ),
                          );
                        }).toList(),
                      ))
                ],
              ),
            ),
    );
  }
}