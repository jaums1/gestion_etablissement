import 'package:ecole/Etablissement/Controller/etablissement_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Configs/cammon/widgets/layouts/templates/site_template.dart';
import '../Configs/cammon/widgets/win/window.dart';
import '../Configs/utils/Device/devices_utility.dart';

import '../Configuration/Screen/configuration.dart';
import 'dashboard.dart';
import 'screen/widget/menu_mobile.dart';
import 'screen/widget/menu_tablet.dart';

class TMenuPrincipalScreen extends StatelessWidget {
  final controller = Get.find<TEtablissementController>();
  TMenuPrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TDeviceUtility.isDesktop() == true ? TWindow().FullWindow() : null;
  
    return Obx(() => (controller.dataEtablissementModel.value.idEtablissement==0 || controller.dataEtablissementModel.value.idEtablissement==null) ||
    controller.dataEtablissementModel.value.etatActivation==false?   
        TConfigurationScreen()
        :TSiteTemplate(
          useLayout: true,
          mobile: MenuMobileScreen(),
          desktop: TDashboardScreen(),
          tablet: MenuTabletScreen(),
        ));
  }
}
