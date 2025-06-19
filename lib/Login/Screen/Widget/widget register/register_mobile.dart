import 'package:flutter/material.dart';

import '../../../../Configs/cammon/widgets/layouts/templates/login_template.dart';
// import '../../../../Configs/utils/Constant/colors.dart';
import '../../../../Configs/utils/Constant/texte_string.dart';
import '../Sous widget/login_header.dart';
import 'sous widget/register_form.dart';

class TRegisterMobileScreen extends StatelessWidget {
  const TRegisterMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: TColors.softGrey,
      body: TLoginTemplate(
        retour: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ///// HEADER
            TLoginHeader(titre: TText.registerSuperTitle,soustitre: TText.registerSubTitle,),
            //// BODY
            TRegisterForm()
            ],
          ),
        ),
    );
  }
}