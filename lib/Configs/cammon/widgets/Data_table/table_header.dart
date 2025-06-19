
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/Device/devices_utility.dart';
import '../buttons/button.dart';
import '../formulaire/form.dart';

class TTableHeader extends StatelessWidget {
  const TTableHeader({super.key, this.onPressed, this.buttonText, this.onChanged});
  final Function()? onPressed;
  final Function(dynamic)? onChanged;
  final String? buttonText;
  @override
  Widget build(BuildContext context) {
    final formulaire =TFormulaire();
    return Row(
      children: [
        ///// RECHERCHE
        Expanded(
          flex: TDeviceUtility.isDesktopScreen(context)?  2: 1,
          child:formulaire.textFormField(hintText:"Recherche...",iconPrefix: Iconsax.search_normal,
          isPadding: true,onChanged: onChanged
           ) ), 
            /// BUTTON
            
           Expanded(
          flex: TDeviceUtility.isDesktopScreen(context)? 3 : 1,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TButton.elevatedButton(text: buttonText,onPressed:onPressed),
            ],
          )),

       
      ],
    );
  }
}