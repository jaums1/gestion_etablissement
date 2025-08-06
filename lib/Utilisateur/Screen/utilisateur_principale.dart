import 'package:flutter/material.dart';

import '../../Configs/cammon/widgets/layouts/templates/site_template.dart';
import 'Reponsible Screen/screen_utilisateur_desktop.dart';
import 'Reponsible Screen/screen_utilisateur_mobile.dart';
import 'Reponsible Screen/screen_utilisateur_tablet.dart';

class TUtilisateurPrincipalScreen extends StatelessWidget {
  const TUtilisateurPrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  TSiteTemplate(
      desktop: TUtilisateurDesktopScreen(),
      tablet: TUtilisateurTabletScreen(),
      mobile: TUtilisateurMobileScreen(),
    );
  }
}