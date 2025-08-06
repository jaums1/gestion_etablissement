import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/Bilan/bilan_nombre.dart';
import '../../../../../Configs/cammon/widgets/Data_table/table_header.dart';
import '../../../../../Configs/cammon/widgets/appbar/action_appbar.dart';
import '../../../../../Configs/cammon/widgets/appbar/appbar_header_screen.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/utils/Constant/texte_string.dart';
import '../../../../Controller/scolarite_controller.dart';
import '../../../../Controller/scolarite_filtre.dart';
import '../../../../Controller/scolarite_page.dart';
import '../widget/scolarite_data_table.dart';


class TScolariteDesktopScreen extends StatelessWidget {
  const TScolariteDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TScolariteController>();
    return  TAppBarHeaderScreen(
      action: [
        TActionAppBarIcon(
          onRefreshPressed: () async => await controller.H_RecupeData(),
        )
      ],
      title: TText.titreAffichageScolalrite,
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
                                  icons: Iconsax.wallet,
                                  titre: controller.bilanScolarite.value.toString(),
                                  sousTitre: TText.bilanTotalScolarite,
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
                      buttonText: "J'enregistre une Scolarité",
                      onChanged: (value)=> TScolariteFiltre().H_FiltreElement(param: value),
                      onPressed:() => TScolaritePage().H_PageNouveau(),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: TClasseDataTable(),
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
