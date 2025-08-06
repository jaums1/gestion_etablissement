import 'package:flutter/material.dart';

import '../Data_table/table_action_icon_button.dart';

class TTrainingSearch extends StatelessWidget {
  const TTrainingSearch({super.key, this.onEditPressed, this.onDeletePressed});
final VoidCallback? onEditPressed;
final VoidCallback? onDeletePressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
      TTableActionIconButtons(
      iconSize: 20,
      onEditPressed: onEditPressed,
      onDeletePressed: onDeletePressed,
        )
                        ],
                      );
  }
}