import 'package:ecole/Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:flutter/material.dart';

class TActionAppBarIcon extends StatelessWidget {
  const TActionAppBarIcon(
      {super.key,
      this.view = false,
      this.edit = false,
      this.refresh = true,
      this.iconSize = 28,
      this.onViewPressed,
      this.onEditPressed,
      this.onRefreshPressed});
  final bool view;
  final bool edit;
  final bool refresh;
  final double? iconSize;
  final VoidCallback? onViewPressed;
  final VoidCallback? onEditPressed;
  final VoidCallback? onRefreshPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: TSizes.sm),
      child: TTableActionIconButtons(
        iconSize: iconSize,
        delete: false,
        edit: edit,
        view: view,
        refresh: refresh,
        onEditPressed: onEditPressed,
        onRefreshPressed: onRefreshPressed,
        onViewPressed: onViewPressed,
      ),
    );
  }
}