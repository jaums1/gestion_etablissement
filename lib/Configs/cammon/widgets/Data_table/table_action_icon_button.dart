import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TTableActionIconButtons extends StatelessWidget {
  const TTableActionIconButtons(
      {super.key,
      this.view=false,
      this.edit = true,
      this.delete=true ,
      this.onViewPressed,
      this.onEditPressed,
      this.iconSize=24,
      this.onDeletePressed,
      this.refresh=false,
       this.onRefreshPressed});
  final bool view;
  final bool edit;
  final bool delete;
  final bool refresh;
  final double? iconSize;
  final VoidCallback? onViewPressed;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onRefreshPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(refresh) Tooltip(message: "Actualiser",child: IconButton(onPressed: onRefreshPressed,iconSize: iconSize ,icon: Icon(Iconsax.refresh_circle,color: TColors.primary,))),
        if(view) Tooltip(message: "Détails",child: IconButton(onPressed: onViewPressed,iconSize: iconSize ,icon: Icon(Iconsax.eye,color: TColors.darkGrey,))),
        if(edit) Tooltip(message: "Modifier",child: IconButton(onPressed: onEditPressed,iconSize: iconSize , icon: Icon(Iconsax.pen_add,color: TColors.primary,))),
        if(delete) Tooltip(message: "Supprimer",child: IconButton(onPressed: onDeletePressed,iconSize: iconSize , icon: Icon(Iconsax.trash,color: TColors.error,))),
      ],
    );
  }
}