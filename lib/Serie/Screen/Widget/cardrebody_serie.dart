import 'package:ecole/Configs/cammon/widgets/checkbox/checkbox.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../Configs/utils/Constant/sizes.dart';
import '../../Controller/serie_controller.dart';

class TCardreBodySerie extends StatelessWidget {
  const TCardreBodySerie({super.key, this.titreSerie});
 final String? titreSerie;
  @override
  Widget build(BuildContext context) {
    final controllerSerie = Get.find<TSerieController>();
    final controlleCheckBox = TCheckBox();
    return Padding(
        padding: EdgeInsets.only(left: TSizes.sm, right: TSizes.sm),
        child: Wrap(
          children: controllerSerie.DataTableSerie.map((serie) {
            bool isChecked = controllerSerie.isSelectSerie.contains(serie.serie==""?serie.libSerie:serie.serie);
            return Padding(
              padding: EdgeInsets.all(2),
              child: SizedBox(
                width: 145,
                child: controlleCheckBox.checkboxListTile(
                    procedure: (_) => controllerSerie.onSelectCheckBox(
                        lib: serie.serie==""?serie.libSerie:serie.serie,),
                    titre: serie.serie==""?serie.libSerie:serie.serie,
                    isSelect: isChecked),
              ),
            );
          }).toList(),
        ));
  }
}
