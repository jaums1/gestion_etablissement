import 'package:flutter/material.dart';

import 'Create/widget/info_classe.dart';

class ShowClasseDialog extends StatelessWidget {
  const ShowClasseDialog({super.key, this.argument});
 final String? argument;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 320,
      child: SingleChildScrollView(
        child: TClasseInformation(argument: argument!,show: true,),
      ),
    );
  }
}