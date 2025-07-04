
import 'package:ecole/Configs/cammon/widgets/texts/text_widget.dart';
import 'package:ecole/Configs/utils/formatters/formatters.dart';
import 'package:flutter/material.dart';

class TBilanMontant extends StatelessWidget {
  const TBilanMontant({
    super.key,this.color =Colors.red, this.montant, this.titre
  });
 final Color? color;
 final int? montant;
 final String? titre;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 4,
            height: 50,
            color: color,
          ),
          SizedBox(width: 8,),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                TTextCustom.title(text: TFormatters.formatCurrency(montant),size: 17),
                // Text("$titre",style: Theme.of(context).textTheme.bodyMedium),
                TTextCustom.subtitle(text: titre!,size: 14)
                
              ],
            ),
          )
        ],
      ),
    );
  }
}