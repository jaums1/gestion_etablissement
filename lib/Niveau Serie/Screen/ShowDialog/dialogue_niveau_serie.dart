import 'package:ecole/Configs/cammon/widgets/buttons/button.dart';
import 'package:ecole/Configs/utils/Device/devices_utility.dart';
import 'package:ecole/Niveau%20Serie/Controller/niveau_serie_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Configs/cammon/widgets/Data_table/table_header.dart';
import '../../../Scolarite/Controller/scolarite_controller.dart';
import '../../Controller/filtre_niveau_serie.dart';
import '../../Data/datatable_niveauserie.dart';

class TDialogueNiveauSerie extends StatelessWidget {
  final controller = Get.find<TNiveauSerieController>();
  final controllerSc = Get.find<TScolariteController>();
   TDialogueNiveauSerie({super.key, this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    
    final controllerFiltre = TFiltreNiveauSerie();

    controller.dataTableSelectNiveauSerie.value= controllerSc.variable.DataTableNiveauSerie.map(
      (e)=>e
      ).toList();
    return SizedBox(
      width: 600,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         ////// HEADER
          Padding(
            padding: const EdgeInsets.only(bottom:  8.0),
            child: TTableHeader(buttonText: "J'enregistre un niveau serie",
            onChanged:(value)=>controllerFiltre.H_FiltreElement(param: value),
             onPressed: (){}
            ),
          ),
          
         ////// BODY
         SizedBox(height:MediaQuery.of(context).size.height*0.23,
          child: TDataTableNiveauSerie(controller: controller,)),
         ////// FOOTER
         Padding(
           padding: const EdgeInsets.only(top:  10.0),
           child: Align(
            alignment: Alignment.centerRight,
             child: SizedBox(
              width:TDeviceUtility.isMobileScreen(context)?100:
              TDeviceUtility.isDesktopScreen(context)? MediaQuery.of(context).size.width*0.08
              :MediaQuery.of(context).size.width*0.2,
              child: TButton.elevatedButton(text: "Valider",onPressed:onPressed,),
             ),
           ),
         ),
          
        ],
      ),
    );
  }
} 