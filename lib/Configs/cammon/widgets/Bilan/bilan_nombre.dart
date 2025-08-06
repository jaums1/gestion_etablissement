import 'package:flutter/material.dart';

import '../containers/rounded_container_create.dart';
import '../texts/text_widget.dart';

class TBilanNombre extends StatelessWidget {
  const TBilanNombre({super.key, this.icons, this.color=Colors.black, this.titre, this.sousTitre});
  final IconData? icons;
  final Color? color;
  final String? titre;
  final String? sousTitre;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainerCreate(
          child: Row(
          spacing: 10,
          children: [
          CircleAvatar(
          backgroundColor: color!.withValues(alpha:  0.2),
          child: Icon(icons, color: color),
          ),
                  
           SizedBox(
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                   Flexible(
                     child: TTextCustom.title(text: titre??0.toString(),size: 19,fontWeight: FontWeight.w500,
                     ),
                   ),
                  Flexible(
                  
                    child: TTextCustom.subtitle(text: sousTitre!,fontWeight: FontWeight.normal,size: 15,
                    color: Colors.black.withValues(alpha: 0.7)),
                  ),
                            
                            ],
                          ),
                        )
                    ],
                  ),
                ) ;
  }
}