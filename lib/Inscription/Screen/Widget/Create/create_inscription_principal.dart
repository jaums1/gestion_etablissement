import 'package:ecole/Configs/cammon/widgets/layouts/templates/site_template.dart';
import 'package:flutter/material.dart';
import 'responsible/create_inscription_desktop.dart';
import 'responsible/create_inscription_tablet.dart';
import 'responsible/create_inscription_mobile.dart';

class TCreateInscriptionPrincipal extends StatelessWidget {
  const TCreateInscriptionPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: TCreateInscriptionDesktopForm(),
      tablet: TCreateInscriptionTabletForm(),
      mobile: TCreateInscriptionMobileForm(), 
    );
  }
} 