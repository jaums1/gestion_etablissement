import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:flutter/material.dart';

class TCoupeSectionTitre extends StatelessWidget {
  const TCoupeSectionTitre({super.key, this.titre, this.color=TColors.primary});
final String? titre;
final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(titre.toString().toUpperCase(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: color
          ),softWrap: true,maxLines: 1,overflow: TextOverflow.ellipsis,),
        ),
        // SizedBox(width: 10,),
        Expanded(
          flex: 2,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Divider(
              thickness: 0.3,
            ),
          )),
      ],
    );
  }
}