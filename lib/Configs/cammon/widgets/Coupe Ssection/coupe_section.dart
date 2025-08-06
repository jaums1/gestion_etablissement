import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:flutter/material.dart';

class TCoupeSectionTitre extends StatelessWidget {
  const TCoupeSectionTitre({super.key, this.titre, this.color=TColors.primary});
final String? titre;
final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Text(titre.toString().toUpperCase(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color
        ),softWrap: true,maxLines: 1,overflow: TextOverflow.ellipsis,),
    
        Flexible(
          child: SizedBox(
            width: double.infinity,
            child: Divider(
              thickness: 0.3,
            ),
          )),
      ],
    );
  }
}