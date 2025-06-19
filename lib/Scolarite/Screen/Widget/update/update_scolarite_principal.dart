import 'package:ecole/Configs/cammon/widgets/layouts/templates/site_template.dart';
import 'package:flutter/material.dart';

import 'responsible/update_scolarite_desktop.dart';
import 'responsible/update_scolarite_mobile.dart';
import 'responsible/update_scolarite_tablet.dart';


class TUpdateScolaritePrincipaleScreen extends StatelessWidget {
  const TUpdateScolaritePrincipaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: TUpdateScolariteDesktopScreen(),
      tablet: TUpdateScolariteTabletScreen(),
      mobile: TUpdateScolariteMobileScreen(),
    );
  }
}