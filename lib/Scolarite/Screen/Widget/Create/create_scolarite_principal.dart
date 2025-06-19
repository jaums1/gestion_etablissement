import 'package:ecole/Configs/cammon/widgets/layouts/templates/site_template.dart';
import 'package:flutter/material.dart';

import 'responsible/create_scolarite_desktop.dart';
import 'responsible/create_scolarite_mobile.dart';
import 'responsible/create_scolarite_tablet.dart';

class TCreateScolaritePrincipaleScreen extends StatelessWidget {
  const TCreateScolaritePrincipaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: TCreateScolariteDesktopScreen(),
      tablet: TCreateScolariteTabletScreen(),
      mobile: TCreateScolariteMobileScreen(),
    );
  }
}