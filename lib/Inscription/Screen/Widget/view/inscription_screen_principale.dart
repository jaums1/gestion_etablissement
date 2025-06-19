import 'package:ecole/Configs/cammon/widgets/layouts/templates/site_template.dart';
import 'package:flutter/material.dart';
import '../Create/responsible/create_inscription_desktop.dart';
import 'responsible/inscription_desktop_screen.dart';
import 'responsible/inscription_tablet_screen.dart';
import 'responsible/inscription_mobile_screen.dart';


class TInscriptionScreenPrincipale extends StatelessWidget {
  const TInscriptionScreenPrincipale({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: TCreateInscriptionDesktopForm(),
      // desktop: TInscriptionDesktopScreen(),
      tablet: TInscriptionTabletScreen(),
      mobile: TInscriptionMobileScreen(), 
    );
  }
} 