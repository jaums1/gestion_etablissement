import 'package:ecole/Utilisateur/Screen/Create/Responsible/create_utilisateur_desktop.dart';
import 'package:flutter/material.dart';
import '../../../Configs/cammon/widgets/layouts/templates/site_template.dart';
import 'Responsible/create_utilisateur_mobile.dart';
import 'Responsible/create_utilisateur_tablet.dart';

class CreateUtilisateurPrincipaleForm extends StatelessWidget {
  const CreateUtilisateurPrincipaleForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: CreateUtilisateurDesktopForm(),
      tablet: CreateUtilisateurTabletForm(),
      mobile: CreateUtilisateurMobileForm(),
    );
  }
}