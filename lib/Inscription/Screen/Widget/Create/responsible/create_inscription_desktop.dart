import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:flutter/material.dart';
import '../../../../../Configs/cammon/widgets/Create_form/create_form.dart';
import '../../../../../Configs/routes/route.dart';
import '../widget/info_eleve.dart';

class TCreateInscriptionDesktopForm extends StatelessWidget {
  
  const TCreateInscriptionDesktopForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TCreateForm(
       route: TRoutes.inscription,
       titre: TText.Inscription,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              //// ELEVE
             InfoEleveInscription()
          
          ],
        )
    );
  }
}