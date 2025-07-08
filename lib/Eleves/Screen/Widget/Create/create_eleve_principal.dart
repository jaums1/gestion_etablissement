import 'package:ecole/Configs/cammon/widgets/layouts/templates/site_template.dart';
import 'package:flutter/material.dart';
import 'responsible/create_eleve_desktop.dart';
import 'responsible/create_eleve_mobile.dart';
import 'responsible/create_eleve_tablet.dart';

class TCreateElevePrincipaleScreen extends StatelessWidget {
  const TCreateElevePrincipaleScreen({super.key});

  @override
 
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: TCreateEleveDesktopScreen(),
      tablet: TCreateEleveTabletScreen(),
      mobile: TCreateEleveMobileScreen(),
    );
  }
}