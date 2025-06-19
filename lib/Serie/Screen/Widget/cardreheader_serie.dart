import 'package:ecole/Configs/cammon/widgets/checkbox/checkbox.dart';
import 'package:ecole/Etablissement/Controller/etablissement_controller.dart';
import 'package:ecole/Serie/Controller/serie_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Configs/utils/Constant/sizes.dart';
import 'cardrebody_serie.dart';

class TCardreHeaderSerie extends StatelessWidget {
  const TCardreHeaderSerie({super.key});

  @override
  Widget build(BuildContext context) {
     final controllerEtatblissement = Get.find<TEtablissementController>();
     final controllerSerie = Get.find<TSerieController>();
     final controlleCheckBox = TCheckBox();
     final typeEnseignement =controllerEtatblissement.selectTypeEnseignement.value;
     
    return Obx((){
     controllerSerie.H_RecupeData(param:typeEnseignement);
        if (controllerSerie.dataTableSerie.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
     
      bool isCheckedTitre = controllerSerie.isSelectTitreSerie.contains(typeEnseignement);
      return  Padding(padding: EdgeInsets.only(bottom: TSizes.md),
          child:Container(
             decoration: BoxDecoration(color: Colors.white,),
             child:Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                   padding: const EdgeInsets.symmetric(vertical: 8),
                   child: 
                   controlleCheckBox.checkboxListTile(
                        isMajuscule: true,
                        titre: typeEnseignement,
                        procedure: (_) => controllerSerie.onSelectCheckBox(
                        titre:typeEnseignement),
                        isSelect: isCheckedTitre)
                          ),
               SizedBox(height: 2,),
               Divider(height: 0.5,thickness: 0.3,),
               TCardreBodySerie(titreSerie:typeEnseignement ,),
              ],
             ) )
             
             );}
    });
  }
}