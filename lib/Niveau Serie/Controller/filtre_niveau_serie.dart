import 'package:ecole/Configs/utils/Implements/filtre_data.dart';
import 'package:ecole/Niveau%20Serie/Controller/niveau_serie_controller.dart';

import 'package:get/get.dart';

class TFiltreNiveauSerie with TFiltre {
    final controller = Get.find<TNiveauSerieController>();
   

  @override
  void H_FiltreElement({String param = ""}) {
   controller.DataTableFiltreNiveauSerie.value = controller.DataTableNiveauSerie.where(
    (e)=> e.niveauSerie!.toLowerCase().contains(param.toLowerCase())
    ).toList();
  }


}