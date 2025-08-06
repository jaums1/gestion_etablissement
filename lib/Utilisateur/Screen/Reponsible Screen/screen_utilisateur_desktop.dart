import 'package:ecole/Configs/cammon/widgets/containers/rounded_container_create.dart';

import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Login/Controller/user_controller.dart';
import 'package:ecole/Login/Controller/user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../Configs/cammon/widgets/Bilan/bilan_nombre.dart';
import '../../../Configs/cammon/widgets/Data_table/table_header.dart';
import '../../../Configs/cammon/widgets/appbar/action_appbar.dart';
import '../../../Configs/cammon/widgets/appbar/appbar_header_screen.dart';
import '../../../Login/Controller/user_filtre.dart';
import '../../Data/utilisateur_database.dart';

class TUtilisateurDesktopScreen extends StatelessWidget {
  const TUtilisateurDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TUserController>();
    return TAppBarHeaderScreen(
      action: [
        TActionAppBarIcon(
          iconSize: 28,
          onRefreshPressed: () async => await controller.H_RecupeData(),
        )
      ],
      title: TText.titreAffichageUtilisateur,
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
                                  color: Colors.red,
                                  icons: Iconsax.user_remove,
                                  titre: controller.adminTotal.value.toString(),
                                  sousTitre: TText.bilanCompteAdmin,
                                )),
                          ),
                          Obx(() => SizedBox(
                                // width: 150,
                                child: TBilanNombre(
                                  color: Colors.green,
                                  icons: Iconsax.user_remove,
                                  titre: controller.autreTootal.value.toString(),
                                  sousTitre: TText.bilanCompteAutre,
                                ),
                              )),
                          SizedBox(
                            // width: 150,
                            child: Obx(() => TBilanNombre(
                                  color: Colors.blue,
                                  icons: Iconsax.user_remove,
                                  titre: controller.total.value.toString(),
                                  sousTitre: TText.bilanCompteTotal,
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
                      buttonText: "Je créer un compte",
                      onChanged: (value)=> TUtilisateurFiltre().H_FiltreElement(param: value),
                      onPressed:() => TUtilisateurPage().H_PageNouveau(),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: TUtilisateurDataTable(),
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
