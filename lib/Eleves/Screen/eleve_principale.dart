import 'package:flutter/material.dart';

import '../../Configs/cammon/widgets/layouts/templates/site_template.dart';
import 'view/responsible/eleve_desktop_screen.dart';
import 'view/responsible/eleve_mobile_screen.dart';
import 'view/responsible/eleve_tablet_screen.dart';

class TElevePrincipaleScreen extends StatelessWidget {
  const TElevePrincipaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: TEleveDesktopScreen(),
      tablet: TEleveTabletScreen(),
      mobile: TEleveMobileScreen(),
    );
  }
}