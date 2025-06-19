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
      this.onDeletePressed});
  final bool view;
  final bool edit;
  final bool delete;
  final double? iconSize;
  final VoidCallback? onViewPressed;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(view) IconButton(onPressed: onViewPressed,iconSize: iconSize ,icon: Icon(Iconsax.eye,color: TColors.darkGrey,)),
        if(edit) IconButton(onPressed: onEditPressed,iconSize: iconSize , icon: Icon(Iconsax.pen_add,color: TColors.primary,)),
        if(delete) IconButton(onPressed: onDeletePressed,iconSize: iconSize , icon: Icon(Iconsax.trash,color: TColors.error,)),
      ],
    );
  }
}