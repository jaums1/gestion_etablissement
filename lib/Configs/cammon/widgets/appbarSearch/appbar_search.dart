import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/Constant/texte_string.dart';
import '../buttons/button.dart';

class TAppBarSearch extends StatelessWidget {
  const TAppBarSearch({super.key, this.titre, this.onPressed,
   this.add, this.isAdd=true});
  final String? titre;
  final VoidCallback? onPressed;
  final String? add;
  final bool? isAdd;
  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [
          Expanded(
            flex: 5,
            child: Text("${TText.recherche} $titre",maxLines: 1,overflow: TextOverflow.ellipsis,)),

         isAdd!?   Expanded(child: SizedBox(width: 10,
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TButton.iconButton(
                        text: "${TText.add} $add",icon: Iconsax.add,
                        onPressed: onPressed,
                        // onPressed: () => TElevePage().H_PageShowDialogNouveau(),
                      )
        ])
                      )
                      ):SizedBox(),
        ],
      );
  }
}