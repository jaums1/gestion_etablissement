
import 'package:ecole/Configs/utils/Device/devices_utility.dart';
import 'package:flutter/material.dart';
import '../../../Configs/cammon/widgets/layouts/templates/login_template.dart';
import '../../../Configs/utils/Constant/texte_string.dart';
import 'Sous widget/login_form.dart';
import 'Sous widget/login_header.dart';

class TLoginMobileScreen extends StatelessWidget {
  const TLoginMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: TColors.softGrey,
      body: Center(
         child: TLoginTemplate(
          fermer: TDeviceUtility.isDesktop(),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ////Header
              TLoginHeader(titre: TText.loginTitle,soustitre: TText.loginSubTitle,),
              /// FORMULAIRE
              TLoginForm()
            ],
          ),
         ),
        ),
    );
  }
}