import 'package:flutter/material.dart';

import '../../../utils/Constant/colors.dart';
import '../../../utils/Constant/sizes.dart';

class TTitlePage extends StatelessWidget {
  const TTitlePage({
    super.key, this.tilte, this.color=TColors.darkerGrey, this.sizes =3,this.padding=true
  });
final String? tilte;
final Color? color;
final double? sizes;
final bool? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding==false? EdgeInsets.zero :const EdgeInsets.symmetric(vertical:TSizes.sm,horizontal: TSizes.md,  ),
      child: Text(tilte!,style: Theme.of(context).textTheme.bodyMedium!.apply(
       color: color,fontSizeDelta: sizes!,letterSpacingDelta: 1.2
      ),),
    );
  }
}