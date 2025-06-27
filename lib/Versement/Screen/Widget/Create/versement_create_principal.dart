import 'package:ecole/Configs/cammon/widgets/layouts/templates/site_template.dart';
import 'package:flutter/material.dart';

import 'responsible/create_versement_desktop.dart';
import 'responsible/create_versement_mobile.dart';
import 'responsible/create_versement_tablet.dart';

class TCreateVersementPrincipaleScreen extends StatelessWidget {
  const TCreateVersementPrincipaleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    
    return TSiteTemplate(
      desktop: TCreateVersementDesktopScreen(),
      tablet: TCreateVersementTabletScreen(),
      mobile: TCreateVersementMobileScreen(),
    );
  }
}