import 'package:ecole/Configs/cammon/widgets/layouts/templates/site_template.dart';
import 'package:flutter/material.dart';

import 'responsible/create_employe_desktop.dart';
import 'responsible/create_employe_mobile.dart';
import 'responsible/create_employe_tablet.dart';

class TCreateEmployePrincipaleScreen extends StatelessWidget {
  const TCreateEmployePrincipaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: TCreateEmployeDesktopScreen(),
      tablet: TCreateEmployeTabletScreen(),
      mobile: TCreateEmployeMobileScreen(),
    );
  }
}