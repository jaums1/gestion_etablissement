import 'package:ecole/Configs/cammon/widgets/layouts/templates/site_template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Configs/routes/route.dart';
import 'responsible/create_eleve_desktop.dart';
import 'responsible/create_eleve_mobile.dart';
import 'responsible/create_eleve_tablet.dart';

class TCreateElevePrincipaleScreen extends StatelessWidget {
  const TCreateElevePrincipaleScreen({super.key,this.argument=TRoutes.eleve});
   final String? argument;
  @override
 
  Widget build(BuildContext context) {
   final action = Get.arguments;
    return TSiteTemplate(
      desktop: TCreateEleveDesktopScreen(argument: argument!,action: action,),
      tablet: TCreateEleveTabletScreen(argument: argument,action: action),
      mobile: TCreateEleveMobileScreen(argument: argument,action: action),
    );
  }
}