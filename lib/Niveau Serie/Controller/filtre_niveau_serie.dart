import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Configs/utils/Implements/filtre_data.dart';
import 'package:ecole/Niveau%20Serie/Controller/niveau_serie_controller.dart';
import 'package:ecole/Niveau%20Serie/Controller/page_niveau_serie_model.dart';
import 'package:get/get.dart';

class TFiltreNiveauSerie with TFiltre {
    final controller = Get.find<TNiveauSerieController>();
    final controllerPage = Get.find<TPageNiveauSerieController>();

  @override
  void H_FiltreElement({String param = ""}) {
   controller.dataTableFiltreNiveauSerie.value = controller.dataTableNiveauSerie.where(
    (e)=> e.niveauSerie!.toLowerCase().contains(param.toLowerCase())
    ).toList();
  }

  void H_RecupModif({int? Id,int? iDNiveauSerie}){
    controller.H_Initialise();
    controller.isSelectSerie.value = controller.dataTableNiveauSerie.where(
    (e)=> e.iDNiveauScolaire== Id
    ).map((data)=> data.serie!).toList();

    ///// RECUPERER DES INFORMATIONS DE NIVEAU SCOLAIRE
     controller.onIndexData(iDNiveauSerie);
     controller.onSelectCombo(controller.dataNiveauSerieModel.niveau);
   ////// RECUPERATION DE SERIE
    for (var element in controller.isSelectSerie) {
      int index = controller.controllerSerie.onIndexData(element=="Néant"?"":element);
      if(index==-1) return;
       controller.dataSerieModel = controller.controllerSerie.dataTableSerie[index];
     controller.dataNiveauSerieModel.dataTable.add(controller.dataSerieModel);
    }
    controller.action =TraitementAction.modifier.name;
   controllerPage.nextPage();
  }

}