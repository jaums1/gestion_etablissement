import 'package:ecole/Utilisateur/Screen/Create/widget/form_utilisateur.dart';
import 'package:flutter/material.dart';

import '../../../widget/hearder_utilisateur.dart';

class CreateUtilisateurDesktopForm extends StatelessWidget {
  const CreateUtilisateurDesktopForm({super.key});

  @override
  Widget build(BuildContext context) {
    return HearderUtilisateur(
      child: SizedBox(
        width: 400,
        child: FormUtilisateur(),
      ),
    );
  }
}