import 'package:ecole/Configs/cammon/widgets/layouts/templates/site_template.dart';
import 'package:flutter/material.dart';
import 'responsible/details_inscription_desktop.dart';
import 'responsible/details_inscription_tablet.dart';
import 'responsible/details_inscription_mobile.dart';

class TDetailsInscriptionPrincipal extends StatelessWidget {
  const TDetailsInscriptionPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: TDetailsInscriptionDesktopView(),
      tablet: TDetailsInscriptionTabletView(),
      mobile: TDetailsInscriptionMobileView(), 
    );
  }
} 