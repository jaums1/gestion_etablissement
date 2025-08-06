import 'package:ecole/Eleves/Controller/eleve_controller.dart';
import 'package:ecole/Eleves/Controller/eleve_filtre.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../Configs/cammon/widgets/Bilan/bilan_nombre.dart';

import '../../../../Configs/cammon/widgets/Data_table/table_header.dart';
import '../../../../Configs/cammon/widgets/appbar/action_appbar.dart';
import '../../../../Configs/cammon/widgets/appbar/appbar_header_screen.dart';
import '../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../Configs/utils/Constant/texte_string.dart';
import '../../../Controller/eleve_page.dart';
import '../../../Data/data_eleve_table.dart';

class TEleveDesktopScreen extends StatelessWidget {
  final controller = Get.find<TEleveController>();
   TEleveDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
     
    return TAppBarHeaderScreen(
      action: [
        TActionAppBarIcon(
          onRefreshPressed: () async => await controller.H_RecupeData(),
        )
      ],
      title: TText.titreAffichageEleve,
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
                      Expanded(child: SizedBox()),
                      Expanded(
                          child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            // width: 150,
                            child: Obx(() => TBilanNombre(
                                  color: Colors.blue,
                                  icons: Iconsax.man,
                                  titre: controller.bilanHomme.value.toString(),
                                  sousTitre: TText.bilanHommeEleve,
                                )),
                          ),
                          Obx(() => SizedBox(
                                // width: 150,
                                child: TBilanNombre(
                                  color: Colors.pink,
                                  icons: Iconsax.woman,
                                  titre: controller.bilanFemme.value.toString(),
                                  sousTitre: TText.bilanFemmeEleve,
                                ),
                              )),
                          SizedBox(
                            // width: 150,
                            child: Obx(() => TBilanNombre(
                                  color: Colors.blue,
                                  icons: Iconsax.people,
                                  titre: controller.bilanTotal.value.toString(),
                                  sousTitre: TText.bilanTotalEleve,
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
                      buttonText:TText.buttonEnregistrerEleve,
                      onChanged: (value)=> TFiltreEleve().H_FiltreElement(param: value),
                      onPressed:() => TElevePage().H_PageNouveau(),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: EleveDataTable(),
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
