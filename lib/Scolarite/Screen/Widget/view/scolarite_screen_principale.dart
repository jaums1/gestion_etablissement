import 'package:ecole/Configs/cammon/widgets/layouts/templates/site_template.dart';
import 'package:flutter/material.dart';
import 'responsible/scolarite_desktop_screen.dart';
import 'responsible/scolarite_mobile_screen.dart';
import 'responsible/scolarite_tablet_screen.dart';

class TScolaritePrincipaleScreen extends StatelessWidget {
  const TScolaritePrincipaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: TScolariteDesktopScreen(),
      mobile: TScolariteMobileScreen(),
      tablet: TScolariteTabletScreen(),
    );
  
  }
}

