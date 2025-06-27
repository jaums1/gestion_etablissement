import 'package:ecole/Configs/cammon/widgets/layouts/templates/site_template.dart';
import 'package:flutter/material.dart';
import 'responsible/classe_desktop_screen.dart';
import 'responsible/classe_mobile_screen.dart';
import 'responsible/classe_tablet_screen.dart';

class TClassePrincipaleScreen extends StatelessWidget {
  const TClassePrincipaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: TClasseDesktopScreen(),
      mobile: TClasseMobileScreen(),
      tablet: TClasseTabletScreen(),
    );
  
  }
}


  // DesktopLayout(body: TClasseScreen(),);