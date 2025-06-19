import 'package:ecole/Configs/cammon/widgets/layouts/templates/site_template.dart';
import 'package:ecole/Configs/routes/route.dart';
import 'package:flutter/material.dart';

import 'responsible/create_classe_desktop.dart';
import 'responsible/create_classe_mobile.dart';
import 'responsible/create_classe_tablet.dart';

class TCreateClassePrincipaleScreen extends StatelessWidget {
  const TCreateClassePrincipaleScreen({super.key, this.route =TRoutes.classe});
 final String? route;
  @override
  Widget build(BuildContext context) {
    
    return TSiteTemplate(
      desktop: TCreateClasseDesktopScreen(),
      tablet: TCreateClasseTabletScreen(),
      mobile: TCreateClasseMobileScreen(),
    );
  }
}