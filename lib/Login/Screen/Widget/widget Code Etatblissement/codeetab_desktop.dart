
import 'package:ecole/Configs/cammon/widgets/layouts/templates/login_template.dart';
import 'package:flutter/material.dart';


import '../../../../Configs/utils/Constant/colors.dart';
import '../../../../Configs/utils/Constant/texte_string.dart';
import '../Sous widget/login_header.dart';
import 'Sous widget/codeetab_form.dart';

class TCodeEtablissementDesktop extends StatelessWidget {
  const TCodeEtablissementDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.softGrey,
      body: Center(
        child: TLoginTemplate(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             ///// HEADER
             TLoginHeader(titre: TText.codeEtatblissementTitle,soustitre: TText.codeEtatblissementSubTitle,),

             /////FORMULAIRE
             TCodeEtablissementForm()
            ],
          ),
        ),
      ),
    );
  }
}