import 'package:ecole/Configs/utils/formatters/formatters.dart';
import 'package:flutter/material.dart';

import '../containers/rounded_container_create.dart';
import '../texts/text_widget.dart';

class TBilanMontantFondBlanc extends StatelessWidget {
  const TBilanMontantFondBlanc({super.key, this.icons, this.color=Colors.black, this.montant=0, this.sousTitre});
  final IconData? icons;
  final Color? color;
  final int? montant;
  final String? sousTitre;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainerCreate(
          child: SizedBox(
            width: 170,
            child: Row(
            spacing: 10,
            children: [
              Container(
               padding: EdgeInsets.symmetric(vertical: 5), 
              width: 4,
              height: double.infinity,
              color: color,
            ),
                     
                  
             SizedBox(
              width: 155,
            child: Column(
              // spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
                    TTextCustom.title(text:TFormatters.formatCurrency(montant),maxLines: 1 ,color: color),
                    Flexible(
                      child: TTextCustom.subtitle(text: sousTitre!,fontWeight: FontWeight.normal,size: 15,
                      color: Colors.black.withValues(alpha: 0.7)),
                    ),
                              
                              ],
                            ),
                          )
                      ],
                    ),
          ),
                ) ;
  }
}