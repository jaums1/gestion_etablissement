import 'package:ecole/Employe/Controller/employe_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../Configs/cammon/widgets/Bilan/bilan_nombre.dart';
import '../../../../Configs/cammon/widgets/Data_table/table_header.dart';
import '../../../../Configs/cammon/widgets/appbar/action_appbar.dart';
import '../../../../Configs/cammon/widgets/appbar/appbar_header_screen.dart';
import '../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';

import '../../../../Configs/utils/Constant/texte_string.dart';
import '../../../Controller/employe_controller.dart';
import '../../../Controller/employe_filtre.dart';
import 'widget/employe_data_table.dart';

class TEmployeDesktopScreen extends StatelessWidget {
  const TEmployeDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TEmployeController>();
    return TAppBarHeaderScreen(
      action: [
        TActionAppBarIcon(
          
          onRefreshPressed: () async => await controller.H_RecupeData(),
        )
      ],
      title: TText.titreAffichageEmploye,
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
                                  titre: controller.homme.value.toString(),
                                  sousTitre: TText.bilanHommeEmploye,
                                )),
                          ),
                          Obx(() => SizedBox(
                                // width: 150,
                                child: TBilanNombre(
                                  color: Colors.pink,
                                  icons: Iconsax.woman,
                                  titre: controller.femme.value.toString(),
                                  sousTitre: TText.bilanFemmeEmploye,
                                ),
                              )),
                          SizedBox(
                            // width: 150,
                            child: Obx(() => TBilanNombre(
                                  color: Colors.blue,
                                  icons: Iconsax.people,
                                  titre: controller.total.value.toString(),
                                  sousTitre: TText.bilanTotalEmploye,
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
                      buttonText: "J'enregistre un Employe",
                      onChanged: (value)=> TEmployeFiltre().H_FiltreElement(param: value),
                      onPressed:() => TEmployePage().H_PageNouveau(),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: EmployeDataTable(),
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
